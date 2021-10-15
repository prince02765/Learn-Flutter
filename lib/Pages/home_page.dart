import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:futter_learn/Models/cart.dart';
import 'package:futter_learn/Models/catalog.dart';
import 'package:futter_learn/Widgets/home_widgets/catalog_header.dart';
import 'package:futter_learn/Widgets/home_widgets/catalog_list.dart';
import 'package:futter_learn/core/store.dart';
import 'package:futter_learn/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;

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

    String url = "https://api.jsonbin.io/b/604dbddb683e7e079c4eefd3";

    await Future.delayed(Duration(seconds: 2));
    // var catalogJson = await rootBundle.loadString("assets/files/catalog.json");

    final response = await http.get(Uri.parse(url));
    final catalogJson = response.body;
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
    final _cart = (VxState.store as MyStore);
    return Scaffold(
      backgroundColor: context.canvasColor,
      floatingActionButton: VxBuilder(
        mutations: {AddMutation, RemoveMutation},
        builder : (context, _, __) => FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, Routes.cartRoute),
          backgroundColor: context.theme.buttonColor,
          child: Icon(CupertinoIcons.cart, color: Colors.white,),
        ).badge(
          color: Vx.gray300,
          size: 20,
          count: _cart.cart.items.length,
          textStyle: TextStyle(
            color: Vx.black,
            fontWeight: FontWeight.bold
          )
        ),
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
