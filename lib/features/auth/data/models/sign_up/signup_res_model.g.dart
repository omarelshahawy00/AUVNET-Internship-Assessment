// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_res_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignupResModel _$SignupResModelFromJson(Map<String, dynamic> json) =>
    SignupResModel(
      id: json['id'] as String,
      email: json['email'] as String,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$SignupResModelToJson(SignupResModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
    };
