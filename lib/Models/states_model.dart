class StatesModel {
  String? name;
  String? count;

  StatesModel({this.name, this.count});

  StatesModel.fromJson(Map<String, dynamic> json) {
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
