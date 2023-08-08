
import 'package:blood_buddy/config/router/app_route.dart';
import 'package:blood_buddy/core/common/widgets/med_text.dart';
import 'package:blood_buddy/features/profile/presentation/view/profile/profile_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../config/constants/color_constants.dart';
import '../../../../../core/common/snackbar/snackbar.dart';
import '../../../../../core/common/widgets/app_color_constants.dart';
import '../../../../../core/common/widgets/rounded_button_field.dart';
import '../../../../../core/common/widgets/rounded_input_field.dart';
import '../../../domain/entity/profile_entity.dart';
import '../../viewmodel/profile_viewmodel.dart';

class UpdateProfileView extends ConsumerStatefulWidget {
  const UpdateProfileView({Key? key}) : super(key: key);

  @override
  ConsumerState<UpdateProfileView> createState() => _UpdateProfileViewState();
}

class _UpdateProfileViewState extends ConsumerState<UpdateProfileView> {

  final _updateProfileKey = GlobalKey<FormState>();
  final _fnameController = TextEditingController();
  final _emailController = TextEditingController();
  final _bloodTypeController = TextEditingController();
  final _genderController = TextEditingController();
  final _locationController = TextEditingController();
  final _phoneController = TextEditingController();
  
    @override
  void initState() {
    super.initState();
    var userState = ref.read(profileViewModelProvider);
    List<ProfileEntity> userData = userState.userData;
    if (userData.isNotEmpty) {
      _fnameController.text = userData[0].fname;
      _emailController.text = userData[0].email;
      _bloodTypeController.text = userData[0].bloodType ?? "";
      _genderController.text = userData[0].gender ?? "";
      _locationController.text = userData[0].location ?? "";
      _phoneController.text = userData[0].phone ?? "";
    }
  }

  @override
  void dispose() {
    _fnameController.dispose();
    _emailController.dispose();
    _bloodTypeController.dispose();
    _genderController.dispose();
    _locationController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
     var userState = ref.watch(profileViewModelProvider);
    List<ProfileEntity> userData = userState.userData;

    var profileState = ref.watch(profileViewModelProvider.notifier);

    if (userData.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(), // Show loader
      );
    }

    final screenSize = MediaQuery.of(context).size;
    final isTablet = screenSize.shortestSide >= 600;
    final gap = SizedBox(height: isTablet ? 18.0 : 16.0);

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
              'Update Profile',
              style: TextStyle(
                color: AppColors.mainColor,
                fontFamily: "Raleway Bold",
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
           actions: [
          IconButton(
            onPressed: () {
              Navigator.popAndPushNamed(
                context, 
                AppRoute.changePasswordRoute
              );
            },
            icon: Icon(
              Icons.lock,
              size: isTablet ? 35 : 25,
              color: AppColors.mainColor,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Form(
              key: _updateProfileKey,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                   MedText(
                    text: "Full Name", 
                  ),
                  RoundedInputField(
                    controller: _fnameController,
                    hintText: "",
                    // onChanged: (value) {},
                    keyboardType: TextInputType.name,
                  ),
                  gap,
                   MedText(
                    text: "Email",
                  ),
                  // gap,
                  RoundedInputField(
                    controller: _emailController,
                    hintText: "",
                    // onChanged: (value) {},
                    keyboardType: TextInputType.emailAddress,
                  ),
                  gap,
                   MedText(
                    text: "Blood Type",
                  ),
                  // gap,
                  RoundedInputField(
                    controller: _bloodTypeController,
                    hintText: "",
                    // onChanged: (value) {},
                    keyboardType: TextInputType.text,
                  ),
                  gap,
                   MedText(
                    text: "Gender",
                  ),
                  // gap,
                  RoundedInputField(
                    controller: _genderController,
                    hintText: "",
                    // onChanged: (value) {},
                    keyboardType: TextInputType.text,
                  ),
                  gap,
                  MedText(
                    text: "Location",
                  ),
                  // gap,
                  RoundedInputField(
                    controller: _locationController,
                    hintText: "",
                    // onChanged: (value) {},
                    keyboardType: TextInputType.text,
                  ),
                  gap,
                  MedText(
                    text: "Ph. Number",
                  ),
                  // gap,
                  RoundedInputField(
                    controller: _phoneController,
                    hintText: "",
                    // onChanged: (value) {},
                    keyboardType: TextInputType.number,
                  ),
                  gap,
                ],
              ),
            ),
            // gap,
            SizedBox(
              width: isTablet ? 700 : 375,
              child: RoundedButton(
                text: "Save Changes",
                press: () async {
                  if (_updateProfileKey.currentState!.validate()) {
                    //create a new profile entity
                    ProfileEntity profile = ProfileEntity(
                      fname: _fnameController.text,
                      email: _emailController.text,
                      bloodType: _bloodTypeController.text,
                      gender: _genderController.text,
                      location: _locationController.text,
                      phone: _phoneController.text,
                    );
    
                    //call the edit profile method
                    await profileState.editProfile(profile);
    
                    await ref
                        .read(profileViewModelProvider.notifier)
                        .getUserProfile();
    
                    // ignore: use_build_context_synchronously
                    showSnackBar(
                      message: 'Profile Updated Successfully.', 
                      context: context,
                      color: AppColorConstant.successColor,
                    );
                    Future.delayed(const Duration(seconds: 2), () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfilePageView(),
                        ),
                      );
                      
                    });
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}