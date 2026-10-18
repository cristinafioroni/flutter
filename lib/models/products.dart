class Product {
  //* attributi della classe Product
  String name;
  double price;
  bool inStore;
  String urImg;

  //* costruttore della classe Product
  Product({
    required this.name, 
    required this.price, 
    required this.inStore, 
    required this.urImg});

  //* parsing da JSON ad oggetto dart
  factory Product.fromJson(Map<String, dynamic> json ) {
     return Product(
       name: json['name'],
       // conversione del prezzo in double
       price: (json['price'] as num).toDouble(),
       inStore: json['inStore'],
       urImg: json['urlImg'],


     );
  }



}
