import 'package:challenge/presentation/home_page/widgets/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../data/model/product.dart';

class SlidableWidget extends StatelessWidget {
  final Product product;
  const SlidableWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: Key(product.name!),
      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        dismissible: DismissiblePane(onDismissed: () {
          //TODO eliminar prod de la db
          CustomSnackBar.show(context, 'se elimino');
        }),
        children: const [
          SlidableAction(
            onPressed: null,
            backgroundColor: Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
      ),
      endActionPane: const ActionPane(
        motion: ScrollMotion(),
        children: [
          SlidableAction(
            flex: 2,
            onPressed: null,
            backgroundColor: Color(0xFF7BC043),
            foregroundColor: Colors.white,
            icon: Icons.archive,
            label: 'Archive',
          ),
          SlidableAction(
            onPressed: null,
            backgroundColor: Color(0xFF0392CF),
            foregroundColor: Colors.white,
            icon: Icons.save,
            label: 'Save',
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