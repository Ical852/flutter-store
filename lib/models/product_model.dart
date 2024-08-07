import 'package:flutterstore/models/category_model.dart';

class ProductModel {
  late int weight, width, length, height, price;
  late CategoryModel category;
  late String id, sku, name, desc, image;

  ProductModel.init() {
    this.id = "";
    this.weight = 0;
    this.width = 0;
    this.length = 0;
    this.height = 0;
    this.category = CategoryModel.init();
    this.sku = "";
    this.name = "";
    this.desc = "";
    this.image = "";
    this.price = 0;
  }

  ProductModel(
    int weight,
    width,
    length,
    height,
    price,
    CategoryModel category,
    String id,
    sku,
    name,
    desc,
    image,
  ) {
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
