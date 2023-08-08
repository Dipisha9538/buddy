import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/failure/failure.dart';
import '../../domain/entity/post_entity.dart';
import '../../domain/repository/post_repository.dart';
import '../data_source/post_remote_data_source.dart';

final postRemoteRepositoryProvider = Provider<IPostRepository>(
  (ref) =>  PostRemoteRepositoryImpl(
    postRemoteDataSource: ref.read(postRemoteDataSourceProvider),
  ),
);

class PostRemoteRepositoryImpl implements IPostRepository {
  final PostRemoteDataSource postRemoteDataSource;
  PostRemoteRepositoryImpl({required this.postRemoteDataSource});
  @override
  Future<Either<Failure, String>> uploadNewBloodPost(File file) {
    return postRemoteDataSource.uploadNewBloodPost(file);
  }

  @override
  Future<Either<Failure, bool>> addBlood(PostEntity blood) {
    return postRemoteDataSource.addBlood(blood);
  }
}