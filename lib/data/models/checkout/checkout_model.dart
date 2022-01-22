import 'package:json_annotation/json_annotation.dart';

part 'checkout_model.g.dart';

@JsonSerializable()
class CheckOutModel {
  static toNull(_) => null;

  DateTime? transdate;

  @JsonKey(name: "delivery_date")
  DateTime? deliveryDate;

  @JsonKey(name: "cust_code")
  String? custCode;

  String? address;
  String? remarks;

  double? delfee;
  double? tenderamt;

  @JsonKey(name: 'contact_number')
  String? contactNumber;

  @JsonKey(name: 'cust_type', toJson: toNull, includeIfNull: false)
  String? custType;

  @JsonKey(name: 'payment_method')
  String? paymentMethod;

  @JsonKey(name: 'delivery_method')
  String? deliveryMethod;

  List<Map<String, dynamic>>? rows;

  CheckOutModel({
    this.transdate,
    this.deliveryDate,
    this.custCode,
    this.delfee = 0.00,
    this.tenderamt = 0.00,
    this.address,
    this.remarks,
    this.rows,
    this.contactNumber,
  });

  factory CheckOutModel.fromJson(Map<String, dynamic> json) =>
      _$CheckOutModelFromJson(json);

  Map<String, dynamic> toJson() => _$CheckOutModelToJson(this);
}
