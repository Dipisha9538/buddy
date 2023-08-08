import 'package:blood_buddy/core/common/snackbar/snackbar.dart';
import 'package:blood_buddy/config/constants/color_constants.dart';
import 'package:flutter/material.dart';

class ConfirmAgePage extends StatefulWidget {
  const ConfirmAgePage({Key? key}) : super(key: key);

  @override
  State<ConfirmAgePage> createState() => _ConfirmAgePageState();
}

class _ConfirmAgePageState extends State<ConfirmAgePage> {
  DateTime? selectedDate;
  bool isAbove18 = false;

  // This is the function to check if the user is eligible based on age.
  bool isUserEligible(DateTime? date) {
    if (date == null) return false;

    final currentDate = DateTime.now();
    var age = currentDate.year - date.year;

    if (currentDate.month < date.month) {
      age--;
    } else if (currentDate.month == date.month) {
      if (currentDate.day < date.day) {
        age--;
      }
    }

    return age >= 18;
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/finddonors.png',
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 20),
            const DefaultTextStyle(
              style: TextStyle(
                fontFamily: 'Raleway Regular',
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.mainColor,
              ),
              child: Text(
                'Confirm Your Age!!!',
              ),
            ),
            const SizedBox(height: 20),
            const DefaultTextStyle(
              style: TextStyle(
                fontFamily: 'Raleway Regular',
                fontSize: 16,
                color: AppColors.mainBlackColor,
              ),
              child: Text(
                'Please confirm that you are eligible \n for blood donation.',
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            CheckboxListTile(
              title: const Text('I am 18 years old or above.'),
              value: isAbove18,
              activeColor: AppColors.mainColor,
              onChanged: (value) {
                setState(() {
                  isAbove18 = value ?? false;
                });
              },
            ),
            if (isAbove18)
              Column(
                children: [
                  ElevatedButton(
                    onPressed: () => _selectDate(context),
                    child: const Text('Select Date of Birth'),
                  ),
                  if (selectedDate != null)
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        'Selected Date: ${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}',
                        style: const TextStyle(fontSize: 16, fontFamily: "Raleway Bold", fontWeight: FontWeight.w500),
                      ),
                    ),
                  ElevatedButton(
                    onPressed: () {
                      if (selectedDate == null) {
                        showSnackBar(context: context, message: 'Please select your date of birth.', color: Colors.grey);
                      } else if (isUserEligible(selectedDate)) {
                        showSnackBar(context: context, message: 'Age confirmed.', color: Colors.green);
                        // If eligible, the user is navigated to the main page after 2 seconds.
                        Future.delayed(const Duration(seconds: 2), () {
                          Navigator.pushReplacementNamed(context, '/home');
                        });
                      } else {
                        showSnackBar(context: context, message: 'You are not eligible to donate blood.', color: Colors.grey);
                      }
                    },
                    child: const Text('Confirm'),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
