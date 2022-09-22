import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/colors.dart';
import '../../../di/injector.dart';
import '../../common_widgets/custom_drawer.dart';
import '../bloc/add_category_bloc/add_category_bloc.dart';
import 'widgets/build_add_category_body.dart';
import 'widgets/build_add_item_body.dart';

class AddItemCategoryPage extends StatelessWidget {
  const AddItemCategoryPage({super.key});
  static const String routeName = '/add-item-category-page';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddCategoryBloc(locator.get()),
      child: Scaffold(
        drawer: const CustomDrawer(),
        appBar: AppBar(
          iconTheme: IconThemeData(color: ColorsConst.drawerIconColor),
          centerTitle: false,
          title: Text(
            'add_item_category_page_title'.tr(),
            style: TextStyle(
              color: ColorsConst.drawerIconColor,
            ),
          ),
        ),
        body: const BuildAddBody(),
      ),
    );
  }
}

class BuildAddBody extends StatefulWidget {
  const BuildAddBody({super.key});

  @override
  State<BuildAddBody> createState() => _BuildAddBodyState();
}

class _BuildAddBodyState extends State<BuildAddBody> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                flex: 2, child: Center(child: Text('add_category_text'.tr()))),
            Expanded(
              flex: 2,
              child: Switch(
                activeColor: ColorsConst.drawerBackgroundColor,
                inactiveThumbColor: ColorsConst.drawerBackgroundColor,
                value: isSwitched,
                onChanged: (value) {
                  setState(() {
                    isSwitched = value;
                  });
                },
              ),
            ),
            Expanded(flex: 2, child: Center(child: Text('add_item_text'.tr()))),
          ],
        ),
        Builder(
          builder: (context) {
            return isSwitched
                ? const BuildAddItemBody()
                : const BuildAddCategoryBody();
          },
        )
      ],
    );
  }
}
