import 'package:adaptive_scaffold_demo/model/card_selected_callback.dart';
import 'package:adaptive_scaffold_demo/model/item.dart';
import 'package:adaptive_scaffold_demo/widgets/detail_tile.dart';
import 'package:flutter/material.dart';

class RouteDetailView extends StatelessWidget {
  const RouteDetailView({super.key, 
    required this.item,
    required this.selectCard,
  });

  final Item item;
  final CardSelectedCallback selectCard;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.topLeft,
            child: TextButton(
              onPressed: () {
                Navigator.popUntil(context,
                    (Route<dynamic> route) => route.settings.name == '/');
                selectCard(null);
              },
              child: const Icon(Icons.arrow_back),
            ),
          ),
          Expanded(child: DetailTile(item: item)),
        ],
      ),
    );
  }
}
