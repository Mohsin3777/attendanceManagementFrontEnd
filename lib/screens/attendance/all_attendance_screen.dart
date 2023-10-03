import 'package:attendance_system/providers/attendance_provder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../model/attendance_model.dart';

class AllAttendanceScreen extends StatefulWidget {
  const AllAttendanceScreen({super.key});

  @override
  State<AllAttendanceScreen> createState() => _AllAttendanceScreenState();
}

class _AllAttendanceScreenState extends State<AllAttendanceScreen> {
  @override
  void initState() {
    super.initState();
    final provider = Provider.of<AttendanceProvider>(context, listen: false);

    SchedulerBinding.instance.addPostFrameCallback((_) async {
      try {
        await provider.getAllDayAttendance(context);
      } catch (e) {
        SnackBar(content: Text(e.toString()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: Container(
             height: 1.sh,
        width: 1.sw,
        decoration: const BoxDecoration(
          image: DecorationImage(image: NetworkImage('https://images.unsplash.com/photo-1564069114553-7215e1ff1890?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1632&q=80'),fit: BoxFit.cover)
        ),
        child: Column(
          children: [
            
SizedBox(height: 30.h,),
Container(
  width: 0.8.sw,
  height: 100.h,
decoration: BoxDecoration(
    color: Colors.grey.withOpacity(0.3),
    borderRadius: BorderRadius.circular(20.r)
),
child: Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    IconButton(onPressed: (){
      Navigator.pop(context);
    }, icon: Icon(Icons.arrow_back,color: Colors.white,)),
    Flexible(
      child: Text('ALL DAYS ATTENDANCE',
    
      style: TextStyle(fontSize: 25.sp,fontWeight: FontWeight.bold,color: Colors.white),
      ),
    ),
    Text('')
       
  ],
),
),
SizedBox(height: 20.h,),

            Expanded(
              child: Consumer<AttendanceProvider>(
                      builder: (context, value, child) {
              return value.isLoading == true
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  :
                   Container(
                    // margin: EdgeInsets.symmetric(horizontal: 30.w),
                  height: 1.sh,
                  width: 0.8.sw,
                  child: ListView.builder(
                      itemCount: value.attendanceOfAllDays!.length,
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 29,
                          color: Colors.white.withOpacity(0.3),
                          child: FittedBox(
                            child: DataTable(
                              
                                dataTextStyle: TextStyle(
                                  fontSize: 14.sp,
                                  color: Colors.black87,
                                ),
                                     dataRowColor:
                                                  MaterialStateProperty.all(Colors.white.withOpacity(0.3)),
                                              headingRowColor:
                                                  MaterialStateProperty.all(Colors.grey.withOpacity(0.9)),
                                decoration: BoxDecoration(
                                  // color: Colors.grey.shade100,
                                  // border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                // border: TableBorder.all(),
                                // Datatable widget that have the property columns and rows.
                            
                                columns: tableHeader(length: 6, names: [
                                  'RollNo',
                                  "Name",
                                  "email",
                                  "status",
                                  "Attendance",
                                  'Button',
                                  
                                ]),
                                rows: List.generate(
                                  value.attendanceOfAllDays![index]
                                      .attendance!.length,
                                  (ind) => tableBody(
                                      index: ind,
                                      attendanceModel:
                                          value.attendanceOfAllDays![index]),
                                )),
                          ),
                        );
                      }));
                      },
                    ),
            ),
          ],
        )
      ),
    );
  }

  tableHeader({required int length, required List<String> names}) {
    return List.generate(
      length,
      (index) => DataColumn(
        label: Text(names[index],style: TextStyle(color: Colors.white),),
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
            child: const Text('Attendance'), onPressed: () async {})),
      ],
    );
  }
}
