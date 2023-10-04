import 'package:attendance_system/model/user_model.dart';
import 'package:attendance_system/providers/user_document_provider.dart';
import 'package:attendance_system/screens/user/user_details_screen.dart';
import 'package:attendance_system/screens/user/widgets/all_users_widget.dart';
import 'package:attendance_system/screens/user/widgets/registeredUsers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../attendance/widgets/header_transparent_tile.dart';

class AllUsersScreen extends StatefulWidget {
  const AllUsersScreen({super.key});

  @override
  State<AllUsersScreen> createState() => _AllUsersScreenState();
}
 TabController? _tabController;
class _AllUsersScreenState extends State<AllUsersScreen> with TickerProviderStateMixin{
  
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
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
       
        body: Container(
   decoration: const BoxDecoration(
        image: DecorationImage(image: NetworkImage('https://images.unsplash.com/photo-1500673922987-e212871fec22?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80'),fit: BoxFit.cover)
      ),
          height: 1.sh,
          child: Column(
            children: [
              SizedBox(height: 30.h,),
HeaderTile(title: 'ALL USERS',
leftBtn: (){
  Navigator.pop(context);
 },
),
SizedBox(height: 20.h,),
Container(
    width: 0.8.sw,
  //  padding: EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: Colors.grey.withOpacity(0.9),
      borderRadius: BorderRadius.circular(20.r)
    ),
  child:   TabBar(
        controller: _tabController,
    indicatorColor: Colors.grey,
    labelStyle: TextStyle(fontSize: 22.sp,color: Colors.green),
    unselectedLabelColor: Colors.black,
    tabs:const [
    Text('ALL USERS'),
    Text('REGISTERED'),
  ]),
),
              Expanded(
                child:  TabBarView(
                  controller: _tabController,
                  
                  children: const[
                  AllUsers(),
                  RegisteredUsers()
                ]),
              ),
            ],
          ),
        ));
  }
}

