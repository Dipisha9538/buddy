// import 'package:blood_buddy/config/constants/color_constants.dart';
// import 'package:blood_buddy/core/common/widgets/app_column.dart';
// import 'package:blood_buddy/core/common/widgets/big_text.dart';
// import 'package:blood_buddy/core/common/widgets/iconandtext_widget.dart';
// import 'package:blood_buddy/core/common/widgets/small_text.dart';
// import 'package:blood_buddy/features/home/presentation/view/bottom_view/home_page/blood_groups_page/abminus_page.dart';
// import 'package:blood_buddy/features/home/presentation/view/bottom_view/home_page/blood_groups_page/abplus_page.dart';
// import 'package:blood_buddy/features/home/presentation/view/bottom_view/home_page/blood_groups_page/aminus_page.dart';
// import 'package:blood_buddy/features/home/presentation/view/bottom_view/home_page/blood_groups_page/aplus_page.dart';
// import 'package:blood_buddy/features/home/presentation/view/bottom_view/home_page/blood_groups_page/bminus_page.dart';
// import 'package:blood_buddy/features/home/presentation/view/bottom_view/home_page/blood_groups_page/bplus_page.dart';
// import 'package:blood_buddy/features/home/presentation/view/bottom_view/home_page/blood_groups_page/ominus_page.dart';
// import 'package:blood_buddy/features/home/presentation/view/bottom_view/home_page/blood_groups_page/oplus_page.dart';
// import 'package:dots_indicator/dots_indicator.dart';
// import 'package:flutter/material.dart';

// class BloodPageBody extends StatefulWidget {
//   const BloodPageBody({Key? key}) : super(key: key);

//   @override
//   State<BloodPageBody> createState() => _BloodPageBodyState();
// }

// class _BloodPageBodyState extends State<BloodPageBody> {
//   PageController pageController = PageController(viewportFraction: 0.85);
//   var _currPageValue = 0.0;
//   final double _scaleFactor = 0.0;
//   final double _height = 120;

//   @override
//   void initState() {
//     super.initState();
//     pageController.addListener(() {
//       setState(() {
//         _currPageValue = pageController.page!;
//       });
//     });
//   }

