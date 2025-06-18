import 'package:json_annotation/json_annotation.dart';

part 'signup_res_model.g.dart';

@JsonSerializable()
class SignupResModel {
  final String id;
  final String email;
  final String? name;
  

  SignupResModel({
    required this.id,
    required this.email,
    this.name,
    
  });

  factory SignupResModel.fromJson(Map<String, dynamic> json) =>
      _$SignupResModelFromJson(json);

  Map<String, dynamic> toJson() => _$SignupResModelToJson(this);
}
