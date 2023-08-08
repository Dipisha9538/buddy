import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entity/user_entity.dart';

part 'auth_api_model.g.dart';

// create provider for AuthApiModel
final authApiModelProvider = Provider<AuthApiModel>((ref) {
  return AuthApiModel(
    fname: '',
    email: '',
    password: '',
  );
});

@JsonSerializable()
class AuthApiModel{
  @JsonKey(name: '_id')
  final String? userId;
  // final String? image;
  final String fname;
  final String email;
  final String? password;

  // Constructor
  AuthApiModel({
    this.userId,
    // this.image,
    required this.fname,
    required this.email,
    this.password,
  });

  // to JSON
  Map<String, dynamic> toJson() => _$AuthApiModelToJson(this);

  // from JSON
  factory AuthApiModel.fromJson(Map<String, dynamic> json) => _$AuthApiModelFromJson(json);

  // Convert AuthApiModel to UserEntity
  UserEntity toEntity() => UserEntity(
    id: userId,
    // image: image,
    fname: fname,
    email: email,
    password: password ?? '',
  );

  // Convert AUthApiModel list to UserEntity list
  List<UserEntity> listFromJson(List<AuthApiModel> models) => 
    models.map((model) => model.toEntity()).toList();

  @override
  String toString() {
    return 'AuthApiModel(id: $userId, fname: $fname, email: $email, password: $password)';
  }
}