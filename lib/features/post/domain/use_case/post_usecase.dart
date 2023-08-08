import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/failure/failure.dart';
import '../entity/post_entity.dart';
import '../repository/post_repository.dart';

final postUseCaseProvider = Provider(
  (ref) => PostUseCase(
    postRepository: ref.watch(postRepositoryProvider)
  ),
);

class PostUseCase {
  final IPostRepository postRepository;

  PostUseCase({ required this.postRepository});

  Future<Either<Failure, String>> uploadNewBloodPost(File file) async {
    return await postRepository.uploadNewBloodPost(file);
  }

  Future<Either<Failure, bool>> addBlood(PostEntity blood) async {
    return await postRepository.addBlood(blood);
  }
}