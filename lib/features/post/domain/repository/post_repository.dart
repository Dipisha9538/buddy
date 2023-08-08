import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/failure/failure.dart';
import '../../data/repository/post_remote_repository.dart';
import '../entity/post_entity.dart';

final postRepositoryProvider = Provider<IPostRepository>((ref) {
  return ref.read(postRemoteRepositoryProvider);
});

abstract class IPostRepository {
  Future<Either<Failure, bool>> addBlood(PostEntity blood);
  Future<Either<Failure, String>> uploadNewBloodPost(File file);
}