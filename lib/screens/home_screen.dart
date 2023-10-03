import 'package:attendance_system/screens/attendance/all_attendance_screen.dart';
import 'package:attendance_system/screens/attendance/widgets/header_transparent_tile.dart';
import 'package:attendance_system/screens/auth/create_user.dart';
import 'package:attendance_system/screens/user/all_user_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'attendance/attendance_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff242627),
      appBar: AppBar(
        backgroundColor: Color(0xff242627),
      ),
      body: Container(
      
                 height: 1.sh,
      width: 1.sw,
      decoration: const BoxDecoration(
        image: DecorationImage(image: NetworkImage('https://images.unsplash.com/photo-1505664194779-8beaceb93744?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80'),fit: BoxFit.cover)
      ),
        // margin: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
                     SizedBox(height: 30.h,),
         const     HeaderTile(title: "HOME",),
                         SizedBox(height: 30.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomHomeIconButtonWithText(
                    icon: Icons.home,
                    text: 'HOME',
                    onpress: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AllUsersScreen()));
                    },
                  ),
                  CustomHomeIconButtonWithText(
                    icon: Icons.car_crash_outlined,
                    text: 'Add User',
                    onpress: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CreateUserScreen()));
                    },
                  )
                ],
              ),
              SizedBox(
                height: 10.h,
              ),

              //second Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomHomeIconButtonWithText(
                    icon: Icons.all_inbox,
                    text: 'Today Attendance',
                    onpress: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AttendanceScreen()));
                    },
                  ),
                  CustomHomeIconButtonWithText(
                    icon: Icons.person,
                    text: 'Add User',
                    onpress: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CreateUserScreen()));
                    },
                  )
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              //third row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomHomeIconButtonWithText(
                    icon: Icons.all_inbox,
                    text: 'All Attendance',
                    onpress: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const AllAttendanceScreen()));
                    },
                  ),
                  CustomHomeIconButtonWithText(
                    icon: Icons.person,
                    text: '',
                    onpress: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => const CreateUserScreen()));
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomHomeIconButtonWithText extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onpress;
  const CustomHomeIconButtonWithText(
      {super.key,
      required this.text,
      required this.icon,
      required this.onpress});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpress,
      child: Container(
              width: 100.w,
          height: 100.h,
          decoration: BoxDecoration(
              color: Color(0xff575757).withOpacity(0.8),
              borderRadius: BorderRadius.circular(20.r)),
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: FittedBox(
            child: Column(
              children: [
                Icon(icon, size: 60.sp, color: Color(0xffdadada)),
                Text(
                  text,
                  style: TextStyle(fontSize: 20.sp, color: Color(0xffdadada)),
                )
              ],
            ),
          )),
    );
  }
}
