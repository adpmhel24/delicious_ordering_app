class ProductModel {
  int? id;
  late String itemCode;
  late String itemName;
  String? uom;
  String? itemGroup;
  double? price;
  int? uomGroup;
  // String? dateCreated;
  // String? dateUpdated;
  String? premixCode;
  bool isSelected = false;

  ProductModel({
    this.id,
    required this.itemCode,
    required this.itemName,
    this.uom,
    this.itemGroup,
    this.price,
    required this.uomGroup,

    // this.dateCreated,
    // this.dateUpdated,
    this.premixCode,
    this.isSelected = false,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    itemCode = json['item_code'].toString();
    itemName = json['item_name'].toString();
    uom = json['uom'];
    itemGroup = json['item_group'];
    price = json['price'];
    uomGroup = json['uom_group'];
    // dateCreated = json['date_created'];
    // dateUpdated = json['date_updated'];
    premixCode = json['premix_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['item_code'] = this.itemCode;
    data['item_name'] = this.itemName;
    data['uom'] = this.uom;
    data['item_group'] = this.itemGroup;
    data['price'] = this.price;
    data['uom_group'] = this.uomGroup;
    // data['date_created'] = this.dateCreated;
    // data['date_updated'] = this.dateUpdated;
    data['premix_code'] = this.premixCode;
    return data;
  }
}
