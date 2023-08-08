import 'package:blood_buddy/config/constants/color_constants.dart';
import 'package:blood_buddy/features/auth/presentation/view/login_page.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

 @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Map<String, String>> onboardingData = [
    {
      'title': 'Donate Blood',
      'description':
          'Make a difference by donating blood. Your blood can save lives.',
      'image': 'assets/images/donateblood.png',
    },
    {
      'title': 'Find Donors',
      'description':
          'Easily find blood donors near you and connect with them.',
      'image': 'assets/images/finddonors.png',
    },
    {
      'title': 'Get Notified',
      'description':
          'Receive notifications about blood donation events and campaigns.',
      'image': 'assets/images/getnotified.png',
    },
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: onboardingData.length,
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                itemBuilder: (context, index) {
                  return buildOnboardingItem(
                    onboardingData[index]['title']!,
                    onboardingData[index]['description']!,
                    onboardingData[index]['image']!,
                  );
                },
              ),
            ),
            buildIndicator(),
            buildBottomButtons(),
          ],
        ),
      ),
    );
  }

  Widget buildOnboardingItem(String title, String description, String image) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            height: 300,
          ),
          const SizedBox(height: 32),
          Text(
            title,
            style: const TextStyle(
              color: AppColors.mainColor,
              fontSize: 24,
              fontWeight: FontWeight.bold,
              fontFamily: 'Raleway Semibold',
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            description,
            style: const TextStyle(
              color: AppColors.mainBlackColor,
              fontSize: 16,
              fontFamily: 'Raleway Regular'
              ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget buildIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        onboardingData.length,
        (index) => Container(
          width: 10,
          height: 10,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: index == _currentPage ? AppColors.mainColor : Colors.grey,
          ),
        ),
      ),
    );
  }

  Widget buildBottomButtons() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          ElevatedButton(
            onPressed: _currentPage == onboardingData.length - 1
                ? () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginPage()),
                    );
                  }
                : () {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.ease,
                    );
                  },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12), backgroundColor: _currentPage == onboardingData.length - 1 ? AppColors.mainColor : AppColors.mainColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              _currentPage == onboardingData.length - 1 ? 'Get Started' : 'Next',
              style: const TextStyle(fontSize: 18),
            ),
          ),
          const SizedBox(height: 16),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
            child: const Text(
              'Skip',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}