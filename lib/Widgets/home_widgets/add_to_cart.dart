
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:futter_learn/Models/cart.dart';
import 'package:futter_learn/Models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatelessWidget {
  final Items catalog;
  AddToCart({
    Key? key, required this.catalog,
  }) : super(key: key);

 
  final _cart = CartModel();
  
  @override
  Widget build(BuildContext context) {
    bool isInCart = _cart.items.contains(catalog);
    return ElevatedButton(
      onPressed: () {
        if(!isInCart){
          isInCart = isInCart.toggle();
          final _catalog = CatalogModel();
          _cart.catalog = _catalog;
          _cart.add(catalog);
        }
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          context.theme.buttonColor,
        ),
        shape: MaterialStateProperty.all(StadiumBorder())
      ), 
      child: isInCart ? Icon(Icons.done) : Icon(CupertinoIcons.cart_badge_plus),
    );
  }
}