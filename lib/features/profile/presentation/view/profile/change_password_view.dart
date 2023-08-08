import 'package:blood_buddy/config/constants/color_constants.dart';
import 'package:blood_buddy/core/common/widgets/big_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../config/constants/api_endpoints.dart';
import '../../../../../core/common/snackbar/snackbar.dart';
import '../../../../../core/common/widgets/med_text.dart';
import '../../../domain/entity/password_entity.dart';
import '../../../domain/entity/profile_entity.dart';
import '../../viewmodel/password_viewmodel.dart';
import '../../viewmodel/profile_viewmodel.dart';

class ChangePasswordView extends ConsumerStatefulWidget {
  const ChangePasswordView({Key? key}) : super(key: key);

  @override
  ConsumerState<ChangePasswordView> createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends ConsumerState<ChangePasswordView> {
  // Create form key and text editing controllers
  final _formKey = GlobalKey<FormState>();
  final _oldPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmNewPasswordController = TextEditingController();

  bool _obscureOldPassword = true;
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  void _toggleOldPasswordVisibility() {
    setState(() {
      _obscureOldPassword = !_obscureOldPassword;
    });
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  void _toggleConfirmPasswordVisibility() {
    setState(() {
      _obscureConfirmPassword = !_obscureConfirmPassword;
    });
  }

  @override
  void dispose() {
    // Dispose the text editing controllers
    _oldPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmNewPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isTablet = screenSize.shortestSide >= 600;
    final gap = SizedBox(height: isTablet ? 20 : 10);
    var userState = ref.watch(profileViewModelProvider);
    List<ProfileEntity> userData = userState.userData;

    // var passwordState = ref.watch(passwordViewModelProvider);

    if (userData.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(), // Show loader
      );
    }

    return Scaffold(
          appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
          leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: AppColors.mainColor,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
              'Change Password',
              style: TextStyle(
                color: AppColors.mainColor,
                fontFamily: "Raleway Bold",
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
          ),
        body: SafeArea(
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(8.0),
                      margin: isTablet ? 
                        const EdgeInsets.fromLTRB(20, 200.0, 20, 0) 
                        : const EdgeInsets.fromLTRB(20, 130.0, 20, 0),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(30.0),
                        ),
                      ),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Positioned(
                            top: -60,
                            left: 0,
                            right: 0,
                            child: Center(
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 3.0,
                                  ),
                                ),
                                child: CircleAvatar(
                                  radius: 60,
                                  backgroundColor: Colors.white,
                                  child: CircleAvatar(
                                    radius: 100,
                                    backgroundImage: NetworkImage(
                                      '${ApiEndpoints.baseURL}/uploads/${userData[0].profileImage}',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 80.0),
                            child: Center(
                              child: Column(
                                children: [
                                  BigText(
                                    text: userData[0].fname,
                                    color: AppColors.mainBlackColor,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 160.0,
                              left: 18.0,
                              right: 18.0,
                              bottom: 18.0,
                            ),
                            child: Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      gap,
                                      TextFormField(
                                        controller: _oldPasswordController,
                                        obscureText: _obscureOldPassword,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Old Password is required';
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          hintText: 'Old Password',
                                          hintStyle: TextStyle(
                                              color: Colors.grey[500],
                                              fontSize: isTablet ? 25 : 22),
                                          filled: true,
                                          fillColor: Colors.grey[200],
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            borderSide: BorderSide.none,
                                          ),
                                          suffixIcon: IconButton(
                                            icon: _obscureOldPassword
                                                ? const Icon(
                                                    Icons.visibility_off)
                                                : const Icon(Icons.visibility),
                                            onPressed:
                                                _toggleOldPasswordVisibility,
                                          ),
                                        ),
                                      ),
                                      gap,
                                      TextFormField(
                                        controller: _newPasswordController,
                                        obscureText: _obscurePassword,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'New Password is required';
                                          }
                                          if (value.length < 8) {
                                            return 'New Password must be at least 8 characters long';
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          hintText: 'New Password',
                                          hintStyle: TextStyle(
                                              color: Colors.grey[500],
                                              fontSize: isTablet ? 25 : 22),
                                          filled: true,
                                          fillColor: Colors.grey[200],
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            borderSide: BorderSide.none,
                                          ),
                                          suffixIcon: IconButton(
                                            icon: _obscurePassword
                                                ? const Icon(
                                                    Icons.visibility_off)
                                                : const Icon(Icons.visibility),
                                            onPressed:
                                                _togglePasswordVisibility,
                                          ),
                                        ),
                                      ),
                                      gap,
                                      TextFormField(
                                        controller:
                                            _confirmNewPasswordController,
                                        obscureText: _obscureConfirmPassword,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Confirm New Password is required';
                                          }
                                          if (value !=
                                              _newPasswordController.text) {
                                            return 'New Password and Confirm New Password must match';
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          hintText: 'Confirm New Password',
                                          hintStyle: TextStyle(
                                              color: Colors.grey[500],
                                              fontSize: isTablet ? 25 : 22),
                                          filled: true,
                                          fillColor: Colors.grey[200],
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            borderSide: BorderSide.none,
                                          ),
                                          suffixIcon: IconButton(
                                            icon: _obscureConfirmPassword
                                                ? const Icon(
                                                    Icons.visibility_off)
                                                : const Icon(Icons.visibility),
                                            onPressed:
                                                _toggleConfirmPasswordVisibility,
                                          ),
                                        ),
                                      ),
                                      gap,
                                      gap,
                                      SizedBox(
                                        width: double.infinity,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            if (_formKey.currentState!
                                                .validate()) {
                                              ref
                                                  .read(
                                                      passwordViewModelProvider
                                                          .notifier)
                                                  .changePassword(
                                                    PasswordEntity(
                                                      oldPassword:
                                                          _oldPasswordController
                                                              .text,
                                                      newPassword:
                                                          _newPasswordController
                                                              .text,
                                                      confirmPassword:
                                                          _confirmNewPasswordController
                                                              .text,
                                                    ),
                                                  );

                                              showSnackBar(
                                                  message:
                                                      "Password Changed Successfully.",
                                                  context: context);

                                              _oldPasswordController.clear();
                                              _newPasswordController.clear();
                                              _confirmNewPasswordController
                                                  .clear();
                                            }
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: AppColors.mainColor,
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 16.0,
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                          ),
                                          child: MedText(
                                            text:
                                                'Confirm', 
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}