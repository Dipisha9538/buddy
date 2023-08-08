import 'package:blood_buddy/core/failure/failure.dart';
import 'package:blood_buddy/features/auth/domain/entity/user_entity.dart';
import 'package:blood_buddy/features/auth/domain/use_case/auth_usecase.dart';
import 'package:blood_buddy/features/auth/presentation/viewmodel/auth_view_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'auth_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<AuthUseCase>(),
  MockSpec<BuildContext>(),
])
void main() {
  late AuthUseCase mockAuthUseCase;
  late ProviderContainer container;
  late BuildContext context;
  late UserEntity userEntity;

  setUpAll(() {
    mockAuthUseCase = MockAuthUseCase();
    userEntity = const UserEntity(
            fname: 'Jasmine Osti',
            email: 'j@gmail.com',
            phone: '9865258511',
            password: 'jas123',
            confirmpassword: 'jas123');
    context = MockBuildContext();
    container = ProviderContainer(
      overrides: [
        authViewModelProvider.overrideWith(
          (ref) => AuthViewModel(mockAuthUseCase),
        ),
      ],
    );
  });

  test('check for the initial state', () async {
    final authState = container.read(authViewModelProvider);
    expect(authState.isLoading, false);
  });

  test('login test with valid email and password', () async {
    when(mockAuthUseCase.loginUser('j@gmail.com', 'jas123'))
        .thenAnswer((_) => Future.value(const Right(true)));

    //comparing viewmodel ko loginStudent with mock ko
    await container
        .read(authViewModelProvider.notifier)
        .loginUser(context, 'j@gmail.com', 'jas123');

    // state check
    final authState = container.read(authViewModelProvider);
    expect(authState.error, null);
  });

  test('login test with invalid email and password', () async {
    when(mockAuthUseCase.loginUser('jas@gmail.com', 'jas1234'))
        .thenAnswer((_) => Future.value(Left(Failure(error: 'Invalid'))));

    //comparing viewmodel ko loginStudent with mock ko
    await container
        .read(authViewModelProvider.notifier)
        .loginUser(context, 'jass@gmail.com', 'jas1234');

    // state check
    final authState = container.read(authViewModelProvider);
    expect(authState.error, isNotNull);
    // expect(authState.error, 'Invalid');
  });

  test('register test with valid credentials', () async {
    when(mockAuthUseCase.registerUser(userEntity))
        .thenAnswer((_) => Future.value(const Right(true)));

    await container.read(authViewModelProvider.notifier).registerUser(
        const UserEntity(
            fname: 'Jasmine Osti',
            email: 'j@gmail.com',
            phone: '9865258511',
            password: 'jas123',
            confirmpassword: 'jas123'));

    final authState = container.read(authViewModelProvider);
    expect(authState.error, null);
  });

  test('register test with invalid user information', () async {
    when(mockAuthUseCase.registerUser(userEntity))
        .thenAnswer((_) => Future.value(Left(Failure(error: "Invalid"))));

    await container
        .read(authViewModelProvider.notifier)
        .registerUser(const UserEntity(
            fname: 'Ayusha Shrestha',
            email: 'as123@gmail.com',
            phone: '9865258500',
            password: 'as12345',
            confirmpassword: 'as12345'));

    final authState = container.read(authViewModelProvider);
    expect(authState.error, isNotNull);
  });

  tearDownAll(() {
    container.dispose();
  });
}
