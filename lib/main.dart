import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/app.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}


















// import 'package:blood_buddy/pages/registration_page/register_page.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// void main() => runApp(const BloodBuddyApp());

// class BloodBuddyApp extends StatelessWidget {
//   const BloodBuddyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: RegisterPage(),
//     );
//   }
// }

