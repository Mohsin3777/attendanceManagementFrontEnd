import 'package:attendance_system/screens/user/widgets/user_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../providers/user_document_provider.dart';

class RegisteredUsers extends StatelessWidget {
  const RegisteredUsers({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Provider.of<UserDocumentProvider>(context, listen: false).filterList();
    return Consumer<UserDocumentProvider>(
      builder: (context, value, child) {
        // value.filterList(value.usersList);
        return value.isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : GridView.builder(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 250.h,
                    childAspectRatio: 3 / 4,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 10),
                // itemCount: value.usersList!.length,
                itemCount: value.registeredList!.length,
                itemBuilder: (BuildContext ctx, index) {
                  return InkWell(
                    onLongPress: ()async{
                              await value.removeRegister(
                        
                            context: context,
                            userId: value.registeredList![index].sId.toString());

                        value.registeredList!.removeAt( index);
                    },
                    child: UserCard(
                      userModel: value.registeredList![index],
                    ),
                  );
                });
      },
    );
  }
}
