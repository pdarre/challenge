import 'package:challenge/core/colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../common_widgets/custom_drawer.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});
  static const String routeName = '/favorites-page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: ColorsConst.drawerIconColor),
        centerTitle: false,
        title: Text(
          'favorites_page_title'.tr(),
          style: TextStyle(
            color: ColorsConst.drawerIconColor,
          ),
        ),
      ),
    );
  }
}
