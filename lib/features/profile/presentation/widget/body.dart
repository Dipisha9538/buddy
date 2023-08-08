import 'dart:io';

import 'package:blood_buddy/config/constants/color_constants.dart';
import 'package:blood_buddy/config/router/app_route.dart';
import 'package:blood_buddy/core/common/widgets/big_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

// import '../../domain/entity/profile_entity.dart';
import '../../../../config/constants/api_endpoints.dart';
import '../../../../core/common/widgets/med_text.dart';
import '../../../../core/common/widgets/small_text.dart';
import '../viewmodel/profile_viewmodel.dart';

class Body extends ConsumerStatefulWidget {
  const Body({super.key});

  @override
  ConsumerState<Body> createState() => _BodyState();
}

class _BodyState extends ConsumerState<Body> {
  checkCameraPermission() async {
    if (await Permission.camera.request().isRestricted ||
        await Permission.camera.request().isDenied) {
      await Permission.camera.request();
    }
  }

  File? _img;
  Future _browseImage(WidgetRef ref, ImageSource imageSource) async {
    try {
      final image = await ImagePicker().pickImage(source: imageSource);
      if (image != null) {
        setState(() {
          _img = File(image.path);
          ref
              .read(profileViewModelProvider.notifier)
              .uploadProfilePicture(_img!);
        });
      } else {
        return;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  // Function to reload the data when the user triggers a refresh.
  Future<void> _handleRefresh() async {
    // Implement the logic to reload the data here.
    ref.watch(profileViewModelProvider.notifier).getUserProfile();
    // ref.watch(homeViewModelProvider.notifier).getAlertArts();
  }

  String loggedInFullname = '';
  XFile? profileImageFile;

  @override
  void initState() {
    super.initState();
    fetchLoggedInFullname();
    fetchLoggedInProfileImage();
  }


  Future<void> fetchLoggedInFullname() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? fullname = prefs.getString('fullname');
    if (fullname != null) {
      setState(() {
        loggedInFullname = fullname;
      });
    }
  }

  Future fetchLoggedInProfileImage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? profileImagePath = prefs.getString('profile_image');
    // ignore: unnecessary_null_comparison
    if (profileImagePath != null) {
      setState(() {
        profileImageFile = XFile(profileImagePath);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // var userArtState = ref.watch(homeViewModelProvider);
    // var userState = ref.watch(profileViewModelProvider);
    // List<ProfileEntity> userData = userState.userData;

    var profileState = ref.watch(profileViewModelProvider);

    // if (userData.isEmpty) {
    //   return const Center(child: CircularProgressIndicator()); //show loader
    // }

    final screenSize = MediaQuery.of(context).size;
    final isTablet = screenSize.shortestSide >= 600;
    final gap = SizedBox(height: isTablet ? 18.0 : 16.0);

     if (profileState.isLoading) {
      return Scaffold(
        body: Center(
          child: RotationTransition(
            turns: Tween(begin: 0.0, end: 1.0).animate(
              CurvedAnimation(
                parent: const AlwaysStoppedAnimation(0.0),
                curve: Curves.linear,
              ),
            ),
            child: const CircularProgressIndicator(
              color: AppColors.mainBlackColor,
              backgroundColor: Colors.grey,
            ),
          ),
        ),
      );
    }

    return SingleChildScrollView(
      child: RefreshIndicator(
        key: _refreshIndicatorKey,
        onRefresh: _handleRefresh,
        child: Padding(
          padding: isTablet
              ? const EdgeInsets.only(
                  top: 10,
                  bottom: 10)
              : const EdgeInsets.only(
                  top: 20,
                  bottom: 20),
          child: Column(
                  children: [
                    InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            constraints: const BoxConstraints(
                              maxWidth: double.infinity,
                            ),
                            backgroundColor: Colors.grey[800],
                            context: context,
                            isScrollControlled: true,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(20),
                              ),
                            ),
                            builder: (context) => Padding(
                              padding: isTablet
                                  ? const EdgeInsets.all(18)
                                  : const EdgeInsets.all(20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  ElevatedButton.icon(
                                    onPressed: () {
                                      checkCameraPermission();
                                      _browseImage(ref, ImageSource.camera);
                                      Navigator.pop(context);
                                      // Upload image it is not null
                                    },
                                    icon: const Icon(Icons.camera),
                                    label: SmallText(
                                      text: 'Camera',
                                      color: Colors.white
                                    ),
                                  ),
                                  ElevatedButton.icon(
                                    onPressed: () {
                                      _browseImage(ref, ImageSource.gallery);
                                      Navigator.pop(context);
                                    },
                                    icon: const Icon(Icons.image),
                                    label: SmallText(
                                      text: 'Gallery',
                                      color: Colors.white
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        child: SizedBox(
                          height: isTablet ? 300 : 250,
                          width: isTablet ? 300 : 250,
                          child: CircleAvatar(
                            radius: isTablet ? 70 : 60,
                            backgroundColor: Colors.transparent,
                            foregroundColor: Colors.transparent,
                            child: ClipOval(
                              child: _img != null
                                ? Image.file(
                                  _img!,
                                  fit: BoxFit.cover,
                                  height: isTablet ? 300 : 250,
                                  width: isTablet ? 300 : 250,
                                )
                                : profileState.userData[0].profileImage != null
                                ? Image.network(
                                    '${ApiEndpoints.baseURL}/uploads/${profileState.userData[0].profileImage ?? ''}',
                                    // 'https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8fDA%3D&w=1000&q=80',
                                  fit: BoxFit.cover,
                                  height: isTablet ? 300 : 250,
                                  width: isTablet ? 300 : 250,
                                )
                                : Image.asset(
                                  'assets/images/default.png',
                                  fit: BoxFit.cover,
                                  height: isTablet ? 300 : 250,
                                  width: isTablet ? 300 : 250,
                                ),
                            ),
                          ),
                        )),
                    gap,
                    BigText(
                          text: profileState.userData[0].fname,
                    ),
                    SizedBox(height: isTablet ? 15.0 : 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SmallText(
                          text: profileState.userData[0].email,
                        ),
                        const SizedBox(width: 10),
                      ],
                    ),
                    SizedBox(height: isTablet ? 15.0 : 10.0),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white),
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          AppRoute.editprofileRoute
                        );
                      },
                      child: MedText(
                        text: "Edit Profile",
                      ),
                    ),
                    gap,
                    Container(
                      padding: isTablet
                          ? const EdgeInsets.fromLTRB(20.0, 0, 20, 9)
                          : const EdgeInsets.fromLTRB(15.0, 0, 15.0, 0),
                      width: isTablet ? 700 : double.infinity,
                      child: Text(
                        profileState.userData[0].bloodType ?? 'No Bloodtype.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: isTablet ? 24 : 22,
                          height: isTablet ? 2 : 1.5,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}