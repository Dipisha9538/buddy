import 'package:blood_buddy/core/common/widgets/small_text.dart';
import 'package:flutter/cupertino.dart';

class IconandTextWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;
  
  const IconandTextWidget({super.key, 
  required this.icon, 
  required this.text, 
  required this.iconColor
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: iconColor, size: 28),
        const SizedBox(width: 5,),
        SmallText(text: text)
      ],

    );
  }
}