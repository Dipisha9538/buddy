import 'package:blood_buddy/config/constants/color_constants.dart';
import 'package:blood_buddy/features/profile/presentation/widget/body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../viewmodel/logout_view_model.dart';

class ProfilePageView extends ConsumerStatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  ProfilePageView({super.key});

  @override
  ConsumerState<ProfilePageView> createState() => _ProfilePageViewState();
}

class _ProfilePageViewState extends ConsumerState<ProfilePageView> {
  // double _proximityValue = 0;
  // final List<StreamSubscription<dynamic>> _streamSubscriptions =
  //     <StreamSubscription<dynamic>>[];

  // @override
  // void initState() {
  //   super.initState();
  //   _streamSubscriptions.add(proximityEvents!.listen((ProximityEvent event) {
  //     setState(() {
  //       _proximityValue = event.proximity;
  //       if (_proximityValue < 0.2) {
  //         // Change the theme to dark
  //         ref.read(themeProvider).isDark = true;
  //       } else {
  //         // Change the theme to light
  //         ref.read(themeProvider).isDark = false;
  //       }
  //     });
  //   }));
  // }

  // @override
  // void dispose() {
  //   for (final subscription in _streamSubscriptions) {
  //     subscription.cancel();
  //   }
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    // final themeNotifier = ref.watch(themeProvider);
    final screenSize = MediaQuery.of(context).size;
    final isTablet = screenSize.shortestSide >= 600;
    return Scaffold(
      key: widget.scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
              'Profile',
              style: TextStyle(
                color: AppColors.mainColor,
                fontFamily: "Raleway Bold",
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1.0),
            child: Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                      color: Colors.white, width: 1.0),
                ),
              ),
            )),
        actions: [
          IconButton(
            onPressed: () {
              ref.read(logoutViewModelProvider.notifier).logout(context);
            },
            icon: Icon(
              Icons.logout,
              size: isTablet ? 35 : 25,
              color: AppColors.mainColor,
            ),
          ),
        ],
      ),
      body: const Body(),
    );
  }
}