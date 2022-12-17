class Model {
  int? id;
  String? title;
  int? price;
  String? description;
  Category? category;
  List<String>? images;

  Model(
      {this.id,
      this.title,
      this.price,
      this.description,
      this.category,
      this.images});

  Model.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    description = json['description'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    images = json['images'].cast<String>();
  }
}

class Category {
  int? id;
  String? name;
  String? image;

  Category({this.id, this.name, this.image});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }
}
