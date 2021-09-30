class CatalogModel{
  static final items=[
    Items(
      id:1, 
      name: "iPhone 13 pro max", 
      desc: "Apple iPhone 13th Generation with ios 15",
      color: "#33505a", 
      image: "https://fdn2.gsmarena.com/vv/pics/apple/apple-iphone-13-pro-max-01.jpg",
      price: 1099,
      )
  ];
}
class Items{
  final String name, desc, color, image;
  final num price, id;

  Items({required this.id, required this.name, required this.desc, required this.color, required this.image, required this.price});
}