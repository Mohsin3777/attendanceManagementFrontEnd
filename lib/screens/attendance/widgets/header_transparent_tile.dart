import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeaderTile extends StatefulWidget {
  final String title;
  final VoidCallback? leftBtn;
  const HeaderTile({
    super.key, required this.title, this.leftBtn,
  });

  @override
  State<HeaderTile> createState() => _HeaderTileState();
}

class _HeaderTileState extends State<HeaderTile> {
    double height = 46.h;

double width = 0.6.w;

// double _borderWidth = 300;
double _padding = 10;

animateDur(){
 Future.delayed(const Duration(milliseconds:4),(){
          setState(() {
        height = 100.h;
        width =  0.8.sw;
        
        // _backgroundColor = Colors.red;
        _padding = 10;
    });
 });
}

  @override
  Widget build(BuildContext context) {
    animateDur();
    return     AnimatedContainer(
          duration: Duration(seconds: 1),
      width: width,
      height: height,
    decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.5),
        borderRadius: BorderRadius.circular(20.r)
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
widget.leftBtn ==null?Text(''):        Flexible(child: IconButton(onPressed: widget.leftBtn, icon: Icon(Icons.arrow_back,color: Colors.white,))),
        Flexible(
          child: Text(widget.title,
        
          style: TextStyle(fontSize: 25.sp,fontWeight: FontWeight.bold,color: Colors.white),
          ),
        ),
        Text('')
           
      ],
    ),
    );
  }
}
