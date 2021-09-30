import 'package:flutter/material.dart';
import 'package:futter_learn/Models/catalog.dart';
import 'package:futter_learn/Widgets/drawer.dart';
import 'package:futter_learn/Widgets/item_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final dummyList = List.generate(4,(Index)=> CatalogModel.items[0]);    

    return Scaffold(
      appBar: AppBar(
        title: const Text("Catalog App"),
      ),
      body:Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.builder(
          itemCount: dummyList.length,
          itemBuilder: (context, index){
            return ItemWidget(
              items: dummyList[index],
            );
          }),
      ),
      drawer: MyWidgets(),
    );
  }
}
