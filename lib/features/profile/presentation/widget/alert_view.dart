// import 'package:blood_buddy/config/constants/api_endpoints.dart';
// import 'package:blood_buddy/config/constants/color_constants.dart';
// import 'package:blood_buddy/core/common/widgets/big_text.dart';
// import 'package:blood_buddy/core/common/widgets/small_text.dart';
// import 'package:blood_buddy/features/home/presentation/view/bottom_view/campaigns_page.dart';
// import 'package:blood_buddy/features/profile/presentation/viewmodel/profile_viewmodel.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:intl/intl.dart';

// import '../../../../core/common/snackbar/snackbar.dart';
// import '../../domain/entity/profile_entity.dart';

// class AlertedArt extends ConsumerStatefulWidget {
//   const AlertedArt({
//     Key? key,
//   }) : super(key: key);

//   @override
//   ConsumerState<AlertedArt> createState() => _AlertedArtState();
// }

// class _AlertedArtState extends ConsumerState<AlertedArt> {
//   final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
//       GlobalKey<RefreshIndicatorState>();

//   // Function to reload the data when the user triggers a refresh.
//   Future<void> _handleRefresh() async {
//     // Implement the logic to reload the data here.
//     ref.watch(profileViewModelProvider.notifier).getUserProfile();
//     ref.watch(homeViewModelProvider.notifier).getAlertArts();
//   }

//   bool _isArtExpired(DateTime upcomingDate) {
//     return upcomingDate.isBefore(DateTime.now());
//   }

//   @override
//   Widget build(BuildContext context) {
//     final screenSize = MediaQuery.of(context).size;
//     final isTablet = screenSize.shortestSide >= 600;
//     // final gap = SizedBox(height: isTablet ? 15.0 : 10.0);

//     var userState = ref.watch(profileViewModelProvider);
//     List<ProfileEntity> userData = userState.userData;

//     // var alertArtsState = ref.watch(homeViewModelProvider);
//     // List<HomeEntity> alertArts = alertArtsState.alertArts;

//     if (userData.isEmpty) {
//       return const Center(
//         child: CircularProgressIndicator(), // Show loader
//       );
//     }

//     if (userState.isLoading) {
//       return Scaffold(
//         body: Center(
//           child: RotationTransition(
//             turns: Tween(begin: 0.0, end: 1.0).animate(
//               CurvedAnimation(
//                 parent: const AlwaysStoppedAnimation(0.0),
//                 curve: Curves.linear,
//               ),
//             ),
//             child: const CircularProgressIndicator(
//               color: AppColors.mainBlackColor,
//               backgroundColor: Colors.grey,
//             ),
//           ),
//         ),
//       );
//     }

//     return RefreshIndicator(
//       key: _refreshIndicatorKey,
//       onRefresh: _handleRefresh,
//       child: Container(
//         height: isTablet ? 600 : 300,
//         padding: EdgeInsets.only(left: isTablet ? 20 : 10),
//         child: SingleChildScrollView(
//           child: GridView.builder(
//             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 2,
//               childAspectRatio: isTablet ? 225 / 260 : 90 / 130,
//             ),
//             shrinkWrap: true,
//             physics: const NeverScrollableScrollPhysics(),
//             // itemCount: alertArts.isEmpty ? 0 : alertArts.length,
//             itemCount: 1,
//             itemBuilder: (context, index) {
//               // if (alertArts.isEmpty) {
//               //   return Center(
//               //     child: SmallText(
//               //       text: 'No alert art post',
//               //       color: Colors.red,
//               //     ),
//               //   );
//               // }
//               // // Perform a null check to ensure the index is within the bounds of the list.
//               // if (index >= alertArts.length) {
//               //   return Container(); // Return an empty container if the index is out of bounds.
//               // }

//               // Get the current saved art
//               // final alertArt = alertArts[index];

//               final DateTime upcomingDate =
//                   DateTime.parse(alertArt.upcomingDate.toString());

//               // Check if the art has expired
//               bool isExpired = _isArtExpired(alertArt.upcomingDate);
//               // If the campaign has ended, show a message.
//               if (isExpired) {
//                 return SmallText(
//                   text: 'Campaign has already ended.',
//                   color: Colors.red,
//                 );
//               }

//               return Container(
//                 width: double.infinity,
//                 padding: isTablet
//                     ? const EdgeInsets.symmetric(horizontal: 20)
//                     : const EdgeInsets.symmetric(horizontal: 10),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Stack(
//                       children: [
//                         GestureDetector(
//                           onDoubleTap: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => const CampaignsPage(
//                                 ),
//                               ),
//                             );
//                           },
//                           child: ClipRRect(
//                             borderRadius: BorderRadius.circular(16),
//                             child: Image.network(
//                               alertArts[index].image == ""
//                                   ? "https://i.pinimg.com/564x/17/99/92/179992c2d7c70f86bfba2726f9e29afd.jpg"
//                                   : '${ApiEndpoints.baseURL}/uploads/${alertArts[index].image}',
//                               fit: isTablet ? BoxFit.fill : BoxFit.cover,
//                               width: isTablet ? 350 : 250,
//                               height: isTablet ? 350 : 190,
//                             ),
//                           ),
//                         ),
//                         Positioned(
//                           top: 0,
//                           right: 0,
//                           child: IconButton(
//                             onPressed: () async {
//                               bool confirmed = await showDialog(
//                                   context: context,
//                                   builder: (context) {
//                                     return AlertDialog(
//                                       title: BigText(
//                                         text: "Unalert Campaign",
//                                       ),
//                                       content: SmallText(
//                                           text:
//                                               "Are you sure you want to unalert this campaign?"),
//                                       actions: [
//                                         TextButton(
//                                           onPressed: () {
//                                             Navigator.pop(context, false);
//                                           },
//                                           child: SmallText(
//                                             text: "Cancel",
//                                             color: Colors.red,
//                                           ),
//                                         ),
//                                         TextButton(
//                                           onPressed: () {
//                                             Navigator.pop(context, true);
//                                           },
//                                           child:
//                                               SmallText(text: "Unalert"),
//                                         ),
//                                       ],
//                                     );
//                                   });
//                               if (confirmed) {
//                                 ref
//                                     .read(homeViewModelProvider.notifier)
//                                     .unAlertArt(alertArts[index].artId ?? "");
//                                 ref
//                                     .read(homeViewModelProvider.notifier)
//                                     .getAlertArts();
//                                 ref
//                                     .read(homeViewModelProvider.notifier)
//                                     .getAllArt();

//                                 // ignore: use_build_context_synchronously
//                                 showSnackBar(
//                                   message: "Campaign unalerted",
//                                   context: context,
//                                   color: Colors.red,
//                                 );

//                                 setState(() {});
//                               }
//                             },
//                             icon: const Icon(Icons.notifications_active),
//                             iconSize: isTablet ? 42 : 32,
//                           ),
//                         ),
//                       ],
//                     ),
//                     // gap,
//                     Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           SmallText(text: alertArts[index].title),
//                           Text(
//                             DateFormat.yMMMd().format(upcomingDate),
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: isTablet ? 22 : 20,
//                               color: Colors.white
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }