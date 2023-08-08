// import 'dart:io';

import 'package:blood_buddy/core/failure/failure.dart';
import 'package:blood_buddy/features/auth/data/repository/auth_remote_repository.dart';
import 'package:blood_buddy/features/auth/domain/entity/user_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authRepositoryProvider = Provider<IAuthRepository>((ref) {
  return ref.read(authRemoteRepositoryProvider);
});

abstract class IAuthRepository {
  Future<Either<Failure, bool>> registerUser(UserEntity user);
  Future<Either<Failure, bool>> loginUser(String email, String password);
}


