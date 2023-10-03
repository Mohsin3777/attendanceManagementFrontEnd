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
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text("GLASS"),
      
      backgroundColor: Colors.transparent.withOpacity(0.2),
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