import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/text_field_decoration.dart';
import '../../../widgets/custom_loading_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var margin = const EdgeInsets.symmetric(vertical: 5, horizontal: 15);
  final _signUpFormKey = GlobalKey<FormState>();
  bool isLoading = false;
  bool isLogin = false;
  String dropdownvalue = "RegisteredAudience";

  // List of items in our dropdown menu
  var items = [
    "Speaker",
    "RegisteredAudience",
    "CommitteeMembers",
  ];
  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController conformPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          centerTitle: true,
          leading: BackButton(
            color: Colors.black,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text('SIGNUP')),
      body: Container(
        height: 1.sh,
        width: 1.sw,
        child: SingleChildScrollView(
          child: Form(
            key: _signUpFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const ImageCircle(),
                SizedBox(height: 15.h),
                //name field
                Container(
                  margin: margin,
                  child: TextFormField(
                    controller: nameController,
                    decoration:
                        TextFeildDecorationClass.inputDecoration(context,
                            hintText: 'Full Name',
                            prefixIcon: Icon(
                              Icons.person_outline,
                              size: 25.sp,
                            )),
                    validator: (v) {
                      if (v == null || v.isEmpty) {
                        return 'Field is required.';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 15.h),
                //email field
                Container(
                  margin: margin,
                  child: TextFormField(
                    controller: emailController,
                    decoration:
                        TextFeildDecorationClass.inputDecoration(context,
                            hintText: 'abc@gmail.com',
                            prefixIcon: Icon(
                              Icons.email,
                              size: 25.sp,
                            )),
                    validator: (v) {
                      if (v == null || v.isEmpty) {
                        return 'Field is required.';
                      }
                      return null;
                    },
                  ),
                ),

                SizedBox(height: 15.h),
                //password field
                Container(
                  margin: margin,
                  child: TextFormField(
                    controller: phoneController,
                    keyboardType: TextInputType.number,
                    decoration:
                        TextFeildDecorationClass.inputDecoration(context,
                            hintText: 'Phone',
                            prefixIcon: Icon(
                              Icons.phone,
                              size: 25.sp,
                            )),
                    validator: (v) {
                      if (v == null || v.isEmpty) {
                        return 'Field is required.';
                      }
                      return null;
                    },
                  ),
                ),

                SizedBox(height: 15.h),
                //email field
                Container(
                  margin: margin,
                  child: TextFormField(
                    controller: passwordController,
                    decoration:
                        TextFeildDecorationClass.inputDecoration(context,
                            hintText: 'Password',
                            prefixIcon: Icon(
                              Icons.lock_outline,
                              size: 25.sp,
                            )),
                    validator: (v) {
                      if (v == null || v.isEmpty) {
                        return 'Password is required.';
                      }
                      return null;
                    },
                  ),
                ),

                SizedBox(height: 15.h),
                //conform password field
                Container(
                  margin: margin,
                  child: TextFormField(
                    controller: conformPasswordController,
                    decoration:
                        TextFeildDecorationClass.inputDecoration(context,
                            hintText: ' Conform Password',
                            prefixIcon: Icon(
                              Icons.lock,
                              size: 25.sp,
                            )),
                    validator: (v) {
                      if (v == null || v.isEmpty) {
                        return 'Conform Password is required.';
                      }
                      return null;
                    },
                  ),
                ),

                SizedBox(height: 15.h),

                SizedBox(height: 30.h),
                Container(
                  alignment: Alignment.center,
                  margin: margin,
                  child: CustomLoadingButton(
                    text: "Sign Up",
                    height: 60.h,
                    width: 1.sw,
                    borderRadius: 25.r,
                    onPressed: () {
                      if (_signUpFormKey.currentState!.validate()) {
                        _signUpFormKey.currentState!.save();
                        setState(() {
                          isLoading = true;
                          isLogin = true;
                        });

                        try {
                          // UserModel? userModel = UserModel(
                          //     email: emailController.text.trim(),
                          //     name: nameController.text.trim(),
                          //     password: passwordController.text.trim(),
                          //     profilePic: '');
                          // // AuthServices _authServices = AuthServices();

                          // _authServices.registration(
                          //     context: context, userModel: userModel);
                        } catch (e) {
                          setState(() {
                            isLoading = false;
                            isLogin = false;
                          });
                          SnackBar(content: Text(e.toString()));
                        }
                      }
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => MainScreen()));
                    },
                    condition: false,
                    isLoading: false,
                  ),
                ),
                SizedBox(height: 15.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ImageCircle extends StatelessWidget {
  const ImageCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 135.h,
      width: 130.w,
      child: Stack(
        clipBehavior: Clip.none,
        fit: StackFit.expand,
        children: [
          const CircleAvatar(
            backgroundImage: NetworkImage(
                "https://images.unsplash.com/photo-1664440163807-f2c860329464?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw0N3x8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=400&q=60"),
          ),
          Positioned(
              bottom: 0,
              right: 0,
              child: RawMaterialButton(
                onPressed: () {
                  print('PickImage');
                },
                // elevation: 2.0,
                fillColor: const Color(0xFF484848),
                constraints: BoxConstraints(
                    minHeight: 25.h,
                    maxWidth: 50.w,
                    maxHeight: 40.h,
                    minWidth: 50.w),
                padding: const EdgeInsets.all(1.0),
                shape: const CircleBorder(),
                child: Icon(
                  Icons.camera_alt_outlined,
                  color: Colors.white,
                  size: 12.sp,
                ),
              )),
        ],
      ),
    );
  }
}
