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
      appBar: AppBar(),
      body: Consumer<AttendanceProvider>(
        builder: (context, value, child) {
          return value.isLoading == true
              ? Center(
                  child: CircularProgressIndicator(),
                )
              :
 SizedBox(
              height: 1.sh,
              width: 1.sw,
              child: ListView.builder(
                  itemCount: value.attendanceOfAllDays!.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Column(
                        children: [
                          Text('Date${value.attendanceOfAllDays![index].date}'),
                          SizedBox(
                            height: 10.h,
                          ),
                          FittedBox(
                            child: DataTable(
                                dataTextStyle: TextStyle(
                                  fontSize: 10.sp,
                                  color: Colors.red,
                                ),
                                dataRowColor:
                                    MaterialStateProperty.all(Colors.white),
                                headingRowColor:
                                    MaterialStateProperty.all(Colors.blue),
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade100,
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                border: TableBorder.all(),
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
                                  value.attendanceOfAllDays![index]
                                      .attendance!.length,
                                  (ind) => tableBody(
                                      index: ind,
                                      attendanceModel:
                                          value.attendanceOfAllDays![index]),
                                )),
                          )
                        ],
                      ),
                    );
                  }));
        },
      ),
    );
  }

  tableHeader({required int length, required List<String> names}) {
    return List.generate(
      length,
      (index) => DataColumn(
        label: Text(names[index]),
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
