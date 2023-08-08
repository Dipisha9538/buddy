// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostApiModel _$PostApiModelFromJson(Map<String, dynamic> json) => PostApiModel(
      title: json['_id'] as String,
      content: json['content'] as String,
      contentImg: (json['contentImg'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      date: json['date'] as String,
    );

Map<String, dynamic> _$PostApiModelToJson(PostApiModel instance) =>
    <String, dynamic>{
      '_id': instance.title,
      'content': instance.content,
      'contentImg': instance.contentImg,
      'date': instance.date,
    };
