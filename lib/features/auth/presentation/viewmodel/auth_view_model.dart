// import 'dart:io';
import 'package:blood_buddy/core/common/snackbar/snackbar.dart';
import 'package:blood_buddy/features/auth/domain/entity/user_entity.dart';
import 'package:blood_buddy/features/auth/domain/use_case/auth_usecase.dart';
import 'package:blood_buddy/features/auth/presentation/state/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authViewModelProvider =
    StateNotifierProvider<AuthViewModel, AuthState>((ref) {
  return AuthViewModel(
    ref.read(authUseCaseProvider),
  );
});

class AuthViewModel extends StateNotifier<AuthState> {
  final AuthUseCase _authUseCase;

  AuthViewModel(this._authUseCase) : super(AuthState(isLoading: false));

  Future<void> registerUser(UserEntity user) async {
    state = state.copyWith(isLoading: true);
    var data = await _authUseCase.registerUser(user);
    data.fold(
      (failure) => state = state.copyWith(
        isLoading: false,
        error: failure.error,
      ),
      (success) => state = state.copyWith(
        isLoading: false,
        error: null,
      ),
    );
  }

  Future<void> loginUser(
    BuildContext context, //yo kaile pani nalekhne
    String email, String password
    ) async {
    state = state.copyWith(isLoading: true);
    var data = await _authUseCase.loginUser(email, password);
    data.fold(
      (failure) {
          state = state.copyWith(isLoading: false, error: failure.error);
          showSnackBar(
            message: failure.error, context: context, color: Colors.red
        );
      },
      (success) {
        state = state.copyWith(isLoading: false, error: null);
        Navigator.popAndPushNamed(
          context, '/success',
        );
      },
    );
  }
}

