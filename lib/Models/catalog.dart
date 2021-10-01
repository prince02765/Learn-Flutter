class CatalogModel{
  static List<Items> items=[];
}
class Items{
  final String name, desc, color, image;
  final num price, id;

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