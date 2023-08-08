import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entity/profile_entity.dart';

part 'profile_api_model.g.dart';

final profileApiModelProvider = Provider<ProfileApiModel>(
  (ref) => ProfileApiModel.empty(),
);

@JsonSerializable()
class ProfileApiModel extends Equatable {
  @JsonKey(name: '_userId')
  final String? userId;
  final String? profileImage;
  final String fname;
  final String email;
  final String? bloodType;
  final String? gender;
  final String? location;
  final String? phone;

  const ProfileApiModel({
    this.userId,
    this.profileImage,
    required this.fname,
    required this.email,
    this.bloodType,
    this.gender,
    this.location,
    this.phone,
  });

  ProfileApiModel.empty()
      : userId = '',
        profileImage = '',
        fname = '',
        email = '',
        bloodType = '',
        gender = '',
        location = '',
        phone = '';
        // savedPosts = [];

  // Convert API object to entity
  ProfileEntity toEntity() => ProfileEntity(
        userId: userId ?? '',
        profileImage: profileImage,
        fname: fname,
        email: email,
        bloodType: bloodType,
        gender: gender,
        location: location,
        phone: phone,
      );

  // Convert entity to API object
  ProfileApiModel fromEntity(ProfileEntity entity) => ProfileApiModel(
        userId: entity.userId ?? '',
        profileImage: entity.profileImage,
        fname: entity.fname,
        email: entity.email,
        bloodType: entity.bloodType,
        gender: entity.gender,
        location: entity.location,
        phone: entity.phone,
      );

  // Convert API object list to entity list
  List<ProfileEntity> toEntityList(List<ProfileApiModel> models) =>
      models.map((model) => model.toEntity()).toList();

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

  //From Json
  factory ProfileApiModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileApiModelFromJson(json);

  // To Json
  Map<String, dynamic> toJson() => _$ProfileApiModelToJson(this);
}