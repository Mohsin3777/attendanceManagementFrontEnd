import 'package:attendance_system/model/user_model.dart';
import 'package:attendance_system/screens/basicPage.dart';
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
  final _signUpFormKey = GlobalKey<FormState>();

  bool isLoading = false;
  bool isLogin = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create User'),
      ),
      body: Form(
        key: _signUpFormKey,
        child: Center(
          child: Column(
            children: [
              Container(
                margin: margin,
                child: TextFormField(
                  controller: nameController,
                  decoration: TextFeildDecorationClass.inputDecoration(context,
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
              SizedBox(
                height: 20.h,
              ),
              Container(
                margin: margin,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: rollNoController,
                  decoration: TextFeildDecorationClass.inputDecoration(context,
                      hintText: 'Enter RollNo',
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
                            email: 'mm',
                            name: nameController.text.trim(),
                            registered: false,
                            rollNumber: rollNoController.text.trim());
                        AuthServices authServices = AuthServices();

                        await authServices.registerUser(
                            context: context, userModel: userModel);

                        Navigator.push(
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
    );
  }
}
