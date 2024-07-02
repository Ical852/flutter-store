class CategoryModel {
  late String id, name;

  CategoryModel.init() {
    this.id = "";
    this.name = "";
  }

  CategoryModel(String id, name) {
    this.id = id;
    this.name = name;
  }

  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "name": this.name,
    };
  }
}
