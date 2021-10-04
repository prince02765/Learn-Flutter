import 'package:flutter/material.dart';
import 'package:futter_learn/Widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogHeader extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App".text.bold.xl5.color(AppThemes.darkBluishColor).make(),
        "Trending Products".text.make().py8(),
      ],
    );
  }
}