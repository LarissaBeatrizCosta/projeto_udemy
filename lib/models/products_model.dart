class ProductsModel {
  final int id; //Verificar se pode ser null

  final String name;

  final double price;

  ProductsModel({
    required this.id,
    required this.name,
    required this.price,
  });

   Map<String, dynamic> toMapProducts() {
    return {
      'id': id,
      'name': name,
      'price': price,
    };
  }

  factory ProductsModel.fromJsonProducts(Map<String, dynamic> map) {
    return ProductsModel(
      id: map['id'],
      name: map['name'],
      price: map['price'],
    );
  }
}
