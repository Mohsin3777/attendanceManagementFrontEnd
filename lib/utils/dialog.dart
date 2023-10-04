import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDialogsCls{
  static  void showCustomDialog({required BuildContext context ,String? titleText,String? mainButtonText,String? secondButtonText,VoidCallback? mainButton ,VoidCallback? secondButton}) {
  showGeneralDialog(
    context: context,
    barrierLabel: "Barrier",
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: Duration(milliseconds: 700),
    pageBuilder: (_, __, ___) {
      return Center(
        child: Container(
          height: 200.h,
          width: 100.w,
          padding: EdgeInsets.all(20.sp),
          margin:const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(color: Colors.white.withOpacity(0.5), borderRadius: BorderRadius.circular(40)),
 child: Column(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,

  children: [
    SizedBox(height: 30.h,),
    Text(titleText!,style: TextStyle(fontSize: 15.sp,
    decoration: TextDecoration.none,
    color: Colors.white,
    fontWeight: FontWeight.w600
    ),),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
if(secondButton !=null)
        TextButton(onPressed: secondButton, child:  Text(secondButtonText!)),
            TextButton(onPressed: mainButton, child:  Text(mainButtonText!)),
      ],
    )
  ],
 ),
        ),
      );
    },
    transitionBuilder: (_, anim, __, child) {
      Tween<Offset> tween;
      if (anim.status == AnimationStatus.reverse) {
        tween = Tween(begin: Offset(-1, 0), end: Offset.zero);
      } else {
        tween = Tween(begin: Offset(0, 1), end: Offset.zero);
      }
  
      return SlideTransition(
        position: tween.animate(anim),
        child: FadeTransition(
          opacity: anim,
          child: child,
        ),
      );
    },
  );
}
}