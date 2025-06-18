import 'package:json_annotation/json_annotation.dart';
part 'signup_req_model.g.dart';

@JsonSerializable()
class SignupReqModel {
  final String? uid;
  final String? email;
  final String? password;
  final String? name;
  

  SignupReqModel({
    this.uid,
    this.email,
    this.password,
    this.name,
    
  });

  Map<String, dynamic> toJson() => _$SignupReqModelToJson(this);
}
