import 'package:easy_localization/easy_localization.dart';
import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/category.dart';
import '../../../di/injector.dart';
import '../bloc/categories_bloc.dart';
import '../bloc/products_bloc.dart';
import '../widgets/expandable_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static const String routeName = '/home-page';

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
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
        return BuildProductsProviderCard(category: categories[index]);
      },
    );
  }
}

class BuildProductsProviderCard extends StatelessWidget {
  final Category category;
  const BuildProductsProviderCard({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductsBloc>(
      create: (context) => ProductsBloc(locator.get()),
      child: BuildExpandableCard(
        category: category,
      ),
    );
  }
}
