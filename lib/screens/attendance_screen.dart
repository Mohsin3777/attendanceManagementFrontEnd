import 'package:attendance_system/providers/attendance_provder.dart';
import 'package:attendance_system/screens/home_screen.dart';
import 'package:attendance_system/services/http_services/attendance_service/attendance_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../model/attendance_model.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({super.key});

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<AttendanceProvider>(
        builder: (context, value, child) {
          // print(value.attendanceModel.toString() + 'AAAAAAAAAdtrafa');
          return value.isLoading == true
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Container(
                  width: 1000,
                  color: Colors.black12,
                  child: Column(
                    children: [
                      if (value.attendanceModel!.data!.attendance != null)
                        Text(value.attendanceModel!.data!.sId.toString()),
                      // Expanded(
                      //     child: ListView.builder(
                      //         itemCount: value.attendanceModel != null
                      //             ? value
                      //                 .attendanceModel!.data!.attendance?.length
                      //             : 0,
                      //         // itemCount: 0,
                      //         itemBuilder: (context, index) {
                      //           return Card(
                      //             child: Column(
                      //               children: [
                      //                 Text("Name  "
                      //                     "${value.attendanceModel!.data!.attendance![index].studentId!.name}"
                      //                     ''),
                      //                 Text("RollNumber  "
                      //                     "${value.attendanceModel!.data!.attendance![index].studentId!.rollNumber}"
                      //                     ''),
                      //               ],
                      //             ),
                      //           );
                      //         }),

                      //         )

                      Expanded(
                        child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
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
                                  value.attendanceModel!.data!.attendance!
                                      .length,
                                  (index) => tableBody(
                                      index: index,
                                      attendanceModel: value.attendanceModel!),
                                ))),
                      )
                    ],
                  ),
                );
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
          Text(attendanceModel!.data!.attendance![index].rollNumber ?? ''),
        ),
        DataCell(
          Text(attendanceModel.data!.attendance![index].name ?? ''),
        ),
        DataCell(
          Text(attendanceModel.data!.attendance![index].email ?? ''),
        ),
        DataCell(
          Text(attendanceModel.data!.attendance![index].status ?? ''),
        ),
        DataCell(
          Text(attendanceModel.data!.attendance![index].registered.toString()),
        ),
        DataCell(ElevatedButton(
            child: const Text('Attendance'),
            onPressed: () async {
              AttendanceService attendanceService = AttendanceService();
              String status = 'present';
              if (attendanceModel.data!.attendance![index].status ==
                  'present') {
                status = 'absent';
              } else {
                status = 'present';
              }

              print(status);
              final provider =
                  Provider.of<AttendanceProvider>(context, listen: false);
              provider.markAttendance(
                index: index,
                context: context,
                attendanceId: attendanceModel.data!.sId.toString(),
                studentRollNumber: attendanceModel
                    .data!.attendance![index].rollNumber
                    .toString(),
              );

              print(attendanceModel.data!.dayNo);

              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => HomeScreen()));
              // val.updateAttenceModel(index, status);

              // await attendanceService.makeSinglePresent(
              //     context: context,
              //     attendanceId: attendanceModel.data!.sId.toString(),
              //     studentRollNumber: attendanceModel
              //         .data!.attendance![index].rollNumber
              //         .toString(),
              //     attendanceStatus: status);

              provider.updateAttenceModel(index, status);
            })),
      ],
    );
  }
}
