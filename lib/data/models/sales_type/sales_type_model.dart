class SalesTypeModel {
  int? id;
  late String code;
  late String description;
  String? dateCreated;
  String? dateUpdated;

  SalesTypeModel(
      {this.id,
      required this.code,
      required this.description,
      this.dateCreated,
      this.dateUpdated});

  SalesTypeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    description = json['description'];
    dateCreated = json['date_created'];
    dateUpdated = json['date_updated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['description'] = this.description;
    data['date_created'] = this.dateCreated;
    data['date_updated'] = this.dateUpdated;
    return data;
  }
}
