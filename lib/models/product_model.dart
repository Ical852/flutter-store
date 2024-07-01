import 'package:flutterstore/models/category_model.dart';

class ProductModel {
  late int weight, width, length, height;
  late CategoryModel category;
  late String id, sku, name, desc, image, price;

  ProductModel(int  weight, width, length, height, CategoryModel category,
      String id, sku, name, desc, image, price) {
    this.id = id;
    this.weight = weight;
    this.width = width;
    this.length = length;
    this.height = height;
    this.category = category;
    this.sku = sku;
    this.name = name;
    this.desc = desc;
    this.image = image;
    this.price = price;
  }

  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "weight": this.weight,
      "width": this.width,
      "length": this.length,
      "height": this.height,
      "category": this.category.toJson(),
      "sku": this.sku,
      "name": this.name,
      "desc": this.desc,
      "image": this.image,
      "price": this.price,
    };
  }
}
