import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/Widgets/main_botton.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final picker = ImagePicker();
  XFile? photo;
  Future<void> pickImageFromComera() async {
    photo = await picker.pickImage(source: ImageSource.camera);
    if (mounted) setState(() {});
  }

  Future<void> pickImageFromGallery() async {
    photo = await picker.pickImage(source: ImageSource.gallery);
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        spacing: 20.h,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => Padding(
                  padding: EdgeInsets.all(16.0.r),
                  child: Column(
                    children: [
                      MainBotton(
                        title: "Camera",
                        onTap: () {
                          pickImageFromComera();
                          Navigator.pop(context);
                        },
                      ),
                      20.verticalSpace,
                      MainBotton(
                        title: "Gallery",
                        onTap: () {
                          pickImageFromGallery();
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
            child: CircleAvatar(
              radius: 60,
              backgroundColor: Colors.grey.shade200,
              child: photo == null ? Icon(Icons.person, size: 60.r) : null,
              backgroundImage: photo != null
                  ? Image.file(File(photo?.path ?? "")).image
                  : null,
            ),
          ),
          Text(
            'Create Yuor Profile',
            style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
          ),
          Text(
            'Add your name end profile picture',
            style: TextStyle(fontSize: 18.sp, color: Colors.grey),
          ),

          TextFormField(
            decoration: InputDecoration(
              fillColor: Colors.grey.shade300,
              filled: true,
              hintText: "full Name",
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(50.r),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(20.r),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(50.r),
              ),
            ),
          ),

          MainBotton(
            title: "Continue",
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const Homescreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('Home Screen')));
  }
}
