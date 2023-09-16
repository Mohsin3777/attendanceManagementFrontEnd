// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_constants.dart';

class CustomLoadingButton extends StatefulWidget {
  final String text;
  Color? textColor;

  VoidCallback? onPressed;
  final double borderRadius;
  bool? isLoading;
  final double height;
  final double width;
  bool condition;
  Color? color;
  EdgeInsetsGeometry? padding;
  CustomLoadingButton({
    Key? key,
    required this.text,
    required this.borderRadius,
    required this.height,
    required this.width,
    required this.condition,
    this.onPressed,
    this.isLoading,
    this.padding,
    this.color,
    this.textColor,
  }) : super(key: key);

  @override
  State<CustomLoadingButton> createState() => _CustomLoadingButtonState();
}

class _CustomLoadingButtonState extends State<CustomLoadingButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: (widget.condition == false) ? widget.onPressed : null,
      style: ElevatedButton.styleFrom(
          // backgroundColor: Colors.white,
          backgroundColor: widget.color ?? AppConstants.CONSTANT_COLOR,
          elevation: 0,
          minimumSize: Size(widget.width, widget.height),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius))),
      child: (widget.isLoading!)
          ? SizedBox(
              height: 21,
              width: 21,
              child: CircularProgressIndicator(
                  strokeWidth: 3, color: Theme.of(context).dividerColor))
          : Text(
              widget.text,
              style: TextStyle(
                  color: widget.textColor ?? Colors.white,
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w700),
            ),
    );
  }
}
