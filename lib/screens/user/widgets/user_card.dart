import 'package:attendance_system/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserCard extends StatelessWidget {
  final UserModel userModel;
  const UserCard({
    super.key,
    required this.userModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.all(5),
      width: 40.w,
      height: 300.h,
decoration: BoxDecoration(
  color: Colors.grey.withOpacity(0.8),
  border: Border.all()
),
child: Column(
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
    if(userModel.registered ==true)
    Container(width: 1.sw,
    alignment: Alignment.center,
      padding: EdgeInsets.all(10),
      color: Color.fromARGB(255, 0, 231, 8),
      child: Text('Registered',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400)),
    ),
    if(userModel.registered ==false)
        Container(width: 1.sw,
    alignment: Alignment.center,
      padding: EdgeInsets.all(10),
      child: Text(''),
   
    ),
            SizedBox(height: 10.h,),
    CircleAvatar(
      radius: 40.r,
      backgroundImage: NetworkImage('https://images.unsplash.com/photo-1694392871397-4e2b1e6ad8ce?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw0N3x8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=400&q=60'),
    ),
    SizedBox(height: 30.h,),
    Flexible(child: Text(userModel.name.toString(),style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400),)),
        SizedBox(height: 10.h,),
   Flexible(child: Text(userModel.rollNumber.toString(),style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400),)),
        SizedBox(height: 10.h,),
        SizedBox(height: 10.h,),
  Flexible(child: Text(userModel.email.toString(),style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400),)),
        SizedBox(height: 10.h,),
  ],
),

      // child: Card(
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     mainAxisAlignment: MainAxisAlignment.start,
      //     children: [
      //       Expanded(
      //         child: Container(
      //           height: 150.h,
      //           decoration: BoxDecoration(
      //             image: DecorationImage(
      //               image: NetworkImage(
      //                   'https://images.unsplash.com/photo-1694392871397-4e2b1e6ad8ce?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw0N3x8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=400&q=60'),
      //               fit: BoxFit.cover,
      //             ),
      //           ),
      //         ),
      //       ),
      //       Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: [
      //           Flexible(child: Text('Name')),
      //           Flexible(child: Text(userModel.name.toString())),
      //         ],
      //       ),
      //       SizedBox(
      //         height: 10.h,
      //       ),
      //       Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: [
      //           Flexible(child: Text('Roll No')),
      //           FittedBox(child: Text(userModel.rollNumber.toString())),
      //         ],
      //       ),
      //       SizedBox(
      //         height: 10.h,
      //       ),
      //       Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: [
      //           Flexible(
      //               child: Text(
      //             'Registered',
      //             overflow: TextOverflow.fade,
      //           )),
      //           Flexible(
      //               child: Text(
      //             userModel.registered.toString(),
      //             overflow: TextOverflow.fade,
      //           )),
      //         ],
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
