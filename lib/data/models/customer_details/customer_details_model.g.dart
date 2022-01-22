// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerDetailsModel _$CustomerDetailsModelFromJson(
        Map<String, dynamic> json) =>
    CustomerDetailsModel(
      id: json['id'] as int?,
      customerId: json['customer_id'] as int?,
      firstName: json['first_name'] as String?,
      middleInitial: json['middle_initial'] as String?,
      lastName: json['last_name'] as String?,
      birthdate: json['birthdate'] == null
          ? null
          : DateTime.parse(json['birthdate'] as String),
      landlineNumber: json['landline_number'] as String?,
      mobileNumber: json['mobile_number'] as String?,
      address: json['address'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$CustomerDetailsModelToJson(
        CustomerDetailsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'customer_id': instance.customerId,
      'first_name': instance.firstName,
      'middle_initial': instance.middleInitial,
      'last_name': instance.lastName,
      'birthdate': instance.birthdate?.toIso8601String(),
      'landline_number': instance.landlineNumber,
      'mobile_number': instance.mobileNumber,
      'address': instance.address,
      'email': instance.email,
    };
