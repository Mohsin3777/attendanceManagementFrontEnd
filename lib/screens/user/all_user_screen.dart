import 'package:attendance_system/model/user_model.dart';
import 'package:attendance_system/providers/user_document_provider.dart';
import 'package:attendance_system/screens/user/user_details_screen.dart';
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
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            title: Text('ALL USERS'),
            bottom: TabBar(
              tabs: [
                Tab(
                  text: 'All Users',
                ),
                Tab(
                  text: 'Registered Users',
                ),
              ],
            ),
          ),
          body: const TabBarView(children: [
            AllUsers(),
            RegisteredUsers(),
          ])),
    );
  }
}

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
                    maxCrossAxisExtent: 250.h,
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
                  return UserCard(
                    userModel: value.registeredList![index],
                  );
                });
      },
    );
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
      padding: EdgeInsets.all(5),
      width: 1.sw,
      height: 300.h,
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                height: 150.h,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://images.unsplash.com/photo-1694392871397-4e2b1e6ad8ce?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw0N3x8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=400&q=60'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(child: Text('Name')),
                Flexible(child: Text(userModel.name.toString())),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(child: Text('Roll No')),
                FittedBox(child: Text(userModel.rollNumber.toString())),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                    child: Text(
                  'Registered',
                  overflow: TextOverflow.fade,
                )),
                Flexible(
                    child: Text(
                  userModel.registered.toString(),
                  overflow: TextOverflow.fade,
                )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
