import 'package:json_annotation/json_annotation.dart';

part 'customer_details_model.g.dart';

@JsonSerializable()
class CustomerDetailsModel {
  int? id;

  @JsonKey(name: 'customer_id')
  int? customerId;

  @JsonKey(name: 'first_name')
  String? firstName;

  @JsonKey(name: 'middle_initial')
  String? middleInitial;

  @JsonKey(name: 'last_name')
  String? lastName;

  DateTime? birthdate;

  @JsonKey(name: 'landline_number')
  String? landlineNumber;

  @JsonKey(name: 'mobile_number')
  String? mobileNumber;

  String? address;

  String? email;

  CustomerDetailsModel(
      {this.id,
      this.customerId,
      this.firstName,
      this.middleInitial,
      this.lastName,
      this.birthdate,
      this.landlineNumber,
      this.mobileNumber,
      this.address,
      this.email});

  factory CustomerDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerDetailsModelToJson(this);
}
