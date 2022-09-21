import 'dart:io';

import 'package:challenge/core/colors.dart';
import 'package:challenge/presentation/add_item_category_page/select_photo_options_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import '../common_widgets/common_buttons.dart';
import '../common_widgets/custom_drawer.dart';

class AddItemCategoryPage extends StatelessWidget {
  const AddItemCategoryPage({super.key});
  static const String routeName = '/add-item-category-page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

class BuildAddItemBody extends StatefulWidget {
  const BuildAddItemBody({super.key});

  @override
  State<BuildAddItemBody> createState() => _BuildAddItemBodyState();
}

class _BuildAddItemBodyState extends State<BuildAddItemBody> {
  final _itemFormKey = GlobalKey<FormState>();

  late TextEditingController _categoryController;
  late TextEditingController _descriptionController;
  late TextEditingController _nameController;
  File? _image;

  Future _pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      File? img = File(image.path);
      img = await _cropImage(imageFile: img);
      setState(() {
        _image = img;
        Navigator.of(context).pop();
      });
    } catch (e) {
      print(e);
      Navigator.of(context).pop();
    }
  }

  Future<File?> _cropImage({required File imageFile}) async {
    CroppedFile? croppedImage =
        await ImageCropper().cropImage(sourcePath: imageFile.path);
    if (croppedImage == null) return null;
    return File(croppedImage.path);
  }

  void _showSelectPhotoOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      builder: (context) => DraggableScrollableSheet(
          initialChildSize: 0.28,
          maxChildSize: 0.4,
          minChildSize: 0.28,
          expand: false,
          builder: (context, scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              child: SelectPhotoOptionsScreen(
                onTap: _pickImage,
              ),
            );
          }),
    );
  }

  @override
  void initState() {
    super.initState();
    _categoryController = TextEditingController();
    _descriptionController = TextEditingController();
    _nameController = TextEditingController();
  }

  @override
  void dispose() {
    _categoryController.dispose();
    _descriptionController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40),
      child: Center(
        child: Form(
          key: _itemFormKey,
          child: Column(
            children: [
              TextFormField(
                controller: _categoryController,
                decoration: InputDecoration(labelText: 'category_title'.tr()),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'please_enter_some_text'.tr();
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _descriptionController,
                decoration:
                    InputDecoration(labelText: 'description_title'.tr()),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'please_enter_some_text'.tr();
                  }
                  return null;
                },
              ),
              Center(
                child: Container(
                    height: 200.0,
                    width: 200.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey.shade200,
                    ),
                    child: Center(
                      child: _image == null
                          ? const Text(
                              'No image selected',
                              style: TextStyle(fontSize: 20),
                            )
                          : CircleAvatar(
                              backgroundImage: FileImage(_image!),
                              radius: 200.0,
                            ),
                    )),
              ),
              CommonButtons(
                onTap: () => _showSelectPhotoOptions(context),
                backgroundColor: Colors.black,
                textColor: Colors.white,
                textLabel: 'Add a Photo',
              ),
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
              ElevatedButton(
                onPressed: () {
                  if (_itemFormKey.currentState!.validate()) {
                    _itemFormKey.currentState!.save();
                  }
                },
                child: const Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BuildAddCategoryBody extends StatelessWidget {
  const BuildAddCategoryBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
