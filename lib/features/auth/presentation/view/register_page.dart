import 'package:blood_buddy/config/constants/color_constants.dart';
import 'package:blood_buddy/core/common/snackbar/snackbar.dart';
import 'package:blood_buddy/features/auth/domain/entity/user_entity.dart';
import 'package:blood_buddy/features/auth/presentation/view/login_page.dart';
import 'package:blood_buddy/features/auth/presentation/viewmodel/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegisterPage extends ConsumerStatefulWidget {
  const RegisterPage({super.key});

  @override
  ConsumerState<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends ConsumerState<RegisterPage> {
  final _key = GlobalKey<FormState>();
  final fnameController = TextEditingController(text: '');
  final emailController = TextEditingController(text: '');
  final passwordController = TextEditingController(text: '');

  // String? selectedBloodType;
  // String? selectedGender;

  // final List<String> bloodTypes = [
  //   'A+',
  //   'A-',
  //   'B+',
  //   'B-',
  //   'AB+',
  //   'AB-',
  //   'O+',
  //   'O-',
  // ];

  // List<String> genders = [
  //   'Male','Female','Other',
  // ];


  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authViewModelProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Form(
                key: _key,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () {
                          Navigator.pushReplacement(
                          context,
                        MaterialPageRoute(builder: (context) => 
                        const LoginPage()));
                        },
                      ),
                    ),
                    Image.asset(
                      'assets/images/bbmainlogo.png',
                      width: 100,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Register Here!',
                          style: TextStyle(
                              color: AppColors.titleColor,
                              fontFamily: "Raleway Bold",
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          'Please enter your details.',
                          style: TextStyle(
                              color: AppColors.mainColor,
                              fontFamily: "Raleway Bold",
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                      const SizedBox(height: 20),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: TextFormField(
                            key: const ValueKey('Full Name'),
                            obscureText: false,
                            controller: fnameController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Full Name',
                              hintText: "Enter Full Name",
                              prefixIcon: Icon(
                                Icons.person,
                                color: AppColors.mainBlackColor,
                              ),
                            contentPadding: EdgeInsets.symmetric(vertical: 10),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: AppColors.mainColor),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: AppColors.mainColor),
                            ), 
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Fields cannot be empty.';
                              }
                              return null;
                            },
                            cursorColor: AppColors.mainBlackColor,
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: TextFormField(
                            key: const ValueKey('Email Address'),
                            obscureText: false,
                            controller: emailController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Email Address',
                              hintText: "Enter Email Address",
                              prefixIcon: Icon(
                                Icons.email,
                                color: AppColors.mainBlackColor,
                              ),
                            contentPadding: EdgeInsets.symmetric(vertical: 10),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: AppColors.mainColor),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: AppColors.mainColor),
                            ),                              
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Fields cannot be empty.';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.emailAddress,
                            cursorColor: AppColors.mainBlackColor,
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      // Container(
                      //   padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                      //   width: double.infinity,
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(8),
                      //   ),
                      //   child: Center(
                      //     child: TextFormField(
                      //       key: const ValueKey('Phone Number'),
                      //       obscureText: false,
                      //       controller: phController,
                      //       inputFormatters: [
                      //       FilteringTextInputFormatter.digitsOnly,
                      //       ],
                      //       decoration: const InputDecoration(
                      //         border: OutlineInputBorder(),
                      //         labelText: 'Phone No.',
                      //         hintText: "Enter Phone Number",
                      //         prefixIcon: Icon(
                      //           Icons.phone_callback,
                      //           color: AppColors.mainBlackColor,
                      //         ),
                      //       contentPadding: EdgeInsets.symmetric(vertical: 10),
                      //       enabledBorder: OutlineInputBorder(
                      //         borderSide: BorderSide(color: AppColors.mainColor),
                      //       ),
                      //       focusedBorder: OutlineInputBorder(
                      //         borderSide: BorderSide(color: AppColors.mainColor),
                      //       ),                              
                      //       ),
                      //       validator: (value) {
                      //         if (value!.isEmpty) {
                      //           return 'Fields cannot be empty.';
                      //         }
                      //         return null;
                      //       },
                      //       keyboardType: TextInputType.phone,
                      //       cursorColor: AppColors.mainBlackColor,
                      //     ),
                      //   ),
                      // ),
                    // const SizedBox(height: 5),
                    Container(
                        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: TextFormField(
                            key: const ValueKey('Password'),
                            obscureText: true,
                            controller: passwordController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Password',
                              hintText: "Enter Password",
                              prefixIcon: Icon(
                                Icons.lock,
                                color: AppColors.mainBlackColor,
                              ),
                              suffixIcon: Icon(Icons.remove_red_eye_outlined, color: AppColors.mainBlackColor,),
                              contentPadding: EdgeInsets.symmetric(vertical: 10), 
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColors.mainColor),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColors.mainColor),
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Fields cannot be empty.';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    // const SizedBox(height: 5),
                    //     Container(
                    //     padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                    //     width: double.infinity,
                    //     decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(8),
                    //     ),
                    //     child: Center(
                    //       child: TextFormField(
                    //         key: const ValueKey('Confirm Password'),
                    //         obscureText: true,
                    //         controller: cpasswordController,
                    //         decoration: const InputDecoration(
                    //           border: OutlineInputBorder(),
                    //           labelText: 'Confirm Password',
                    //           hintText: 'Confirm Password',
                    //           prefixIcon: Icon(
                    //             Icons.lock,
                    //             color: AppColors.mainBlackColor,
                    //           ),
                    //           suffixIcon: Icon(Icons.remove_red_eye_outlined, color: AppColors.mainBlackColor,),
                    //           contentPadding: EdgeInsets.symmetric(vertical: 10), 
                    //           enabledBorder: OutlineInputBorder(
                    //             borderSide: BorderSide(color: AppColors.mainColor),
                    //           ),
                    //           focusedBorder: OutlineInputBorder(
                    //             borderSide: BorderSide(color: AppColors.mainColor),
                    //           ),
                    //         ),
                    //         validator: (value) {
                    //           if (value!.isEmpty) {
                    //             return 'Fields cannot be empty.';
                    //           }
                    //           return null;
                    //         },
                    //       ),
                    //     ),
                    //   ),
                    const SizedBox(height: 5),
                    const Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_key.currentState!.validate()) {
                          var user = UserEntity(
                            fname: fnameController.text,
                            email: emailController.text,
                            password: passwordController.text,
                          );
                          ref
                              .read(authViewModelProvider.notifier)
                              .registerUser(user);
                          if (authState.error != null) {
                            showSnackBar(
                              message: authState.error.toString(),
                              context: context,
                              color: Colors.red,
                            );
                          } else {
                            showSnackBar(
                              message: 'Registered Successfully',
                              context: context,
                              color: Colors.green,
                            );
                            Future.delayed(const Duration(seconds: 2), () {
                            Navigator.pushReplacementNamed(context, '/');
                            });
                          }
                        }
                      },
                      child: const SizedBox(
                        height: 25,
                        child: Center(
                          child: Text(
                            'Register',
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Raleway Regular',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                        const SizedBox(height: 30),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Already have an account?",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: AppColors.titleColor,
                              ),
                            ),
                            const SizedBox(width: 10),
                            TextButton(
                              onPressed: () {
                                Navigator.pushReplacementNamed(
                                  context,
                                  '/',
                                );
                              },
                              child: const Text(
                                "Sign In",
                                style: TextStyle(
                                  color: AppColors.mainColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
