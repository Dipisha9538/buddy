import 'package:blood_buddy/config/constants/color_constants.dart';
import 'package:blood_buddy/features/home/presentation/view/bottom_view/campaigns_page.dart';
import 'package:blood_buddy/features/home/presentation/view/bottom_view/home_page/main_home_page.dart';
import 'package:blood_buddy/features/post/presentation/view/my_post.dart';
import 'package:blood_buddy/features/profile/presentation/view/profile/profile_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//Navigation Bar 

class Dashboard extends ConsumerStatefulWidget {
  final int selectedIndex;

  const Dashboard({Key? key, this.selectedIndex = 0}) : super(key: key);

  @override
  ConsumerState<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends ConsumerState<Dashboard> {
  int _selectedIndex = 0;

  List<Widget> lstBottomScreens = <Widget>[
    const HomePage(),
    const MyPostScreen(),
    const CampaignsPage(),
    ProfilePageView(),
  ];

    @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: lstBottomScreens[_selectedIndex],
          floatingActionButton: FloatingActionButton(
            backgroundColor: const Color.fromARGB(255, 228, 224, 224),
            shape: const CircleBorder(),
            onPressed: () {
              Navigator.pushNamed(context, '/post');
            },
            child: const Icon(
              Icons.add,
              color: AppColors.mainBlackColor,
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            fixedColor: AppColors.mainColor,
            unselectedItemColor: AppColors.mainBlackColor,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.history),
                label: 'History',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.event),
                label: 'Campaigns',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
            currentIndex: _selectedIndex,
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
        );
      },
    );
  }
}
