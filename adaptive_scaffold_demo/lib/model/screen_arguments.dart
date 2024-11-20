import 'package:adaptive_scaffold_demo/model/card_selected_callback.dart';
import 'package:adaptive_scaffold_demo/model/item.dart';

class ScreenArguments {
  ScreenArguments({
    required this.item,
    required this.selectCard,
  });

  final Item item;
  final CardSelectedCallback selectCard;
}
