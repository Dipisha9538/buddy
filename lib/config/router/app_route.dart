import 'package:blood_buddy/features/auth/presentation/view/login_page.dart';
import 'package:blood_buddy/features/auth/presentation/view/register_page.dart';
import 'package:blood_buddy/features/home/presentation/view/dashboard_page.dart';
import 'package:blood_buddy/features/post/presentation/view/my_post.dart';
import 'package:blood_buddy/features/profile/presentation/view/profile/profile_page_view.dart';
import 'package:blood_buddy/features/splash/presentation/view/onboarding_page.dart';

import '../../features/auth/presentation/view/confirmage_page.dart';
import '../../features/auth/presentation/view/success_page.dart';
import '../../features/comment/presentation/view/comment_view.dart';
import '../../features/home/presentation/view/bottom_view/post_view.dart';
import '../../features/profile/presentation/view/profile/about_page.dart';
import '../../features/profile/presentation/view/profile/change_password_view.dart';
import '../../features/profile/presentation/view/profile/update_profile_view.dart';
import '../../features/splash/presentation/view/splash_page.dart';

class AppRoute {
  AppRoute._();

  static const String splashRoute = '/splash';
  static const String onboardingRoute = '/onboarding';
  static const String loginRoute = '/';
  static const String registerRoute = '/register';
  static const String successRoute = '/success';
  static const String confirmAgeRoute = '/confirmage';
  static const String homeRoute = '/home';
  static const String postRoute = '/post';
  static const String profileRoute = '/profile';
  static const String editprofileRoute = '/editprofile';
  static const String aboutRoute = '/about';
  static const String changePasswordRoute = '/changepw';
  static const String commentRoute = '/comment';

  static getApplicationRoute() {
    return {
      splashRoute: (context) => const SplashView(),
      onboardingRoute: (context) => const OnboardingPage(),
      loginRoute: (context) => const LoginPage(),
      registerRoute: (context) => const RegisterPage(),
      successRoute: (context) => const SuccessPage(),
      confirmAgeRoute: (context) => const ConfirmAgePage(),
      homeRoute: (context) => const Dashboard(),
      postRoute: (context) => const MyPostScreen(),
      profileRoute: (context) => ProfilePageView(),
      editprofileRoute: (context) => const UpdateProfileView(),
      aboutRoute: (context) => const AboutPage(),
      changePasswordRoute: (context) => const ChangePasswordView(),
      commentRoute: (context) => const CommentView(),
      
    };
  }
}
