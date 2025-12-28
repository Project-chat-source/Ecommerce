import 'package:json_annotation/json_annotation.dart';
import 'package:learning/app/view/features/Login/domain/entities/login_entity.dart';
part 'login_model.g.dart';

@JsonSerializable()
class LoginModel {
  @JsonKey(name: 'id', defaultValue: 0)
  final int id;

  @JsonKey(name: 'username', defaultValue: '')
  final String username;

  @JsonKey(name: 'email', defaultValue: '')
  final String email;

  @JsonKey(name: 'firstName', defaultValue: '')
  final String firstName;

  @JsonKey(name: 'lastName', defaultValue: '')
  final String lastName;

  @JsonKey(name: 'gender', defaultValue: '')
  final String gender;

  @JsonKey(name: 'image', defaultValue: '')
  final String image;

  @JsonKey(name: 'accessToken', defaultValue: '')
  final String accessToken;

  @JsonKey(name: 'refreshToken', defaultValue: '')
  final String refreshToken;

  LoginModel({
    required this.id,
    required this.username,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.image,
    required this.accessToken,
    required this.refreshToken,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginModelToJson(this);

  LoginEntity toDomain() => LoginEntity(
    id: id,
    username: username,
    email: email,
    firstName: firstName,
    lastName: lastName,
    gender: gender,
    image: image,
    accessToken: accessToken,
    refreshToken: refreshToken,
  );
}
