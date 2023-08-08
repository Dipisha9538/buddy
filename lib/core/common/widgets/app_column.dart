import 'package:blood_buddy/config/constants/color_constants.dart';
import 'package:blood_buddy/core/common/widgets/big_text.dart';
import 'package:blood_buddy/core/common/widgets/iconandtext_widget.dart';
import 'package:blood_buddy/core/common/widgets/small_text.dart';
import 'package:flutter/material.dart';

class AppColumn extends StatefulWidget {
  final String text;
  const AppColumn({super.key, required this.text});

  @override
  State<AppColumn> createState() => _AppColumnState();
}

class _AppColumnState extends State<AppColumn> {
      @override
      Widget build(BuildContext context) {
        return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BigText(text: widget.text, size: 30,),
                      const SizedBox(height: 10,),
                      Row(
                        children: [
                          Wrap(
                            children: List.generate(1, (index) {return const Icon(Icons.water_drop_outlined, color:AppColors.mainColor, size: 15);}),
                          ),
                          const SizedBox(width: 10,),
                          SmallText(text: "A+"),
                          const SizedBox(width: 10,),
                          SmallText(text: "Age: 23")
                        ],
                      ),
                      const SizedBox(height: 25,),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconandTextWidget(
                            icon: Icons.male_outlined, 
                            text: "Male", 
                            iconColor: AppColors.iconColor1,
                          ),
                          SizedBox(width: 5,),
                          IconandTextWidget(
                            icon: Icons.location_on, 
                            text: "Kathmandu", 
                            iconColor: AppColors.iconColor2
                          ),
                          SizedBox(width: 5,),
                          IconandTextWidget(
                            icon: Icons.phone_callback_outlined, 
                            text: "Contact", 
                            iconColor: Colors.greenAccent,
                          ),
                        ],
                      )
                    ],
                  );
                }
}