import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entity/post_entity.dart';

part 'post_api_model.g.dart';

// provider for PostApiModel
final postApiModelProvider = Provider.autoDispose<PostApiModel>(
  (ref) => PostApiModel.empty(),
);

@JsonSerializable()
class PostApiModel extends Equatable{
  @JsonKey(name: '_id')
  final String title;
  final String content;
  final List<String> contentImg; // Changed the type to List<String>
  final String date;

  PostApiModel({
    required this.title,
    required this.content,
    required this.contentImg,
    required this.date,
  });

  // empty constructor
  PostApiModel.empty()
    : title = '',
      content = '',
      contentImg = [],
      date = '';

  // to json
  factory PostApiModel.fromJson(
    Map<String, dynamic> json) => 
      _$PostApiModelFromJson(json);

  // from json
  Map<String, dynamic> toJson() => 
    _$PostApiModelToJson(this);

  // convert PostApiModel to PostEntity
  PostEntity toEntity() => PostEntity(
        title: title,
        content: content,
        contentImg: contentImg,
        date: date,
  );

  // convert entity to api object
  PostApiModel fromEntity(PostEntity entity) => PostApiModel(
        title: title,
        content: content,
        contentImg: contentImg,
        date: date,
  );

  // convert PostApiModel list to PostEntity list
  List<PostEntity> toEntityList(List<PostApiModel> models) =>
    models.map((model) => model.toEntity()).toList();

  // @override
  // String toString() {
  //   return 'PostApiModel(fullName: $fullName, image: $image, address: $address, gender: $gender, bloodGroup: $bloodGroup, dob: $dob, phone: $phone, telNo: $telNo)';
  // }
  
  @override
  List<Object?> get props => [
        title,
        content,
        contentImg,
        date,
  ];
}