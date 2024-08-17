class AllProductModel {
  List<Products>? products;

  AllProductModel({this.products});

  AllProductModel.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  String? productId;
  String? name;
  String? image;
  double? price;
  String? category;

  Products({this.productId, this.name, this.image, this.price, this.category});

  Products.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    name = json['name'];
    image = json['image'];
    price = json['price'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productId'] = this.productId;
    data['name'] = this.name;
    data['image'] = this.image;
    data['price'] = this.price;
    data['category'] = this.category;
    return data;
  }
}
