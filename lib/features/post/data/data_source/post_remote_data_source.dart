import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../config/constants/api_endpoints.dart';
import '../../../../core/failure/failure.dart';
import '../../../../core/network/remote/http_service.dart';
import '../../../../core/shared_prefs/usersharedprefs.dart';
import '../../../auth/data/model/auth_api_model.dart';
import '../../domain/entity/post_entity.dart';
import '../model/post_api_model.dart';

// create provider for PostRemoteDataSource
final postRemoteDataSourceProvider =
    Provider.autoDispose<PostRemoteDataSource>((ref) {
  return PostRemoteDataSource(
    dio: ref.read(httpServiceProvider),
    postApiModel: ref.read(postApiModelProvider),
    userSharedPrefs: ref.read(userSharedPrefsProvider),
    authApiModel: ref.read(authApiModelProvider),
  );
});

class PostRemoteDataSource {
  final Dio dio;
  final PostApiModel postApiModel;
  final UserSharedPrefs userSharedPrefs;
  final AuthApiModel authApiModel;

  PostRemoteDataSource({
    required this.dio,
    required this.postApiModel,
    required this.authApiModel,
    required this.userSharedPrefs,
  });

  Future<Either<Failure, bool>> addBlood(PostEntity blood) async {
    try {
      String? token;
      await userSharedPrefs.getUserToken().then(
            (value) => value.fold((l) => null, (r) => token = r),
          );
      var response = await dio.post(
        ApiEndpoints.addBlood,
        // data: homeApiModel.fromEntity(blog).toJson(),
        data: {
          'title': blood.title,
          'content': blood.content,
          'contentImg': blood.contentImg,
        },
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      if (response.statusCode == 201) {
        return const Right(true);
      } else {
        return Left(
          Failure(
            error: response.data['message'],
            statusCode: response.statusCode.toString(),
          ),
        );
      }
    } on DioException catch (e) {
      return Left(
        Failure(
          error: e.message.toString(),
        ),
      );
    }
  }

  // Upload image using multipart
  Future<Either<Failure, String>> uploadNewBloodPost(
    File image,
  ) async {
    try {
      String fileName = image.path.split('/').last;
      FormData formData = FormData.fromMap(
        {
          'image': await MultipartFile.fromFile(
            image.path,
            filename: fileName,
          ),
        },
      );

      Response response = await dio.post(
        ApiEndpoints.uploadImage,
        data: formData,
      );

      return Right(response.data["data"]);
    } on DioException catch (e) {
      return Left(
        Failure(
          error: e.error.toString(),
          statusCode: e.response?.statusCode.toString() ?? '0',
        ),
      );
    }
  }
}
