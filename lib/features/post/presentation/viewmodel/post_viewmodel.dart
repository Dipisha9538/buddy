import 'dart:io';

import 'package:blood_buddy/features/home/presentation/view/dashboard_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/common/snackbar/snackbar.dart';
import '../../domain/entity/post_entity.dart';
import '../../domain/use_case/post_usecase.dart';
import '../state/post_state.dart';

final postViewModelProvider =
    StateNotifierProvider<PostViewModel, PostState>((ref) {
  return PostViewModel(
    ref.read(postUseCaseProvider),
  );
});

class PostViewModel extends StateNotifier<PostState> {
  final PostUseCase postUseCase;

  PostViewModel(this.postUseCase) : super(PostState.initial()){
    // getPosts();
  }

  Future<void> uploadImage(File? file) async {
    state = state.copyWith(isLoading: true);
    var data = await postUseCase.uploadNewBloodPost(file!);
    data.fold(
      (l) {
        state = state.copyWith(isLoading: false, error: l.error);
      },
      (imageName) {
        state =
            state.copyWith(isLoading: false, error: null, imageName: imageName);
      },
    );
  }

  Future<void> addBlood(BuildContext context, PostEntity blood) async {
    state = state.copyWith(isLoading: true);
    var data = await postUseCase.addBlood(blood);
    data.fold(
      (failure) {
        state = state.copyWith(
          isLoading: false,
          error: failure.error,
        );
        showSnackBar(message: failure.error, context: context, color: Colors.red);
      },
      (success) {
        state = state.copyWith(isLoading: false, error: null);
        showSnackBar(message: "Successfully posted", context: context);
        Navigator.push(context,
          MaterialPageRoute(
            builder: (context) =>
                const Dashboard(selectedIndex: 0),
          ),
         );
      },
    );
  }
}