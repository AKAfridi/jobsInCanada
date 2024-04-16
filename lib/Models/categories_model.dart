class CategoriesModel {
  String? name;
  String? count;

  CategoriesModel({this.name, this.count});

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['count'] = count;
    return data;
  }
}
