class TodayJobsModel {
  String? id;
  String? title;
  String? category;
  String? salary;
  String? type;
  String? state;
  String? detail;
  String? email;

  TodayJobsModel(
      {this.id,
      this.title,
      this.category,
      this.salary,
      this.type,
      this.state,
      this.detail,
      this.email});

  TodayJobsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    category = json['category'];
    salary = json['salary'];
    type = json['type'];
    state = json['state'];
    detail = json['detail'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['category'] = category;
    data['salary'] = salary;
    data['type'] = type;
    data['state'] = state;
    data['detail'] = detail;
    data['email'] = email;
    return data;
  }
}
