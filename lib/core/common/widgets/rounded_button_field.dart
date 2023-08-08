import 'package:blood_buddy/core/common/widgets/big_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app_color_constants.dart';

class RoundedButton extends ConsumerWidget {
  final String text;
  final void Function() press;
  final Color color, textColor;
  const RoundedButton({
    super.key, 
    required this.text, 
    required this.press, 
    this.color = AppColorConstant.neutralColor,
    this.textColor = AppColorConstant.mainSecondaryColor
  });


  @override
  Widget build(BuildContext context, WidgetRef ref) {
        // final screenSize = MediaQuery.of(context).size;
    // final isTablet = screenSize.shortestSide >= 600;
    return SizedBox(
      width: double.infinity,
    child: ElevatedButton(
      onPressed: press, 
      child: BigText(
        text:text,
        color: AppColorConstant.mainSecondaryColor,
      ),
    ),
    );
  }
}
