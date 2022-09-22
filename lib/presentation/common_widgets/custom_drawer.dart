import 'package:challenge/core/colors.dart';
import 'package:challenge/core/assets.dart';
import 'package:challenge/core/styles.dart';
import 'package:challenge/presentation/favorites_page/favorites_page.dart';
import 'package:challenge/presentation/home_page/view/home_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../add_item_category_page/view/add_item_category_page.dart';

class CustomDrawer extends StatelessWidget with PreferredSizeWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      color: ColorsConst.drawerBackgroundColor,
      child: Center(
        child: ListView(
          children: [
            SizedBox(
              width: 300,
              height: 150,
              child: Image.asset(
                ImageAssetsConst.ctLogo,
              ),
            ),
            const SizedBox(height: 50),
            TextButton(
              onPressed: () {
                Navigator.of(context)
                    .popAndPushNamed(AddItemCategoryPage.routeName);
              },
              child: Text(
                'add_item_category'.tr(),
                style: StylesConst.drawerTextStyle,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).popAndPushNamed(HomePage.routeName);
              },
              child: Text('drawer_home_page_button_text'.tr(),
                  style: StylesConst.drawerTextStyle),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).popAndPushNamed(FavoritesPage.routeName);
              },
              child: Text('drawer_favorites_button_text'.tr(),
                  style: StylesConst.drawerTextStyle),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size(300, double.infinity);
}
