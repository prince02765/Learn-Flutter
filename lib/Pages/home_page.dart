import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:futter_learn/Models/catalog.dart';
import 'package:futter_learn/Widgets/home_widgets/catalog_header.dart';
import 'package:futter_learn/Widgets/home_widgets/catalog_list.dart';
import 'package:futter_learn/Widgets/drawer.dart';
import 'package:futter_learn/Widgets/item_widget.dart';
import 'package:futter_learn/Widgets/themes.dart';
import 'package:futter_learn/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    var catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    var decodecData = jsonDecode(catalogJson);
    var productsData = decodecData["products"];
    print(productsData);
    CatalogModel.items = List.from(productsData)
                .map((items) => Items.fromMap(items))
                .toList();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppThemes.creamColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, Routes.cartRoute),
        backgroundColor: AppThemes.darkBluishColor,
        child: Icon(CupertinoIcons.cart),
        ),
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              if (CatalogModel.items!=null && CatalogModel.items.isNotEmpty)
                CatalogList().py8().expand()
              else
                CircularProgressIndicator().centered().expand(),
            ],
          ),
        ),
      ),
    );
  }
}
