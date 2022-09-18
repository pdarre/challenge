import 'package:easy_localization/easy_localization.dart';
import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:challenge/utils/sizes_util.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static const String routeName = '/home-page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EasySearchBar(
        title: Text('home_page_appbar_title'.tr()),
        onSearch: (value) {
          // should call event with value data (bloc)
        },
      ),
      body: const HomePageBody(),
    );
  }
}

class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    List<bool> _isOpen;
    return Container(
      child: SingleChildScrollView(
        child: ExpansionPanelList(
          children: [
            ExpansionPanel(
              headerBuilder: (context, isOpen) {
                return const Text('panel');
              },
              body: const Text('contenido'),
              isExpanded: true,
            ),
          ],
          expansionCallback: (i, isOpen) {
            print(isOpen);
          },
        ),
      ),
    );
  }
}
