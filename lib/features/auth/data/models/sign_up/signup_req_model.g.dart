// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_req_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignupReqModel _$SignupReqModelFromJson(Map<String, dynamic> json) =>
    SignupReqModel(
      uid: json['uid'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$SignupReqModelToJson(SignupReqModel instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'email': instance.email,
      'password': instance.password,
      'name': instance.name,
    };
