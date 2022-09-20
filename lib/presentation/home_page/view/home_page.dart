import 'package:easy_localization/easy_localization.dart';
import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../di/injector.dart';
import '../bloc/home_bloc.dart';
// import 'package:challenge/utils/sizes_util.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static const String routeName = '/home-page';

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => HomeBloc(productUseCases: locator.get())),
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
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        // TODO update this to switch case
        if (state is HomeInitial) {
          return Center(
            child: TextButton(
              onPressed: () {
                BlocProvider.of<HomeBloc>(context, listen: false)
                    .add(GetProductsEvent(productUseCases: locator.get()));
              },
              child: const Text('get usuraios'),
            ),
          );
        } else if (state is HomeLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is HomeLoaded) {
          var prod = state.products;
          return ListView.builder(
            itemCount: prod.length,
            itemBuilder: ((context, index) {
              return Dismissible(
                key: Key(prod[index].name),
                child: ListTile(
                  leading: Image.network(prod[index].image),
                  title: Text(prod[index].name),
                  subtitle: Text(prod[index].description),
                  trailing: Text(prod[index].category),
                ),
              );
            }),
          );
        } else if (state is HomeException) {
          return Center(
            child: Text(state.exception),
          );
        }
        return Container();
      },
    );
  }
}
