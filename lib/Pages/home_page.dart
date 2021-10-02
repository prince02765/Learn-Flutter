import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:futter_learn/Models/catalog.dart';
import 'package:futter_learn/Widgets/drawer.dart';
import 'package:futter_learn/Widgets/item_widget.dart';

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
      appBar: AppBar(
        title: const Text("Catalog App"),
      ),
      body:Padding(
        padding: const EdgeInsets.all(12.0),
        child: (CatalogModel.items != null && CatalogModel.items.isNotEmpty) ?
         GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              ),
            itemBuilder: (context, index){
              final item = CatalogModel.items[index];
              return Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)
                ),
                child: GridTile(
                  // header: Text(item.name),
                  child: Image.network(item.image),
                  // footer: Text(item.price.toString()),
                )
              );
            },
        ):
        Center(
          child: CircularProgressIndicator(),
        ),
      ),
      drawer: MyWidgets(),
    );
  }
}
