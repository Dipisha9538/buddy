import 'package:equatable/equatable.dart';

class ProfileEntity extends Equatable {
  final String? userId;
  final String? profileImage;
  final String fname;
  final String email;
  final String? bloodType;
  final String? gender;
  final String? location;
  final String? phone;

  const ProfileEntity({
    this.userId,
    this.profileImage,
    required this.fname,
    required this.email,
    this.bloodType,
    this.gender,
    this.location,
    this.phone,
  });

  factory ProfileEntity.fromJson(Map<String, dynamic> json) => ProfileEntity(
        userId: json["userId"],
        profileImage: json["profileImage"],
        fname: json["fname"],
        email: json["email"],
        bloodType: json["bloodType"],
        gender: json["gender"],
        location: json["location"],
        phone: json["phone"]
        // savedPosts: List<String>.from(json["savedPosts"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "profileImage": profileImage,
        "fname": fname,
        "email": email,
        "bloodType": bloodType,
        "gender": gender,
        "location": location,
        "phone": phone,
      };

  @override
  List<Object?> get props => [
        userId,
        profileImage,
        fname,
        email,
        bloodType,
        gender,
        location,
        phone,
      ];
}