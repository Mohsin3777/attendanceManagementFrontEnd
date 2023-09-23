import 'package:attendance_system/screens/attendance/all_attendance_screen.dart';
import 'package:attendance_system/screens/auth/create_user.dart';
import 'package:attendance_system/screens/user/all_user_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'attendance_screen.dart';

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
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
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
              color: Color(0xff575757),
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
