import 'package:adaptive_scaffold_demo/model/screen_arguments.dart';
import 'package:adaptive_scaffold_demo/widgets/route_detail_view.dart';
import 'package:flutter/material.dart';

class ExtractRouteArguments extends StatelessWidget {
  const ExtractRouteArguments({super.key});

  static const String routeName = '/detailView';

  @override
  Widget build(BuildContext context) {
    final ScreenArguments args =
        ModalRoute.of(context)!.settings.arguments! as ScreenArguments;

    return RouteDetailView(item: args.item, selectCard: args.selectCard);
  }
}
