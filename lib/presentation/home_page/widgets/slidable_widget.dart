import 'package:challenge/core/colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../data/model/product.dart';
import 'custom_snackbar.dart';

class SlidableWidget extends StatelessWidget {
  final Product product;
  const SlidableWidget({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: Key(product.name!),
      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        dismissible: DismissiblePane(onDismissed: () {
          //TODO eliminar prod de la db
          CustomSnackBar.show(
              context, 'delete_product_message'.tr(args: [product.name!]));
        }),
        children: [
          SlidableAction(
            onPressed: null,
            backgroundColor: ColorsConst.slidableBackgroundColor,
            foregroundColor: ColorsConst.slidableForegroundColor,
            icon: Icons.delete,
            label: 'slidable_delete_button_text'.tr(),
          ),
        ],
      ),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            flex: 4,
            onPressed: null,
            backgroundColor: ColorsConst.slidablefavoriteBackgroundColor,
            foregroundColor: ColorsConst.slidablefavoriteForegroundColor,
            icon: Icons.favorite,
            label: 'slidable_favorite_button_text'.tr(),
          ),
        ],
      ),
      child: ListTile(
        leading: Image.network(product.image!),
        title: Text(product.name!),
        subtitle: Text(product.description!),
        trailing: Text(product.category!),
      ),
    );
  }
}
