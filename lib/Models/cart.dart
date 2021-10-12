import 'package:futter_learn/Models/catalog.dart';
import 'package:futter_learn/core/store.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel{
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

  // remove items
  void remove(Items items){
    _itemsIds.remove(items.id);
  }

}

class AddMutation extends VxMutation<MyStore>{
  final Items items;

  AddMutation(this.items);
  
  @override
  perform() {
    store!.cart._itemsIds.add(items.id);
  }

}