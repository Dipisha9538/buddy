// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// import '../../../../../config/constants/color_constants.dart';
// import '../../../../../core/common/widgets/api_provider.dart';
// import '../../../../../core/common/widgets/colors.dart';
// import '../../../../../core/common/widgets/constant.dart';

// class AddPage extends StatefulWidget {
//   const AddPage({Key? key}) : super(key: key);

//   @override
//   State<AddPage> createState() => _AddPageState();
// }

// class _AddPageState extends State<AddPage> {
//   // final APIProvider _apiProvider = APIProvider();
//   final _formKey = GlobalKey<FormState>();
//   bool isChecked = false;
//   String? _bloodGroup;
//   String? _gender;
//   final TextEditingController _fullName = TextEditingController();
//   final TextEditingController _address = TextEditingController();
//   final TextEditingController _dob = TextEditingController();
//   final TextEditingController _phone = TextEditingController();
//   final TextEditingController _telNo = TextEditingController();
//   File? _image;
//   final _picker = ImagePicker();
//   Future<void> _openImagePicker() async {
//     final XFile? pickedImage =
//         await _picker.pickImage(source: ImageSource.gallery);
//     if (pickedImage != null) {
//       setState(() {
//         _image = File(pickedImage.path);
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: AppColors.mainColor,
//         title: const Text("Add Post"),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           child: SafeArea(
//             child: Form(
//               key: _formKey,
//               child: Column(
//                 children: [
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   TextFormField(
//                       controller: _fullName,
//                       validator: Validator.isRequired,
//                       decoration: Constant.textFormFieldDecoration(
//                           "FullName", "FullName", Icons.person)),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   TextFormField(
//                       keyboardType: TextInputType.datetime,
//                       controller: _dob,
//                       validator: Validator.isRequired,
//                       decoration: Constant.textFormFieldDecoration(
//                           "DOB", "dob", Icons.person)),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   TextFormField(
//                       controller: _address,
//                       validator: Validator.isRequired,
//                       decoration: Constant.textFormFieldDecoration(
//                           "Address", "Address", Icons.location_on)),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   SizedBox(
//                     height: 55,
//                     child: DropdownButtonHideUnderline(
//                       child: DropdownButtonFormField(
//                         decoration: Constant.dropDownDecoration(),
//                         hint: const Text(
//                           "Blood Group",
//                           style: TextStyle(
//                               color: Colors.black54,
//                               fontSize: 14,
//                               fontWeight: FontWeight.w500),
//                         ),
//                         isExpanded: true,
//                         iconSize: 30.0,
//                         style: const TextStyle(color: Colors.black),
//                         items: <String>[
//                           'A+',
//                           'O+',
//                           'B+',
//                           'AB+',
//                           'A-',
//                           'O-',
//                           'B-',
//                           'AB-',
//                         ].map(
//                           (val) {
//                             return DropdownMenuItem<String>(
//                               value: val,
//                               child: Text(val),
//                             );
//                           },
//                         ).toList(),
//                         onChanged: (val) {
//                           setState(
//                             () {
//                               _bloodGroup = val.toString();
//                             },
//                           );
//                         },
//                       ),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   SizedBox(
//                     height: 55,
//                     child: DropdownButtonHideUnderline(
//                       child: DropdownButtonFormField(
//                         decoration: Constant.dropDownDecoration(),
//                         hint: const Text(
//                           "Gender",
//                           style: TextStyle(
//                               color: Colors.black54,
//                               fontSize: 14,
//                               fontWeight: FontWeight.w500),
//                         ),
//                         isExpanded: true,
//                         iconSize: 30.0,
//                         style: const TextStyle(color: Colors.black),
//                         items: <String>['Male', 'Female', "Others"].map(
//                           (val) {
//                             return DropdownMenuItem<String>(
//                               value: val,
//                               child: Text(val),
//                             );
//                           },
//                         ).toList(),
//                         onChanged: (val) {
//                           setState(
//                             () {
//                               _gender = val.toString();
//                             },
//                           );
//                         },
//                       ),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   TextFormField(
//                     keyboardType: TextInputType.number,
//                     controller: _phone,
//                     validator: Validator.isRequired,
//                     decoration: Constant.textFormFieldDecoration(
//                         "Phone", "Phone", Icons.phone_android),
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   TextFormField(
//                     keyboardType: TextInputType.number,
//                     controller: _telNo,
//                     decoration: Constant.textFormFieldDecoration(
//                         "Tel No", "Telno", Icons.phone),
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   Container(
//                     height: 55,
//                     width: double.infinity,
//                     decoration: BoxDecoration(
//                         color: MyColor.backgroundColor,
//                         borderRadius: BorderRadius.circular(8)),
//                     child: Padding(
//                       padding: const EdgeInsets.only(left: 10),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           _image != null
//                               ? Image.file(_image!, fit: BoxFit.cover)
//                               : const Text('Please select an image'),
//                           Container(
//                             height: 55,
//                             decoration: const BoxDecoration(
//                                 color: Colors.grey,
//                                 borderRadius: BorderRadius.only(
//                                     topRight: Radius.circular(10),
//                                     bottomRight: Radius.circular(10))),
//                             child: TextButton(
//                                 onPressed: _openImagePicker,
//                                 child: const Text(
//                                   "Choose Image",
//                                   style: TextStyle(color: Colors.white),
//                                 )),
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   Constant.authButton("Donate", () async {
//                     if (_formKey.currentState!.validate()) {
//                       // final response = await _apiProvider.donateBlood(
//                       //     fullName: _fullName.text,
//                       //     address: _address.text,
//                       //     bloodGroup: _bloodGroup!,
//                       //     gender: _gender!,
//                       //     dob: _dob.text,
//                       //     phone: _phone.text,
//                       //     telNo: _telNo.text,
//                       //     image: _image!.path);
//                       // if (response.success == true) {
//                       //   ScaffoldMessenger.of(context).showSnackBar(
//                       //       const SnackBar(content: Text("Success")));
//                       // } else {
//                       //   ScaffoldMessenger.of(context).showSnackBar(
//                       //       const SnackBar(content: Text("Failed")));
//                       // }
//                     }
//                   }),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'dart:io';

import 'package:blood_buddy/features/post/domain/entity/post_entity.dart';
import 'package:blood_buddy/features/post/presentation/viewmodel/post_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../core/common/snackbar/snackbar.dart';

class AddPage extends ConsumerStatefulWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  ConsumerState<AddPage> createState() => _AddPageState();
}

class _AddPageState extends ConsumerState<AddPage> {
  late TextEditingController _titleController;
  late TextEditingController _contentController;
  late TextEditingController _contentImgController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _contentController = TextEditingController();
    _contentImgController = TextEditingController();
  }

  File? _image;
  List<File>? _contentimg;
  bool _isExpanded = false;

  Future<void> getImage(WidgetRef ref) async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedImage != null) {
        _image = File(pickedImage.path);
        ref.read(postViewModelProvider.notifier).uploadImage(_image!);
      } else {
        print('No image selected.');
      }
    });
  }

  Future<void> getcontentImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickMultiImage();

    setState(() {
      if (pickedImage != null) {
        _contentimg =
            pickedImage.map((pickedImage) => File(pickedImage.path)).toList();
      } else {
        print('No image selected.');
      }
    });
  }

  void _toggleExpand() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Column(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        getImage(ref);
                      },
                      child: Container(
                        width: double.infinity,
                        height: screenHeight * 0.3,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: _image == null
                            ? const Center(
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      SizedBox(height: 50.0),
                                      Icon(
                                        Icons.add_a_photo,
                                        size: 80,
                                        color: Colors.grey,
                                      ),
                                      SizedBox(height: 16.0),
                                      Text(
                                        'Select the cover image',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 16.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            : ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Image.file(
                                  _image!,
                                  fit: BoxFit.cover,
                                ),
                              ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20.0),
              Opacity(
                opacity: 0.28,
                child: SizedBox(
                  width: double.infinity,
                  child: TextFormField(
                    controller: _titleController,
                    decoration: InputDecoration(
                      errorStyle: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      hintText: 'Type title in here',
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      labelStyle: const TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter the title';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              Opacity(
                opacity: 0.28,
                child: SizedBox(
                  width: double.infinity,
                  child: TextFormField(
                    controller: _contentController,
                    textAlignVertical:
                        TextAlignVertical.top, // Align text to the top
                    decoration: InputDecoration(
                      errorStyle: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      hintText: 'Write your post here',
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      labelStyle: const TextStyle(
                        color: Colors.black,
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: _isExpanded
                            ? 60.0
                            : 140.0, // Increased initial height
                        horizontal: 20.0,
                      ),
                    ),
                    maxLines: null, // Allow the text to wrap to multiple lines
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please write your post';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      await getcontentImage();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff5ab5d1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 90,
                        vertical: 11,
                      ),
                    ),
                    child: const Text(
                      "Add Gallery",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17.92,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () {
                      final title = _titleController.text;
                      final content = _contentController.text;

                      PostEntity blood = PostEntity(
                        title: title,
                        content: content,
                        contentImg: const [],
                        date: '',
                      );

                      ref.read(postViewModelProvider.notifier).addBlood;

                      _titleController.clear();
                      _contentController.clear();
                      _contentImgController.clear();
                      setState(() {
                        _image = null;
                        // _contentimg = null;

                        Navigator.pop(context);

                        showSnackBar(
                          context: context,
                          message: 'Post added successfully',
                          color: Colors.green,
                        );
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff5ab5d1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 90,
                        vertical: 11,
                      ),
                    ),
                    child: const Text(
                      "Add Post",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17.92,
                        fontFamily: "Raleway",
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),

                  // CircleAvatar(
                  //   backgroundColor: Colors.white,
                  //   child: IconButton(
                  //     icon: const Icon(Icons.send),
                  //     color: Colors.black,
                  //     onPressed: () {
                  //       // Add send comment functionality here
                  //       final title: _titleController.text;
                  //      final content: _contentController.text;
                  //       // contentImg: _contentImgController.text;
                  //       // blogCover: _blogCoverController.text;

                  //       HomeEntity blog = HomeEntity(
                  //         title: title,
                  //         content: content,
                  //         contentImg: [],
                  //         blogCover: '',
                  //         date: '',
                  //         user: {},

                  //       );

                  //       ref.read(homeViewModelProvider.notifier).addBlog(blog);

                  //       _titleController.clear();
                  //       _contentController.clear();
                  //       _contentImgController.clear();
                  //       _blogCoverController.clear();

                  //       setState(() {
                  //         _image = null;
                  //         // _contentimg = null;

                  //         Navigator.pop(context);

                  //   showSnackBar(
                  //     context: context,
                  //     message: 'Book added successfully',
                  //     color: Colors.green,
                  //   );

                  //       });
                  //     },
                  //   ),
                  // ),
                ],
              ),
              const SizedBox(height: 20.0),
              SizedBox(
                height: 120.0,
                child: _contentimg == null || _contentimg!.isEmpty
                    ? const SizedBox()
                    : ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _contentimg!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: Image.file(
                                _contentimg![index],
                                fit: BoxFit.cover,
                                width: 120.0,
                                height: 120.0,
                              ),
                            ),
                          );
                        },
                      ),
              ),

              const SizedBox(height: 20.0),
              // _contentimg == null
              //     ? const SizedBox()
              //     : ListView.builder(
              //         scrollDirection: Axis.horizontal,
              //         itemCount: _contentimg!.length,
              //         itemBuilder: (BuildContext context, int index) {
              //           return Padding(
              //             padding: const EdgeInsets.all(8.0),
              //             child: ClipRRect(
              //               borderRadius: BorderRadius.circular(20.0),
              //               child: Image.file(
              //                 _contentimg![index],
              //                 fit: BoxFit.cover,
              //                 width: 120.0,
              //                 height: 120.0,
              //               ),
              //             ),
              //           );
              //         },
              //       ),
            ],
          ),
        ),
      ),
    );
  }
}
