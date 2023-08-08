// import 'package:flutter/material.dart';

// class PersonDetailsPage extends StatelessWidget {
//   final String name;
//   final int age;
//   final String phone;
//   final String location;
//   // final String imageAssetPath;

//   const PersonDetailsPage({
//     Key? key,
//     required this.name,
//     required this.age,
//     required this.phone,
//     required this.location,
//     // required this.imageAssetPath,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Person Details'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             CircleAvatar(
//               radius: 60,
//               backgroundImage: AssetImage(imageAssetPath),
//             ),
//             const SizedBox(height: 20),
//             Text(
//               'Name: $name',
//               style: const TextStyle(fontSize: 20),
//             ),
//             const SizedBox(height: 10),
//             Text(
//               'Age: $age',
//               style: const TextStyle(fontSize: 16),
//             ),
//             const SizedBox(height: 10),
//             Text(
//               'Phone: $phone',
//               style: const TextStyle(fontSize: 16),
//             ),
//             const SizedBox(height: 10),
//             Text(
//               'Location: $location',
//               style: const TextStyle(fontSize: 16),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }