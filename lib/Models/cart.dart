import 'package:futter_learn/Models/catalog.dart';

class CartModel{

  static final cartModel = CartModel._internal();

  CartModel._internal();

  factory CartModel() => cartModel;

  // Catalog Field
  late CatalogModel _catalog;

  // Collection of Ids - Store of each item
  final List<int> _itemsIds = [];

  // get catalog
  CatalogModel get catalog => _catalog;

  // set catalog
  set catalog(CatalogModel newCatalog){
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

  // Get items in cart
  List<Items> get items => _itemsIds.map((id) => _catalog.getById(id)).toList();

  //get total price
  num get totalPrice => items.fold(0, (total, current) => total + current.price);

  // Add items
  void add(Items items){
    _itemsIds.add(items.id);
  }

  // remove items
  void remove(Items items){
    _itemsIds.remove(items.id);
  }

}