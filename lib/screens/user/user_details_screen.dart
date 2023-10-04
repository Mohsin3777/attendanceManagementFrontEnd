import 'package:attendance_system/model/user_model.dart';
import 'package:attendance_system/providers/attendance_provder.dart';
import 'package:attendance_system/providers/user_document_provider.dart';
import 'package:attendance_system/screens/attendance/widgets/header_transparent_tile.dart';
import 'package:attendance_system/utils/text_field_decoration.dart';
import 'package:attendance_system/widgets/custom_loading_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'all_user_screen.dart';

class UserDetailsScreen extends StatefulWidget {
  final UserModel? userModel;
  final int index;
   UserDetailsScreen({super.key, this.userModel, required this.index});

  @override
  State<UserDetailsScreen> createState() => _UserDetailsScreenState();
}





class _UserDetailsScreenState extends State<UserDetailsScreen> {
 var margin = const EdgeInsets.symmetric(vertical: 5, horizontal: 15);

  TextEditingController nameController = TextEditingController();

  TextEditingController rollNoController = TextEditingController();

    TextEditingController emailController = TextEditingController();

  final _signUpFormKey = GlobalKey<FormState>();



initilizeData(){
  emailController.text =widget.userModel!.email!.trim();
  rollNoController.text =widget.userModel!.rollNumber!.trim();
  nameController.text =widget.userModel!.name!.trim();
}
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    initilizeData();
  }
  @override
  void dispose() {

    super.dispose();
    emailController.dispose();
    nameController.dispose();
    rollNoController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Container(
           height: 1.sh,
  width: 1.sw,
     decoration: const BoxDecoration(
          image: DecorationImage(image: NetworkImage('https://images.unsplash.com/photo-1564069114553-7215e1ff1890?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1632&q=80'),fit: BoxFit.cover)
        ),
          child: Column(
            children: [

                  SizedBox(height: 20.h,),
      HeaderTile(title: 'UPDATE USER',leftBtn: (){
  Navigator.pop(context);
 },),
              // Container(
              //   width: 200.w,
              //   child: UserCard(userModel: userModel!)),
              // SizedBox(
              //   height: 40.h,
              // ),

              SizedBox(height: 20.h,),
      LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if(constraints.maxWidth > 200.0) {
            return Row(
              children: [
 
     Visibility(
      visible: constraints.maxWidth >650,
      child:            Expanded(child: Container()),),
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
                                                // margin: margin,
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
                                                // margin: margin,
                                                child: TextFormField(
                                                       enabled: false,
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
                                                // margin: margin,
                                                child: TextFormField(
                                                       enabled: false,
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
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Register',
                                          style: TextStyle(color: Colors.white,fontSize: 17.sp,
                                          
                                          ),
                                          ),
                                          CupertinoSwitch(
                                            onChanged: (val){
                                              setState(() {
                                                widget.userModel!.registered=val;
                                                print(    widget.userModel!.registered);
                                              });
                                            },
                                            value: widget.userModel!.registered!,
                                            activeColor: Colors.white,
                                            thumbColor: Colors.teal,
                                            trackColor: Colors.grey,


    ),
                                        ],
                                      ),
                                             Consumer<UserDocumentProvider>(
                builder: (context, val, child) {
                  return CustomLoadingButton(
                      isLoading: val.isLoading,
                      onPressed: () async {
                        print(widget.userModel!.sId.toString());
        
                          // await val.registerUser(
                          //     registerStatus: false,
                          //     context: context,
                          //     userId: userModel!.sId.toString());
        
                          // val.registeredList!.add(userModel!);
                   widget.userModel!.name =nameController.text.trim();
                          await val.registerUser(
                  userModel:widget.userModel,
                              context: context,
                              userId: widget.userModel!.sId.toString());
        
                          // widget.userModel!.registered = true;
        val.updateListAfterChangeStatus(index: widget.index,registeredValue: widget.userModel!.registered);
                          // val.registeredList![widget.index].registered=widget.userModel!.registered;
                   
                      },
                      text: "UPDATE",
                      borderRadius: 10,
                      height: 60.h,
                      width: 1.sw,
                      condition: val.isLoading);
                },
              )
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
              // Consumer<UserDocumentProvider>(
              //   builder: (context, val, child) {
              //     return CustomLoadingButton(
              //         isLoading: val.isLoading,
              //         onPressed: () async {
              //           print(userModel!.sId.toString());
              //           if (userModel!.registered == true) {
              //             // await val.registerUser(
              //             //     registerStatus: false,
              //             //     context: context,
              //             //     userId: userModel!.sId.toString());
        
              //             // val.registeredList!.add(userModel!);
              //           } else {
              //             await val.registerUser(
              //                 registerStatus: true,
              //                 context: context,
              //                 userId: userModel!.sId.toString());
        
              //             userModel!.registered = true;
        
              //             val.registeredList!.add(userModel!);
              //           }
              //         },
              //         text: 'Register',
              //         borderRadius: 10,
              //         height: 60.h,
              //         width: 1.sw,
              //         condition: val.isLoading);
              //   },
              // )
            ],
          ),
        ));
  }
}
