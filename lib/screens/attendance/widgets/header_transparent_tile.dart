import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeaderTile extends StatelessWidget {
  final String title;
  final VoidCallback? leftBtn;
  const HeaderTile({
    super.key, required this.title, this.leftBtn,
  });

  @override
  Widget build(BuildContext context) {
    return     Container(
      width: 0.8.sw,
      height: 100.h,
    decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.5),
        borderRadius: BorderRadius.circular(20.r)
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
leftBtn ==null?Text(''):        IconButton(onPressed: leftBtn, icon: Icon(Icons.arrow_back,color: Colors.white,)),
        Flexible(
          child: Text(title,
        
          style: TextStyle(fontSize: 25.sp,fontWeight: FontWeight.bold,color: Colors.white),
          ),
        ),
        Text('')
           
      ],
    ),
    );
  }
}
