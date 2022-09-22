import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hsvcolor_picker/flutter_hsvcolor_picker.dart';

import '../../../../core/styles.dart';
import '../../../../di/injector.dart';
import '../../../home_page/view/home_page.dart';
import '../../bloc/add_category_bloc/add_category_bloc.dart';

class BuildAddCategoryBody extends StatefulWidget {
  const BuildAddCategoryBody({super.key});

  @override
  State<BuildAddCategoryBody> createState() => _BuildAddCategoryBodyState();
}

class _BuildAddCategoryBodyState extends State<BuildAddCategoryBody> {
  final _colorNotifier = ValueNotifier<Color>(Colors.green);

  final _categoryFormKey = GlobalKey<FormState>();

  late TextEditingController _nameController;
  late TextEditingController _colorController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _colorController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _colorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40),
      child: Center(
        child: Form(
          key: _categoryFormKey,
          child: Column(
            children: [
              const SizedBox(height: 20),
              Text(
                'add_category_title'.tr(),
                style: StylesConst.drawerTextStyle.copyWith(fontSize: 20),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'name_title'.tr()),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'please_enter_some_text'.tr();
                  }
                  return null;
                },
              ),
              Row(
                children: [
                  SizedBox(
                    width: 150,
                    child: TextFormField(
                      controller: _colorController,
                      decoration:
                          InputDecoration(labelText: 'pick_color_title'.tr()),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'please_enter_some_text'.tr();
                        }
                        return null;
                      },
                    ),
                  ),
                  Expanded(child: Container()),
                  TextButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('close'))
                          ],
                          content: SizedBox(
                            width: 350,
                            height: 600,
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(50),
                                child: ValueListenableBuilder<Color>(
                                  valueListenable: _colorNotifier,
                                  builder: (_, color, __) {
                                    return ColorPicker(
                                      color: color,
                                      onChanged: (value) {
                                        color = value;
                                        var hexCode =
                                            '#${value.value.toRadixString(16).substring(2, 8)}';
                                        // Color ttt = hexCode.toColor();
                                        _colorController.text = hexCode;
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    child: Text(
                      'pick_color_title'.tr(),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () {
                    if (_categoryFormKey.currentState!.validate()) {
                      _categoryFormKey.currentState!.save();
                      var catBloc = context.read<AddCategoryBloc>();
                      catBloc.add(AddNewCategoryEvent(locator.get(), false,
                          _colorController.text, _nameController.text));
                      Navigator.of(context).popAndPushNamed(HomePage.routeName);
                    }
                  },
                  child: Text('save_ext'.tr())),
            ],
          ),
        ),
      ),
    );
  }
}
