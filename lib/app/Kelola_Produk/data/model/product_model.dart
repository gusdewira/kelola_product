
class Product {
  int? id;
  String? name;
  int? price;
  int? stock;
  String? image;

  Product({
    this.id,
    this.name,
    this.price,
    this.stock,
    this.image,
  });

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
   name = json['name'];
    price= json['price'];
    stock = json['stock'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'stock': stock,
      'image': image,
    };
  }
}
