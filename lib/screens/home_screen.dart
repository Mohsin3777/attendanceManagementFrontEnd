

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
    Duration _animationDuration = Duration(milliseconds: 1000);
  Color _backgroundColor = Colors.blueGrey;
double _height = 150;
double _width = 150;
// double _borderWidth = 300;
// double _borderRadius = 10;
double _padding = 10;

animate(Widget  widget){
  return AnimatedContainer(
  duration: _animationDuration,
  height: _height,
  width: _width,
  padding: EdgeInsets.all(_padding),
  decoration: BoxDecoration(


  ),
  child: widget,
);
}
  @override
  void initState() {
    super.initState();
// animateDur();
  }
animateDur(){
 Future.delayed(Duration(seconds: 3),(){
          setState(() {
        _height = 200;
        _width = 200;
        
        // _backgroundColor = Colors.red;
        _padding = 10;
    });
 });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      backgroundColor: Color(0xff242627),

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

class CustomHomeIconButtonWithText extends StatefulWidget {
  final String text;
  final IconData icon;
  final VoidCallback onpress;
  const CustomHomeIconButtonWithText(
      {super.key,
      required this.text,
      required this.icon,
      required this.onpress});

  @override
  State<CustomHomeIconButtonWithText> createState() => _CustomHomeIconButtonWithTextState();
}

class _CustomHomeIconButtonWithTextState extends State<CustomHomeIconButtonWithText> {
  double height = 80.h;
double width = 80.w;
// double _borderWidth = 300;
// double _borderRadius = 10;
double _padding = 10;

animateDur(){
 Future.delayed(Duration(milliseconds:1),(){
          setState(() {
        height = 100.h;
        width = 100.w;
        
        // _backgroundColor = Colors.red;
        _padding = 10;
    });
 });
}

  @override
  Widget build(BuildContext context) {
    animateDur();
    return InkWell(
      onTap: widget.onpress,
      child: AnimatedContainer(
              width: width,
          height: height,
          decoration: BoxDecoration(
              color: Color(0xff575757).withOpacity(0.8),
              borderRadius: BorderRadius.circular(20.r)),
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          duration: Duration(seconds: 1),
          child: FittedBox(
            child: Column(
              children: [
                Icon(widget.icon, size: 60.sp, color: Color(0xffdadada)),
                Text(
                  widget.text,
                  style: TextStyle(fontSize: 20.sp, color: Color(0xffdadada)),
                )
              ],
            ),
          )),
    );
  }
}
