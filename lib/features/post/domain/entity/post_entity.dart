import 'package:equatable/equatable.dart';

class PostEntity extends Equatable{
  final String title;
  final String content;
  final List<String> contentImg; // Changed the type to List<String>
  final String date;

  const PostEntity({
      required this.title,
      required this.content,
      required this.contentImg,
      required this.date,
  });

  //to json
  factory PostEntity.fromJson(Map<String, dynamic> json) {
    return PostEntity(
      title: json["title"],
      content: json["content"],
      contentImg:
          List<String>.from(json["contentImg"]), // Convert to List<String>
      date: json["date"],
    );
  }

  // from json
  Map<String, dynamic> toJson() {
    return {
        "title": title,
        "content": content,
        "contentImg": contentImg,
        "date": date,
    };
  }

  // @override
  // String toString() {
  //   return 'PostEntity(fullName: $fullName, image: $image, address: $address, gender: $gender, bloodGroup: $bloodGroup, dob: $dob, phone: $phone, telNo: $telNo)';
  // }

  @override
  List<Object?> get props => [
title, content, contentImg, date,
  ];
}