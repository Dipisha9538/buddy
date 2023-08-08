import 'package:blood_buddy/config/constants/color_constants.dart';
import 'package:blood_buddy/core/common/widgets/app_column.dart';
import 'package:blood_buddy/core/common/widgets/app_icons.dart';
import 'package:blood_buddy/core/common/widgets/big_text.dart';
import 'package:blood_buddy/core/common/widgets/expandable_text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DonorDetails extends StatelessWidget {
  const DonorDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            //Bg Image
            Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite, 
              height: 320,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                      "assets/images/person_1.png"
                    )
                  )
                ),
              ),
            ),
            //Icon Widgets
            const Positioned(
              top: 45,
              left: 20,
              right: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppIcon(icon: Icons.arrow_back_ios),
                  AppIcon(icon: CupertinoIcons.heart),
                ],
              ),
            ),
            //Personal Info
            Positioned(
              left: 0,
              right: 0,
              top: 320,
              child: Container(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20)
                    ),
                  color: Colors.white
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                const AppColumn(text: "Will Adams",),
                const SizedBox(height: 20,),
                BigText(text: "Personal Information", color: AppColors.mainColor,),
                const ExpandableTextWidget(
                  text: "Urgent 16 ounces blood(A+) needed for my father, admitted at Grande Hospital. If available kindly contact me.\n Patient name: Darshan Lal Shrestha, Age: 43 \n Blood Type: A+,    Needed by: 7/8/2023 \n Location: Grande Hospital, Tokha \n Contact no: 9800000000 ",
                  )
                ])
              )
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 120,
        padding: const EdgeInsets.only(top: 30, bottom: 30,left: 20, right: 20),
        decoration: const BoxDecoration(
          color: AppColors.buttonBackgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  const Icon(Icons.remove, color: AppColors.signColor),
                  BigText(text: "0 ounces", size: 20,),
                  const Icon(Icons.add, color: AppColors.signColor,)
                ],
              )
            ),
            Container(
              padding: const EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.green,
              ),
              child: BigText(text: "Donate Blood", size: 20, color: Colors.white,),
            )
          ],
        ),
      ),
    );
  }
}