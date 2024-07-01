class CategoryModel {
  late int id;
  late String name;

  CategoryModel(int id, String name) {
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
