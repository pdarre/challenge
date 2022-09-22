import 'dart:io';

import 'package:challenge/core/colors.dart';
import 'package:challenge/core/styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../select_photo_options_page.dart';

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
      debugPrint(e.toString());
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
              const SizedBox(height: 20),
              Text(
                'add_item_title'.tr(),
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
              const SizedBox(height: 20),
              Center(
                child: Container(
                    height: 200.0,
                    width: 200.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: ColorsConst.elevatedButtonColor,
                    ),
                    child: Center(
                      child: _image == null
                          ? Text(
                              'no_image_selected'.tr(),
                              style: const TextStyle(fontSize: 20),
                            )
                          : CircleAvatar(
                              backgroundImage: FileImage(_image!),
                              radius: 200.0,
                            ),
                    )),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () => _showSelectPhotoOptions(context),
                  child: Text('add_a_photo_text'.tr())),
              const SizedBox(height: 10),
              ElevatedButton(
                  onPressed: () {
                    if (_itemFormKey.currentState!.validate()) {
                      _itemFormKey.currentState!.save();
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
