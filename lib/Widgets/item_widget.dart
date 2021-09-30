import 'package:flutter/material.dart';
import 'package:futter_learn/Models/catalog.dart';

class ItemWidget extends StatelessWidget{

  final Items items;

  const ItemWidget({Key? key, required this.items}) 
  : assert (items!=null),
    super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: ListTile(
        onTap: () => _showToast(context, items.name),
        leading: Image.network(items.image),
        title: Text(items.name),
        subtitle: Text(items.desc),
        trailing: Text(
          "\$ ${items.price}",
          textScaleFactor: 1.2,
          style: TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.bold
          ),
          ),
      ),
    );
  }

  void _showToast(BuildContext context, String cuurentName) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(cuurentName),
      ),
    );
  }
}