import 'package:blood_buddy/config/constants/color_constants.dart';
import 'package:flutter/material.dart';

import '../../../../../config/router/app_route.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: AppColors.mainColor,
          onPressed: () {
              Navigator.popAndPushNamed(
                context, 
                AppRoute.homeRoute
              );
            },
        ),
        title: const Padding(
          padding: EdgeInsets.all(90.0),
          child: Text(
            'About',
            style: TextStyle(
              color: AppColors.mainColor,
              fontFamily: "Raleway Bold",
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            Image.asset(
              'assets/images/bbmainlogo.png',
              height: 200,
              width: 200,
            ),
            const SizedBox(height: 20),
            const Text(
              'BLOOD BUDDY',
              style: TextStyle(
                color: AppColors.mainColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'Developer: Jasmine Osti',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 40),
            Container(
              padding: const EdgeInsets.all(16),
              child: const Text(
                'Our Mission',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              child: const Text(
                'At Blood Buddy, our mission is to connect blood donors with those in need and make the blood donation process easier and more efficient. We believe that donating blood is a life-saving act, and through our platform, we aim to facilitate the donation process, raise awareness about the importance of blood donation, and ultimately save lives.',
                style: TextStyle(fontSize: 15),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              child: const Text(
                'Contact Us',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Email: info@bloodbuddy.com',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
