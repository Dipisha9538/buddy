// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileApiModel _$ProfileApiModelFromJson(Map<String, dynamic> json) =>
    ProfileApiModel(
      userId: json['_userId'] as String?,
      profileImage: json['profileImage'] as String?,
      fname: json['fname'] as String,
      email: json['email'] as String,
      bloodType: json['bloodType'] as String?,
      gender: json['gender'] as String?,
      location: json['location'] as String?,
      phone: json['phone'] as String?,
    );

Map<String, dynamic> _$ProfileApiModelToJson(ProfileApiModel instance) =>
    <String, dynamic>{
      '_userId': instance.userId,
      'profileImage': instance.profileImage,
      'fname': instance.fname,
      'email': instance.email,
      'bloodType': instance.bloodType,
      'gender': instance.gender,
      'location': instance.location,
      'phone': instance.phone,
    };
