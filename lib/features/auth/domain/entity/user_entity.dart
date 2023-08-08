import 'package:equatable/equatable.dart';

class UserEntity extends Equatable{
  final String? id;
  final String fname;
  final String email;
  final String password;

  const UserEntity({
    this.id,
    required this.fname,
    required this.email,
    required this.password,
  });

  // To JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fname': fname,
      'email': email,
      'password': password,
    };
  }

  // From JSON
  factory UserEntity.fromJson(Map<String, dynamic> json) {
    return UserEntity(
      id: json['id'],
      fname: json['fname'],
      email: json['email'],
      password: json['password'],
    );
  }
  
  @override
  List<Object?> get props => [id, fname, email, password];
}