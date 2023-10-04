import 'package:attendance_system/providers/user_document_provider.dart';
import 'package:attendance_system/screens/user/widgets/user_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../user_details_screen.dart';

class AllUsers extends StatelessWidget {
  const AllUsers({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<UserDocumentProvider>(
      builder: (context, value, child) {
        return value.isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : GridView.builder(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200.h,
                    childAspectRatio: 3 / 4,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 10),
                itemCount: value.usersList!.length,
                itemBuilder: (BuildContext ctx, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UserDetailsScreen(
                                    userModel: value.usersList![index],
                                    index: index,
                                  )));
                    },
                    child: UserCard(
                      userModel: value.usersList![index],
                    ),
                  );
                });
      },
    );
  }
}


