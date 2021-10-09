class CatalogModel{

  static final catModel = CatalogModel._internal();

  CatalogModel._internal();

  factory CatalogModel() => catModel;

  static List<Items> items=[];

  // Get Item by id
  Items getById(int id)=> 
        items.firstWhere((element) => element.id == id, orElse: null);

  // Get Item by position
  Items getByPosition(int pos) => items[pos];
}
class Items{
  final String name, desc, color, image;
  final int price, id;

  Items({required this.id, required this.name, required this.desc, required this.color, required this.image, required this.price});

  factory Items.fromMap(Map<String, dynamic> map){
    return Items(
      id: map["id"], 
      name: map["name"], 
      desc: map["desc"], 
      color: map["color"], 
      image: map["image"],
      price: map["price"]
    );
  }

  toMap() => {
    "id": id,
    "name": name,
    "desc": desc,
    "color": color,
    "image": image,
    "price": price,
  };
}