import 'package:attendance_system/model/user_model.dart';
import 'package:attendance_system/providers/attendance_provder.dart';
import 'package:attendance_system/providers/user_document_provider.dart';
import 'package:attendance_system/widgets/custom_loading_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'all_user_screen.dart';

class UserDetailsScreen extends StatelessWidget {
  final UserModel? userModel;
  const UserDetailsScreen({super.key, this.userModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            UserCard(userModel: userModel!),
            SizedBox(
              height: 40.h,
            ),
            Consumer<UserDocumentProvider>(
              builder: (context, val, child) {
                return CustomLoadingButton(
                    isLoading: val.isLoading,
                    onPressed: () async {
                      print(userModel!.sId.toString());
                      if (userModel!.registered == true) {
                        await val.registerUser(
                            registerStatus: false,
                            context: context,
                            userId: userModel!.sId.toString());

                        val.registeredList!.add(userModel!);
                      } else {
                        await val.registerUser(
                            registerStatus: true,
                            context: context,
                            userId: userModel!.sId.toString());

                        val.registeredList!.add(userModel!);
                      }
                    },
                    text: 'Register',
                    borderRadius: 10,
                    height: 60.h,
                    width: 1.sw,
                    condition: val.isLoading);
              },
            )
          ],
        ));
  }
}
