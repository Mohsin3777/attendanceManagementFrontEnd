import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFeildDecorationClass {
  static InputDecoration inputDecoration(BuildContext context,
      {required String hintText,
      String? labelText,
      Widget? suffixIcon,
      Icon? prefixIcon,
      double? padding}) {
    return InputDecoration(
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w200,
        ),
        labelStyle: TextStyle(
            color: const Color(0xff7C7C7C),
            fontSize: 16.sp,
            fontWeight: FontWeight.w800),
        // label: Text(
        //   labelText ?? '',
        // ),
        filled: true,
        isDense: true,
        contentPadding:
            EdgeInsets.symmetric(horizontal: 20, vertical: padding ?? 20),

        // filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(11)),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ));
  }

//both decoration are same only differance is vitals use iamge on suffix
  static InputDecoration vitalsFieldDeoration(BuildContext context,
      {required String hintText,
      String? labelText,
      Widget? suffixIcon,
      Icon? prefixIcon,
      String? sufixImage}) {
    return InputDecoration(
        suffixIcon: suffixIcon,
        prefixIcon: Image(
          image: AssetImage(sufixImage!),

          // height: 10,
        ),
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w200,
        ),
        labelStyle: TextStyle(
            color: const Color(0xff7C7C7C),
            fontSize: 16.sp,
            fontWeight: FontWeight.w800),
        // label: Text(
        //   labelText ?? '',
        // ),
        isDense: true,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        fillColor: Colors.transparent,
        // filled: true,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(11)),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ));
  }

  InputDecoration inputCustomDecoration(BuildContext context,
      {required String hintText,
      required String labelText,
      Widget? suffixIcon,
      Icon? prefixIcon}) {
    return InputDecoration(
      filled: true,
      isDense: true,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 10,
      ),
      fillColor: const Color(0xffF4F5F7),
      hintStyle: TextStyle(color: Colors.black, fontSize: 16.sp),
      suffixIcon: suffixIcon,
      labelStyle: TextStyle(color: Colors.black, fontSize: 16.sp),
      label: Text(
        labelText,
      ),
      hintText: hintText,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
        borderSide: BorderSide.none,
      ),
    );
  }
}
