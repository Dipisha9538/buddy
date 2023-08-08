import 'package:blood_buddy/core/common/snackbar/snackbar.dart';
import 'package:blood_buddy/core/shared_prefs/usersharedprefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../config/router/app_route.dart';

final logoutViewModelProvider = StateNotifierProvider<LogoutViewModel, bool>(
  (ref) => LogoutViewModel(
    ref.read(userSharedPrefsProvider),
  ),
);

class LogoutViewModel extends StateNotifier<bool> {
  final UserSharedPrefs _userSharedPrefs;
  LogoutViewModel(this._userSharedPrefs) : super(false);

  void logout(BuildContext context) async {
    state = true;
    showSnackBar(
        message: 'Logging out ...', context: context, color: Colors.green);

    await _userSharedPrefs.deleteUserToken();
    Future.delayed(const Duration(milliseconds: 2000), () {
      state = false;
      Navigator.pushNamedAndRemoveUntil(
        context,
        AppRoute.loginRoute,
        (route) => false,
      );
    });
  }
}