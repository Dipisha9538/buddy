import 'package:blood_buddy/config/constants/color_constants.dart';
import 'package:blood_buddy/features/auth/presentation/view/confirmage_page.dart';
// import 'package:blood_buddy/features/auth/presentation/view/login_page.dart';
import 'package:flutter/material.dart';

class SuccessPage extends StatefulWidget {
  const SuccessPage({super.key});

  static const String route = 'SuccessPage';

  @override
  State<SuccessPage> createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late String successMessage;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _scaleAnimation = Tween<double>(begin: 0, end: 1).animate(_controller);
    _controller.forward();
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
        MaterialPageRoute(builder: (context) => const ConfirmAgePage()),
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
Widget build(BuildContext context) {
  successMessage =
      ModalRoute.of(context)?.settings.arguments as String? ?? '';
  return AnimatedBuilder(
    animation: _controller,
    builder: (context, child) {
      return Scaffold(
        body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Successfully Logged In!!!',
                style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'Raleway Bold',
                  color: AppColors.titleColor,
                ),
              ),
              const SizedBox(height: 10),
              Transform.scale(
                scale: _scaleAnimation.value,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.check_circle_rounded,
                      size: 150,
                      color: Colors.green,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      successMessage,
                      style: const TextStyle(
                        fontSize: 24,
                        fontFamily: 'Raleway Bold',
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
    }