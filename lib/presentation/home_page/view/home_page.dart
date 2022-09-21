import 'package:challenge/data/model/product.dart';
import 'package:challenge/presentation/home_page/widgets/slidable_widget.dart';
import 'package:dartz/dartz_unsafe.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/category.dart';
import '../../../di/injector.dart';
import '../bloc/categories_bloc.dart';
import '../bloc/products_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static const String routeName = '/home-page';

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // BlocProvider(create: (_) => ProductsBloc(locator.get())),
        BlocProvider(create: (_) => CategoriesBloc(locator.get())),
      ],
      child: Scaffold(
        appBar: EasySearchBar(
          title: Text('home_page_appbar_title'.tr()),
          onSearch: (value) {
            // should call event with value data (bloc)
          },
        ),
        drawer: const Drawer(),
        body: const HomePageBody(),
      ),
    );
  }
}

class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesBloc, CategoriesState>(
      builder: (context, state) {
        // TODO update this to switch case
        if (state is CategoriesInitial) {
          return Center(
            child: TextButton(
              onPressed: () {
                BlocProvider.of<CategoriesBloc>(context, listen: false)
                    .add(GetCategoriesEvent(locator.get()));
              },
              child: const Text('get categories'),
            ),
          );
        } else if (state is CategoriesLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is CategoriesLoaded) {
          var categories = state.categories;
          return BuildHomeListView(categories: categories);
        } else if (state is CategoriesException) {
          return Center(
            child: Text(state.exception),
          );
        }
        return Container();
      },
    );
  }
}

class BuildHomeListView extends StatelessWidget {
  final List<Category> categories;
  const BuildHomeListView({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: categories.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return BuildExpandableCard(category: categories[index]);
      },
    );
  }
}

class BuildExpandableCard extends StatefulWidget {
  final Category category;
  const BuildExpandableCard({super.key, required this.category});

  @override
  State<BuildExpandableCard> createState() => _BuildExpandableCardState();
}

class _BuildExpandableCardState extends State<BuildExpandableCard> {
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      //TODO probar pedir aca la lsita de productos
    });
    return BlocProvider<ProductsBloc>(
      create: (context) => ProductsBloc(locator.get()),
      child: ExpansionPanelList(
        expansionCallback: (panelIndex, isExpanded) {
          setState(() {
            widget.category.isExpanded = !isExpanded;
          });
        },
        animationDuration: const Duration(seconds: 2),
        children: [
          ExpansionPanel(
            headerBuilder: (BuildContext context, bool isExpanded) {
              return ListTile(
                title: Text(widget.category.name),
              );
            },
            body: BlocBuilder<ProductsBloc, ProductsState>(
              key: Key(widget.category.name),
              builder: (context, state) {
                //TODO buscar como armar la lista de productos de acuerdo a su categoria
                // faltaria llamar a GetProductsByCategory en ProductsBloc
                return Container();
              },
            ),
            // body: const ListTile(
            //   title: Text('list body'),
            // ),
            isExpanded: widget.category.isExpanded,
          ),
        ],
      ),
    );
  }
}
