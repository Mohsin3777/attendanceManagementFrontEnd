import 'package:attendance_system/model/user_model.dart';
import 'package:attendance_system/providers/user_document_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class AllUsersScreen extends StatefulWidget {
  const AllUsersScreen({super.key});

  @override
  State<AllUsersScreen> createState() => _AllUsersScreenState();
}

class _AllUsersScreenState extends State<AllUsersScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final provider = Provider.of<UserDocumentProvider>(context, listen: false);
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      try {
        provider.getAllStudents(context: context);
      } catch (e) {
        SnackBar(content: Text(e.toString()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('ALL USERS'),
        ),
        body: Consumer<UserDocumentProvider>(
          builder: (context, value, child) {
            return value.isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            childAspectRatio: 3 / 4,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20),
                    itemCount: value.usersList!.length,
                    itemBuilder: (BuildContext ctx, index) {
                      return UserCard(
                        userModel: value.usersList![index],
                      );
                    });
          },
        ));
  }
}

class UserCard extends StatelessWidget {
  final UserModel userModel;
  const UserCard({
    super.key,
    required this.userModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      width: 150.w,
      height: 300.h,
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 150.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://images.unsplash.com/photo-1694392871397-4e2b1e6ad8ce?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw0N3x8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=400&q=60'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(userModel.name.toString()),
            SizedBox(
              height: 10.h,
            ),
            Text(userModel.rollNumber.toString()),
          ],
        ),
      ),
    );
  }
}