//   @override
//   void dispose() {
//     pageController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         //slider section
//         SizedBox(
//           height: 320,
//           child: PageView.builder(
//             controller: pageController,
//             itemCount: 5,
//             itemBuilder: (context, position) {
//               return _buildPageItem(position);
//             },
//           ),
//         ),
//         //dots
//         DotsIndicator(
//           dotsCount: 5,
//           position: _currPageValue,
//           decorator: DotsDecorator(
//             activeColor: AppColors.mainColor,
//             size: const Size.square(9.0),
//             activeSize: const Size(18.0, 9.0),
//             activeShape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(5.0),
//             ),
//           ),
//         ),
//         //Blood Groups Text
//         const SizedBox(
//           height: 20,
//         ),
//         Container(
//           margin: const EdgeInsets.only(left: 30),
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: [
//               BigText(text: "Blood Groups"),
//               const SizedBox(
//                 width: 10,
//               ),
//               Container(
//                 margin: const EdgeInsets.only(bottom: 3),
//                 child: BigText(text: ".", color: Colors.black26),
//               ),
//               const SizedBox(
//                 width: 10,
//               ),
//               Container(
//                 margin: const EdgeInsets.only(bottom: 2),
//                 child: SmallText(text: "Availability", color: Colors.black26),
//               ),
//             ],
//           ),
//         ),
//         const SizedBox(
//           height: 20,
//         ),
//         // Blood Groups with info and images
//         ListView.builder(
//           physics: const NeverScrollableScrollPhysics(),
//           shrinkWrap: true,
//           itemCount: 8,
//           itemBuilder: (context, index) {
//             // Define a list of blood groups
//             List<String> bloodGroups = ['A+', 'A-', 'B+', 'B-', 'O+', 'O-', 'AB+', 'AB-'];

//             // Define a list of image paths
//             List<String> imagePaths = [
//               "assets/images/aplus.png",
//               "assets/images/aminus.png",
//               "assets/images/bplus.png",
//               "assets/images/bminus.png",
//               "assets/images/oplus.png",
//               "assets/images/ominus.png",
//               "assets/images/abplus.png",
//               "assets/images/abminus.png",
//             ];

//             // Define a list of destination screens for each item
//             List<Widget> destinationScreens = [
//               const APlus(),
//               AMinus(),
//               const BPlus(),
//               const BMinus(),
//               const OPlus(),
//               const OMinus(),
//               ABPlus(),
//               ABMinus(),
//             ];

//             return GestureDetector(
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => destinationScreens[index],
//                   ),
//                 );
//               },
//               child: Container(
//                 margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
//                 child: Row(
//                   children: [
//                     // image section
//                     Container(
//                       width: 120,
//                       height: 120,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(20),
//                         color: Colors.white38,
//                         image: DecorationImage(
//                           fit: BoxFit.fill,
//                           image: AssetImage(imagePaths[index]),
//                         ),
//                       ),
//                     ),
//                     // Button Container
//                     Expanded(
//                       child: Container(
//                         height: 120,
//                         width: 200,
//                         decoration: const BoxDecoration(
//                           borderRadius: BorderRadius.only(
//                             topRight: Radius.circular(20),
//                             bottomRight: Radius.circular(20),
//                           ),
//                           color: Colors.white,
//                         ),
//                         child: Padding(
//                           padding: const EdgeInsets.only(left: 10, right: 10),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               BigText(text: "Blood Group: ${bloodGroups[index]}"),
//                               const SizedBox(height: 10),
//                               const Row(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 children: [
//                                   IconandTextWidget(
//                                     icon: Icons.emoji_people_outlined,
//                                     text: "DONATE",
//                                     iconColor: AppColors.mainColor,
//                                   ),
//                                   SizedBox(width: 50),
//                                   IconandTextWidget(
//                                     icon: Icons.handshake,
//                                     text: "REQUEST",
//                                     iconColor: Colors.greenAccent,
//                                   ),
//                                 ],
//                               ),
//                               const SizedBox(height: 2),
//                               ElevatedButton(
//                                 onPressed: () {
//                                   Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                       builder: (context) => destinationScreens[index],
//                                     ),
//                                   );
//                                 },
//                                 style: ButtonStyle(
//                                 backgroundColor: MaterialStateProperty.all<Color>(AppColors.mainColor),
//                                 ),
//                                 child: const Text('View Details', style: TextStyle(fontSize: 12)),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           },
//         ),
//         const SizedBox(height: 20)
//       ],
//     );
//   }

//   Widget _buildPageItem(int index) {
//     Matrix4 matrix = Matrix4.identity();
//     if (index == _currPageValue.floor()) {
//       var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
//       var currTrans = _height * (1 - currScale) / 2;
//       matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
//     } else if (index == _currPageValue.floor() + 1) {
//       var currScale = _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);
//       var currTrans = _height * (1 - currScale) / 2;
//       matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
//     } else {
//       matrix = Matrix4.diagonal3Values(1, _scaleFactor, 1);
//     }
//     return Transform(
//       transform: matrix,
//       child: Stack(
//         children: [
//           Container(
//             height: 220,
//             margin: const EdgeInsets.only(left: 10, right: 10),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(30),
//               color: index.isEven ? Colors.white : const Color.fromARGB(255, 182, 178, 178),
//               image: DecorationImage(
//                 fit: BoxFit.fill,
//                 image: AssetImage(
//                   "assets/images/person_${index + 1}.png",
//                 ),
//               ),
//             ),
//           ),
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: Container(
//               height: 140,
//               margin: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(20),
//                 color: Colors.white,
//                 boxShadow: const [
//                   BoxShadow(
//                     color: Color(0xFFe8e8e8),
//                     blurRadius: 5.0,
//                     offset: Offset(0, 5),
//                   ),
//                   BoxShadow(color: Colors.white, offset: Offset(-5, 0)),
//                   BoxShadow(color: Colors.white, offset: Offset(5, 0)),
//                 ],
//               ),
//               child: Container(
//                 padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
//                 child: const AppColumn(text: "Will Adams"),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }