import 'package:attendance_system/constants/dummy.dart';
import 'package:attendance_system/model/attendance_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GlassDesign extends StatefulWidget {
  const GlassDesign({super.key});

  @override
  State<GlassDesign> createState() => _GlassDesignState();
}

class _GlassDesignState extends State<GlassDesign> {

  void showCustomDialog(BuildContext context) {
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
    Text('MARK ATTENDANCE',style: TextStyle(fontSize: 15.sp,
    decoration: TextDecoration.none,
    color: Colors.white,
    fontWeight: FontWeight.w600
    ),),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(onPressed: (){}, child: const Text('Back')),
            TextButton(onPressed: (){}, child: const Text('Done')),
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
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text("GLASS"),
      
      backgroundColor: Colors.transparent.withOpacity(0.2),
      actions: [
        IconButton(onPressed: (){
          // showDialog(context: context, builder: (context){
          //   return Container(
          //     height: 100.h,
          //     child: AlertDialog());
          // });
          showCustomDialog(context);
        }, icon: Icon(Icons.add))
      ],
      ),
      body: Container(
        height: 1.sh,
        width: 1.sw,
        decoration: const BoxDecoration(
          image: DecorationImage(image: NetworkImage('https://images.unsplash.com/photo-1572025442646-866d16c84a54?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80'),fit: BoxFit.cover)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FittedBox(
              child: DataTable(
                  dataTextStyle: TextStyle(
                    fontSize: 10.sp,
                    color: Colors.white,
                  ),
                  dataRowColor:
                      MaterialStateProperty.all(Colors.white.withOpacity(0.3)),
                  headingRowColor:
                      MaterialStateProperty.all(Colors.grey.withOpacity(0.7)),
                  decoration: BoxDecoration(
                    // color: Colors.grey.shade100,
                    border: Border.all(color: Colors.grey),
                    // borderRadius: BorderRadius.circular(20),
                  ),
                  // border: TableBorder.all(),
                  // Datatable widget that have the property columns and rows.
                    
                  columns: tableHeader(length: 6, names: [
                    'RollNo',
                    "Name",
                    "email",
                    "status",
                    "Attendance",
                    'Button'
                  ]),
                  rows: List.generate(
                  3
                      ,
                    (index) => tableBody(
                        index: index,
                        attendanceModel: AttendanceModel.fromJson(json)),
                  )),
            ),
          ],
        ),
      ),
    );
  }

  tableHeader({required int length, required List<String> names}) {
    return List.generate(
      length,
      (index) => DataColumn(
        label: Text(names[index],style: const TextStyle(color: Colors.white),),
      ),
    );
  }

  DataRow tableBody(
      {required int index, required AttendanceModel? attendanceModel}) {
    return DataRow(
      cells: [
        DataCell(
          Text(attendanceModel!.attendance![index].rollNumber ?? ''),
        ),
        DataCell(
          Text(attendanceModel.attendance![index].name ?? ''),
        ),
        DataCell(
          Text(attendanceModel.attendance![index].email ?? ''),
        ),
        DataCell(
          Text(attendanceModel.attendance![index].status ?? ''),
        ),
        DataCell(
          Text(attendanceModel.attendance![index].registered.toString()),
        ),
        DataCell(ElevatedButton(
            child: const Text('Attendance'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xff4681f4).withOpacity(0.9),
            ),
            onPressed: () async {
       

         

            })),
      ],
    );
  }
}