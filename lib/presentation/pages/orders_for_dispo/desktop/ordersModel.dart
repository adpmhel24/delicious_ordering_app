class ForDispoOrderModel {
  int? id;
  String? transdate;
  String? deliveryDate;
  String? custCode;
  String? details;
  int? delfee;
  int? doctotal;
  String? deliveryMethod;
  String? paymentMethod;
  String? orderStatus;
  String? paymentStatus;
  String? user;

  ForDispoOrderModel(
      {this.id,
      this.transdate,
      this.deliveryDate,
      this.custCode,
      this.details,
      this.delfee,
      this.doctotal,
      this.deliveryMethod,
      this.paymentMethod,
      this.orderStatus,
      this.paymentStatus,
      this.user});

  ForDispoOrderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    transdate = json['transdate'];
    deliveryDate = json['delivery_date'];
    custCode = json['cust_code'];
    details = json['details'];
    delfee = json['delfee'];
    doctotal = json['doctotal'];
    deliveryMethod = json['delivery_method'];
    paymentMethod = json['payment_method'];
    orderStatus = json['order_status'];
    paymentStatus = json['payment_status'];
    user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['transdate'] = this.transdate;
    data['delivery_date'] = this.deliveryDate;
    data['cust_code'] = this.custCode;
    data['details'] = this.details;
    data['delfee'] = this.delfee;
    data['doctotal'] = this.doctotal;
    data['delivery_method'] = this.deliveryMethod;
    data['payment_method'] = this.paymentMethod;
    data['order_status'] = this.orderStatus;
    data['payment_status'] = this.paymentStatus;
    data['user'] = this.user;
    return data;
  }
}
