import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/category.dart';
import '../../../di/injector.dart';
import '../bloc/products_bloc.dart';
import 'slidable_widget.dart';

class BuildExpandableCard extends StatefulWidget {
  final Category category;
  const BuildExpandableCard({super.key, required this.category});

  @override
  State<BuildExpandableCard> createState() => _BuildExpandableCardState();
}

class _BuildExpandableCardState extends State<BuildExpandableCard> {
  @override
  void initState() {
    BlocProvider.of<ProductsBloc>(context, listen: false)
        .add(GetProductsByCategory(widget.category.name!, locator.get()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
      child: ExpansionPanelList(
        expansionCallback: (panelIndex, isExpanded) {
          setState(() {
            widget.category.isExpanded = !isExpanded;
          });
        },
        animationDuration: const Duration(milliseconds: 500),
        children: [
          ExpansionPanel(
            canTapOnHeader: true,
            headerBuilder: (BuildContext context, bool isExpanded) {
              return ListTile(
                title: Text(widget.category.name!),
              );
            },
            body: BlocBuilder<ProductsBloc, ProductsState>(
              key: Key(widget.category.name!),
              builder: (context, state) {
                if (state is ProductsLoaded) {
                  if (state.products.isEmpty) {
                    return const Text('no_items_to_show').tr();
                  }
                  return ReorderableListView(
                    shrinkWrap: true,
                    children: <Widget>[
                      for (final item in state.products)
                        Card(
                          key: ValueKey(item),
                          elevation: 2,
                          child: SlidableWidget(product: item),
                        ),
                    ],
                    onReorder: (oldindex, newindex) {
                      setState(() {
                        if (newindex > oldindex) {
                          newindex -= 1;
                        }
                        final items = state.products.removeAt(oldindex);
                        state.products.insert(newindex, items);
                      });
                    },
                  );
                }
                return Container();
              },
            ),
            isExpanded: widget.category.isExpanded!,
          ),
        ],
      ),
    );
  }
}
