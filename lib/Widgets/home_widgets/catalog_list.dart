import 'package:flutter/material.dart';
import 'package:futter_learn/Models/catalog.dart';
import 'package:futter_learn/Pages/home_detail_page.dart';
import 'package:futter_learn/Pages/home_page.dart';
import 'package:futter_learn/Widgets/home_widgets/catalog_image.dart';
import 'package:futter_learn/Widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';


class CatalogList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index){
        final catalog = CatalogModel.items[index];
        return InkWell(
          onTap: () => Navigator.push(
            context, MaterialPageRoute(
              builder: (context) => HomeDetail(
                catalog: catalog,
              )
            )
          ),
          child: CatalogItem(catalog: catalog)
        );
      }
    );
  }
}

class CatalogItem extends StatelessWidget{
  final Items catalog;

  const CatalogItem({Key? key, required this.catalog}) 
    : assert(catalog!=null),
      super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          Hero(
            tag: Key(catalog.id.toString()),
            child: CatalogImage(
              image: catalog.image
            ),
          ),
          Expanded(
            child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center, 
              children: [
                catalog.name.text.bold.lg.color(AppThemes.darkBluishColor).make(),
                Text(catalog.desc, style: context.captionStyle),
                10.heightBox,
                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  buttonPadding: EdgeInsets.zero,
                  children: [
                    "\$${catalog.price}".text.bold.xl.make(),
                    ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          AppThemes.darkBluishColor,
                        ),
                        shape: MaterialStateProperty.all(StadiumBorder())
                      ), 
                      child: "Buy".text.make()
                    ),
                  ],
                ).pOnly(right: 16.0)
              ],
            )
          )
        ],
      )
    ).white.rounded.square(150).make().py16();
  }
}