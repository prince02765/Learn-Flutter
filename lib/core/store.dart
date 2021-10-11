import 'package:futter_learn/Models/cart.dart';
import 'package:futter_learn/Models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';


class MyStore extends VxStore {

  CatalogModel catalog;
  CartModel cart;

  MyStore(){
    catalog = CatalogModel();
    cart = CartModel();
    cart.catalog = catalog;

  }

}