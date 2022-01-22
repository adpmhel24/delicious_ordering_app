class CustomerModel {
  int? id;
  late String code;
  late String name;
  int? custType;
  String? address;
  String? dateCreated;
  String? dateUpdated;
  int? createdBy;
  int? updatedBy;
  double? balance;
  double? depBalance;
  bool? isConfidential;
  bool? isActive;
  String? contactNumber;

  CustomerModel({
    this.id,
    required this.code,
    required this.name,
    this.custType,
    this.address,
    this.dateCreated,
    this.dateUpdated,
    this.createdBy,
    this.updatedBy,
    this.balance,
    this.depBalance,
    this.isConfidential,
    this.isActive,
    this.contactNumber,
  });

  CustomerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
    custType = json['cust_type'];
    address = json['address'];
    dateCreated = json['date_created'];
    dateUpdated = json['date_updated'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    balance = json['balance'];
    depBalance = json['dep_balance'];
    isConfidential = json['is_confidential'];
    isActive = json['is_active'];
    contactNumber = json['contact_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['name'] = this.name;
    data['cust_type'] = this.custType;
    data['address'] = this.address;
    data['date_created'] = this.dateCreated;
    data['date_updated'] = this.dateUpdated;
    data['created_by'] = this.createdBy;
    data['updated_by'] = this.updatedBy;
    data['balance'] = this.balance;
    data['dep_balance'] = this.depBalance;
    data['is_confidential'] = this.isConfidential;
    data['is_active'] = this.isActive;
    data['contact_number'] = this.contactNumber;
    return data;
  }
}
