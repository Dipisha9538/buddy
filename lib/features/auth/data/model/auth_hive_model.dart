import 'package:blood_buddy/config/constants/hive_table_constant.dart';
import 'package:blood_buddy/features/auth/domain/entity/user_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

part 'auth_hive_model.g.dart';

final authHiveModelProvider = Provider(
  (ref) => AuthHiveModel.empty(),
);

@HiveType(typeId: HiveTableConstant.userTableId)
class AuthHiveModel {
  @HiveField(0)
  final String fname;

  @HiveField(1)
  final String email;

  @HiveField(2)
  final String password;

  // Constructor
  AuthHiveModel({
    required this.fname,
    required this.email,
    required this.password,
  }) ;

  // empty constructor
  AuthHiveModel.empty()
      : this(
          fname: '',
          email: '',
          password: '',
        );

  // Convert Hive Object to Entity
  UserEntity toEntity() => UserEntity(
        fname: fname,
        email: email,
        password: password,
      );

  // Convert Entity to Hive Object
  AuthHiveModel toHiveModel(UserEntity entity) => AuthHiveModel(
        fname: entity.fname,
        email: entity.email,
        password: entity.password,
      );

  // Convert Entity List to Hive List
  List<AuthHiveModel> toHiveModelList(List<UserEntity> entities) =>
      entities.map((entity) => toHiveModel(entity)).toList();

  @override
  String toString() {
    return 'fname: $fname, email: $email, password: $password';
  }
}