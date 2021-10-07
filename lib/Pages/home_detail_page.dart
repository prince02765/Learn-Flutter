
import 'package:flutter/material.dart';
import 'package:futter_learn/Models/catalog.dart';
import 'package:futter_learn/Widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:velocity_x/src/extensions/context_ext.dart';

class HomeDetail extends StatelessWidget {
  
  final Items catalog;

  const HomeDetail({Key? key, required this.catalog}) 
  : assert(catalog!=null),
    super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: catalog.name.text.make(),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: context.canvasColor,
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog.price}".text.bold.xl3.make(),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  context.theme.buttonColor,
                ),
                shape: MaterialStateProperty.all(StadiumBorder())
              ), 
              child: "Add to cart".text.xl.make()
            ).wh(150, 50),
          ],
        ).p(32.0),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(catalog.id.toString()),
              child: Image.network(catalog.image)
            ).p32(),
            Expanded(
              child: VxArc(
                height: 30.0,
                arcType: VxArcType.CONVEY,
                edge: VxEdge.TOP,
                child: Container(
                  color: context.cardColor,
                  width: context.screenWidth,
                  child: Column(
                    children: [
                      catalog.name.text.bold.xl4.color(context.accentColor).make(),
                      catalog.desc.text.coolGray400.xl.make().pOnly(top: 10),
                      10.heightBox,
                      "Sed stet tempor sadipscing sea lorem sed rebum, sit sit stet amet takimata. Sit diam consetetur sit elitr magna, no at amet dolor est est tempor est accusam sadipscing. Sit at voluptua accusam sit kasd. Vero clita invidunt no dolor sed, et ut no diam rebum et sed lorem sed."
                      .text.coolGray400.lg.make().p16()
                    ],
                  ).pOnly(top: 64),
                ),
              )
            )
          ]
        ),
      ),
    );
  }
  
}