import 'package:attendance_system/model/user_model.dart';
import 'package:attendance_system/screens/attendance/attendance_screen.dart';
import 'package:attendance_system/screens/attendance/widgets/header_transparent_tile.dart';
import 'package:attendance_system/screens/user/all_user_screen.dart';
import 'package:attendance_system/services/http_services/auth_services.dart';
import 'package:attendance_system/utils/text_field_decoration.dart';
import 'package:attendance_system/widgets/custom_loading_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateUserScreen extends StatefulWidget {
  const CreateUserScreen({super.key});

  @override
  State<CreateUserScreen> createState() => _CreateUserScreenState();
}

class _CreateUserScreenState extends State<CreateUserScreen> {
  var margin = const EdgeInsets.symmetric(vertical: 5, horizontal: 15);
  TextEditingController nameController = TextEditingController();
  TextEditingController rollNoController = TextEditingController();
    TextEditingController emailController = TextEditingController();
  final _signUpFormKey = GlobalKey<FormState>();

  bool isLoading = false;
  bool isLogin = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    nameController.dispose();
    rollNoController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
body: Container(
  height: 1.sh,
  width: 1.sw,
     decoration: const BoxDecoration(
          image: DecorationImage(image: NetworkImage('https://images.unsplash.com/photo-1564069114553-7215e1ff1890?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1632&q=80'),fit: BoxFit.cover)
        ),
  child:  Column(
    children: [
      SizedBox(height: 20.h,),
      HeaderTile(title: 'ADD USER',leftBtn: (){
  Navigator.pop(context);
 },),
SizedBox(height: 20.h,),
      LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if(constraints.maxWidth > 200.0) {
            return Row(
              children: [
                Expanded(child: Container()),
                       Expanded(
                        flex: 2,
                         child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.r),
                              color: Colors.white.withOpacity(0.5),
                          ),
                          margin: EdgeInsets.symmetric(horizontal:40.w,vertical: 20.h),
                        
                          padding: EdgeInsets.all(30.sp),
                          child: Form(
                            key: _signUpFormKey,
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  // CircleAvatar(
                                  //   // minRadius: 40.r,
                                  // radius: 50.r,
                                  // // maxRadius: 40.r,
                            
                                  // ),
                                 Container(
                                                margin: margin,
                                                child: TextFormField(
                                                  controller: nameController,
                                                  decoration: TextFeildDecorationClass.inputDecoration(context,
                                                      hintText: 'Name',
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
                                              SizedBox(height: 20.h,),
                                                   Container(
                                                margin: margin,
                                                child: TextFormField(
                                                  keyboardType: TextInputType.number,
                                                  controller: emailController,
                                                  decoration: TextFeildDecorationClass.inputDecoration(context,
                                                      hintText: 'Email',
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
                                              SizedBox(height: 20.h,),
                                                   Container(
                                                margin: margin,
                                                child: TextFormField(
                                                  keyboardType: TextInputType.number,
                                                  controller: rollNoController,
                                                  decoration: TextFeildDecorationClass.inputDecoration(context,
                                                      hintText: 'Enter RollNo',
                                                      prefixIcon: Icon(
                              Icons.numbers,
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
                            
                                                    SizedBox(
                                                height: 30.h,
                                              ),
                                              Container(
                                                alignment: Alignment.center,
                                                margin: margin,
                                                child: CustomLoadingButton(
                                                  text: "Sign Up",
                                                  height: 60.h,
                                                  width: 1.sw,
                                                  borderRadius: 25.r,
                                                  onPressed: () async {
                                                    if (_signUpFormKey.currentState!.validate()) {
                                                      _signUpFormKey.currentState!.save();
                                                      setState(() {
                              isLoading = true;
                              isLogin = true;
                                                      });
                            
                                                      try {
                              UserModel userModel = UserModel(
                                  email: emailController.text.trim(),
                                  name: nameController.text.trim(),
                                  registered: false,
                                  rollNumber: rollNoController.text.trim());
                              AuthServices authServices = AuthServices();
                            
                              await authServices.registerUser(
                                  context: context, userModel: userModel);
                            
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AllUsersScreen()));
                                                      } catch (e) {
                              setState(() {
                                isLoading = false;
                                isLogin = false;
                              });
                              SnackBar(content: Text(e.toString()));
                                                      }
                                                    }
                                                  },
                                                  condition: false,
                                                  isLoading: false,
                                                ),
                                              ),
                                ],
                              ),
                            ),
                          ),
                         ))
              ],
            );
          } else {
            return new Text('SMALL');
          }
        }
      ),
    ],
  ),
),














      // body: Form(
      //   key: _signUpFormKey,
      //   child: Center(
      //     child: Column(
      //       children: [
      //         Container(
      //           margin: margin,
      //           child: TextFormField(
      //             controller: nameController,
      //             decoration: TextFeildDecorationClass.inputDecoration(context,
      //                 hintText: 'Full Name',
      //                 prefixIcon: Icon(
      //                   Icons.person_outline,
      //                   size: 25.sp,
      //                 )),
      //             validator: (v) {
      //               if (v == null || v.isEmpty) {
      //                 return 'Field is required.';
      //               }
      //               return null;
      //             },
      //           ),
      //         ),
      //         SizedBox(
      //           height: 20.h,
      //         ),
      //         Container(
      //           margin: margin,
      //           child: TextFormField(
      //             keyboardType: TextInputType.number,
      //             controller: rollNoController,
      //             decoration: TextFeildDecorationClass.inputDecoration(context,
      //                 hintText: 'Enter RollNo',
      //                 prefixIcon: Icon(
      //                   Icons.person_outline,
      //                   size: 25.sp,
      //                 )),
      //             validator: (v) {
      //               if (v == null || v.isEmpty) {
      //                 return 'Field is required.';
      //               }
      //               return null;
      //             },
      //           ),
      //         ),
      //         SizedBox(
      //           height: 30.h,
      //         ),
      //         Container(
      //           alignment: Alignment.center,
      //           margin: margin,
      //           child: CustomLoadingButton(
      //             text: "Sign Up",
      //             height: 60.h,
      //             width: 1.sw,
      //             borderRadius: 25.r,
      //             onPressed: () async {
      //               if (_signUpFormKey.currentState!.validate()) {
      //                 _signUpFormKey.currentState!.save();
      //                 setState(() {
      //                   isLoading = true;
      //                   isLogin = true;
      //                 });

      //                 try {
      //                   UserModel userModel = UserModel(
      //                       email: 'mm',
      //                       name: nameController.text.trim(),
      //                       registered: false,
      //                       rollNumber: rollNoController.text.trim());
      //                   AuthServices authServices = AuthServices();

      //                   await authServices.registerUser(
      //                       context: context, userModel: userModel);

      //                   Navigator.push(
      //                       context,
      //                       MaterialPageRoute(
      //                           builder: (context) => AllUsersScreen()));
      //                 } catch (e) {
      //                   setState(() {
      //                     isLoading = false;
      //                     isLogin = false;
      //                   });
      //                   SnackBar(content: Text(e.toString()));
      //                 }
      //               }
      //             },
      //             condition: false,
      //             isLoading: false,
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
