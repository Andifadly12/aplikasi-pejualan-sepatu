class CategoryModel {
  int id;
  String name;

  CategoryModel({this.id, this.name});

  //membuat contruc untuk berhubungan ke jeson

  CategoryModel.formJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  //membuat fuction untuk mengubah mnejadi json

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name};
  }
}
