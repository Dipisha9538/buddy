// import 'package:blood_buddy/config/constants/color_constants.dart';
// import 'package:blood_buddy/core/common/widgets/big_text.dart';
// import 'package:blood_buddy/core/common/widgets/small_text.dart';
// import 'package:blood_buddy/features/home/presentation/view/bottom_view/home_page/blood_page_body.dart';
// import 'package:flutter/material.dart';

// import '../../../../../../config/router/app_route.dart';

// class MainHomePage extends StatefulWidget {
// static const String route = 'HomeScreen';
//   const MainHomePage({super.key});

//   @override
//   State<MainHomePage> createState() => _MainHomePageState();
// }

// class _MainHomePageState extends State<MainHomePage> {
//   bool _isSearchBarVisible = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           children: [
//             //Header Part
//             Container(
//               margin: const EdgeInsets.only(top: 45, bottom: 15),
//               padding: const EdgeInsets.only(left: 20, right: 20),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           BigText(text: "Blood Buddy", color: AppColors.mainColor),
//                           Row(
//                             children: [
//                               SmallText(text: "About Us", color: Colors.black54),                 
//                             IconButton(
//                               onPressed: () {
//                               Navigator.popAndPushNamed(
//                                 context, 
//                                   AppRoute.aboutRoute
//                                   );
//                                   },
//                                   icon: const Icon(
//                                   Icons.info_outline,
//                                 color: AppColors.mainColor,),),
//                             ],
//                           ),
//                         ],
//                       ),
//                       GestureDetector(
//                         onTap: () {
//                           setState(() {
//                             _isSearchBarVisible = !_isSearchBarVisible;
//                           });
//                         },
//                         child: Container(
//                           width: 45,
//                           height: 45,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(15),
//                             color: const Color.fromARGB(137, 217, 195, 195),
//                           ),
//                           child: Icon(Icons.search, color: _isSearchBarVisible ? AppColors.mainColor : AppColors.mainColor, size: 24),
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 10),
//                   // Search Bar
//                   AnimatedContainer(
//                     duration: const Duration(milliseconds: 300),
//                     height: _isSearchBarVisible ? 50 : 0,
//                     padding: const EdgeInsets.symmetric(horizontal: 20),
//                     child: TextField(
//                       decoration: InputDecoration(
//                         hintText: "Search...",
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(25),
//                           borderSide: BorderSide.none,
//                         ),
//                         filled: true,
//                         fillColor: Colors.grey.shade200,
//                         contentPadding: const EdgeInsets.symmetric(vertical: 10),
//                         prefixIcon: _isSearchBarVisible ? const Icon(Icons.search) : null,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             //Body Part
//             const Expanded(
//               child: SingleChildScrollView(
//                 child: BloodPageBody(),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'blood_group/a_negative.dart';
import 'blood_group/a_positive.dart';
import 'blood_group/ab_negative.dart';
import 'blood_group/ab_positive.dart';
import 'blood_group/b_negative.dart';
import 'blood_group/b_positive.dart';
import 'blood_group/o_negative.dart';
import 'blood_group/o_positive.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  TabController? _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 8, vsync: this);
    super.initState();
  }

  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          sliderBanner(),
          const SizedBox(
            height: 10,
          ),
          const Text(
            " Blood Group",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 10,
          ),
          bloodGroups(context),
          const SizedBox(
            height: 5,
          ),
          tabBarView()
        ],
      ),
    );
  }

  Expanded tabBarView() {
    return Expanded(
        child: TabBarView(
      physics: const NeverScrollableScrollPhysics(),
      controller: _tabController,
      children: const [
        APositive(),
        OPositive(),
        BPositive(),
        ABPositive(),
        ANegative(),
        ONegative(),
        BNegative(),
        ABNegative(),
      ],
    ));
  }

  Container bloodGroups(BuildContext context) {
    return Container(
      color: Colors.white,
      child: TabBar(
        controller: _tabController,
        // isScrollable: true,
        labelPadding: const EdgeInsets.symmetric(horizontal: 3.0),
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorPadding: const EdgeInsets.all(2),
        indicator: ShapeDecoration(
            color: Theme.of(context).primaryColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0))),
        unselectedLabelColor: Colors.black87,
        labelColor: Colors.white,
        labelStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
        tabs: const [
          Tab(
            text: "A+",
          ),
          Tab(
            text: "O+",
          ),
          Tab(
            text: "B+",
          ),
          Tab(
            text: "AB+",
          ),
          Tab(
            text: "A-",
          ),
          Tab(
            text: "O-",
          ),
          Tab(
            text: "B-",
          ),
          Tab(
            text: "AB-",
          ),
        ],
      ),
    );
  }

  Widget sliderBanner() {
    return SizedBox(
      height: 200,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            CarouselSlider.builder(
                options: CarouselOptions(
                  autoPlay: true,
                  viewportFraction: 1.0,
                  enableInfiniteScroll: true,
                  initialPage: 0,
                  height: 180,
                  autoPlayInterval: const Duration(seconds: 5),
                  enlargeCenterPage: false,
                  autoPlayAnimationDuration: const Duration(milliseconds: 500),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  pauseAutoPlayOnTouch: false,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
                itemBuilder: (BuildContext context, int index, int realIndex) {
                  return GestureDetector(
                      onTap: () {},
                      child: SizedBox(
                          width: double.maxFinite,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              "assets/images/banner${index}.png",
                              fit: BoxFit.cover,
                            ),
                          )));
                },
                itemCount: 3),
            SizedBox(
              height: 50.0,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    width: 8.0,
                    height: 8.0,
                    margin: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 2.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black54),
                      shape: BoxShape.circle,
                      color: _currentIndex == index
                          ? Colors.red
                          : Colors.transparent,
                    ),
                  );
                },
                itemCount: 3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
