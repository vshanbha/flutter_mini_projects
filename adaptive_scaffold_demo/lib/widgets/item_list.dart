import 'package:adaptive_scaffold_demo/model/card_selected_callback.dart';
import 'package:adaptive_scaffold_demo/model/item.dart';
import 'package:adaptive_scaffold_demo/widgets/item_list_tile.dart';
import 'package:adaptive_scaffold_demo/widgets/small_compose_icon.dart';
import 'package:custom_adaptive_scaffold/custom_adaptive_scaffold.dart';
import 'package:flutter/material.dart';


class ItemList extends StatelessWidget {
  const ItemList({super.key, 
    required this.items,
    required this.selectCard,
    required this.selected,
  });

  final List<Item> items;
  final int? selected;
  final CardSelectedCallback selectCard;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                suffixIcon: const Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: CircleAvatar(
                    radius: 18,
                    child: Icon(Icons.search),
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                contentPadding: const EdgeInsets.all(25),
                hintStyle:
                    const TextStyle(color: Color.fromARGB(255, 135, 129, 138)),
                hintText: 'Search replies',
                fillColor: Colors.white,
              ),
            ),
          ),
      ),
      backgroundColor: const Color.fromARGB(0, 0, 0, 0),
      floatingActionButton: Breakpoints.mediumAndUp.isActive(context)
          ? null
          : const SmallComposeIcon(),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) => ItemListTile(
                item: items[index],
                email: items[index].emails![0],
                selectCard: selectCard,
                selected: selected,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
