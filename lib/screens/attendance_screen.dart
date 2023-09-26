import 'package:attendance_system/providers/attendance_provder.dart';
import 'package:attendance_system/screens/home_screen.dart';
import 'package:attendance_system/services/http_services/attendance_service/attendance_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
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
      appBar: AppBar(
        actions: [
          CustomElevatedButton(
            childText: 'aaa',
            onpress: () {},
            status: 'present',
          )
        ],
      ),
      body: Consumer<AttendanceProvider>(
        builder: (context, value, child) {
          // print(value.attendanceModel.toString() + 'AAAAAAAAAdtrafa');
          return value.isLoading == true
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Container(
                  width: 1.sw,
                  color: Colors.black12,
                  child: Column(
                    children: [
                      if (value.attendanceModel!.attendance != null)
                        Text(value.attendanceModel!.sId.toString()),
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
                        child: FittedBox(
                          child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: DataTable(
                                  dataTextStyle: TextStyle(
                                    fontSize: 10.sp,
                                    color: Colors.red,
                                  ),
                                  dataRowColor:
                                      MaterialStateProperty.all(Colors.white),
                                  headingRowColor: MaterialStateProperty.all(
                                      Colors.redAccent),
                                  // decoration: BoxDecoration(
                                  //   color: Colors.grey.shade100,
                                  //   border: Border.all(color: Colors.grey),
                                  //   borderRadius: BorderRadius.circular(20),
                                  // ),
                                  // border: TableBorder.all(),
                                  // Datatable widget that have the property columns and rows.

                                  columns: tableHeader(length: 9, names: [
                                    'RollNo',
                                    "Name",
                                    "email",
                                    "status",
                                    "Registered",
                                    'Button',
                                    "ArrivalTime",
                                    "EndTime",
                                    "TotalTimeSpend"
                                  ]),
                                  rows: List.generate(
                                    value.attendanceModel!.attendance!.length,
                                    (index) => tableBody(
                                        index: index,
                                        attendanceModel:
                                            value.attendanceModel!),
                                  ))),
                        ),
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
        label: Text(
          names[index],
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  DataRow tableBody(
      {required int index, required AttendanceModel? attendanceModel}) {
    // print(DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.parse(
    //     attendanceModel!.attendance![index].arrivalTime.toString())));
    return DataRow(
      cells: [
        DataCell(
          Text(
            attendanceModel!.attendance![index].rollNumber ?? '',
            style: _CustomDataCellTextDecoration,
          ),
        ),
        DataCell(
          Text(
            attendanceModel.attendance![index].name ?? '',
            style: _CustomDataCellTextDecoration,
          ),
        ),
        DataCell(
          Text(
            attendanceModel.attendance![index].email ?? '',
            style: _CustomDataCellTextDecoration,
          ),
        ),
        DataCell(
          Text(
            attendanceModel.attendance![index].status ?? '',
            style: _CustomDataCellTextDecoration,
          ),
        ),
        DataCell(
          Text(attendanceModel.attendance![index].registered.toString()),
        ),
        DataCell(ElevatedButton(
            child: const Text('Attendance'),
            onPressed: () async {
              AttendanceService attendanceService = AttendanceService();
              String status = 'present';
              if (attendanceModel.attendance![index].status == 'present') {
                status = 'absent';
              } else {
                status = 'present';
              }

              final provider =
                  Provider.of<AttendanceProvider>(context, listen: false);
              provider.markAttendance(
                index: index,
                context: context,
                attendanceId: attendanceModel.sId.toString(),
                studentRollNumber:
                    attendanceModel.attendance![index].rollNumber.toString(),
              );

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
        DataCell(
          // Text(attendanceModel.attendance![index].arrivalTime.toString()),

          ElevatedButton(
            child: Text(attendanceModel.attendance![index].arrivalTime != ''
                ? DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.parse(
                    attendanceModel.attendance![index].arrivalTime.toString()))
                : ''),
            onPressed: attendanceModel.attendance![index].status == 'present'
                ? null
                : () async {
                    final provider =
                        Provider.of<AttendanceProvider>(context, listen: false);
                    provider.markArrivalTimeAttendance(
                      index: index,
                      context: context,
                      attendanceId: attendanceModel.sId.toString(),
                      studentRollNumber: attendanceModel
                          .attendance![index].rollNumber
                          .toString(),
                    );

                    provider.updateArrivalTmeinListWithStatus(
                        index: index,
                        status: 'present',
                        arrivalTime: DateTime.now().toString());
                  },
          ),
        ),
        DataCell(
          ElevatedButton(
            child: attendanceModel.attendance![index].endTime != ''
                ? Text(DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.parse(
                    attendanceModel.attendance![index].endTime.toString())))
                : Text(''),
            onPressed: attendanceModel.attendance![index].status == 'absent'
                ? null
                : () async {
                    final provider =
                        Provider.of<AttendanceProvider>(context, listen: false);
                    provider.markEndTimeAttendance(
                      index: index,
                      context: context,
                      attendanceId: attendanceModel.sId.toString(),
                      studentRollNumber: attendanceModel
                          .attendance![index].rollNumber
                          .toString(),
                    );

                    provider.updateEndTimeListWithTotalHours(
                        index: index,
                        totalTimeSpend: '',
                        endTime: DateTime.now().toString());
                  },
          ),
        ),
        DataCell(
          Text(attendanceModel.attendance![index].totalTimeSpend.toString()),
        ),
      ],
    );
  }

  var _CustomDataCellTextDecoration = TextStyle(
    color: Colors.black,
  );
}

class CustomElevatedButton extends StatelessWidget {
  final String status;
  final VoidCallback? onpress;
  final String childText;
  const CustomElevatedButton(
      {super.key,
      required this.status,
      required this.onpress,
      required this.childText});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: status == 'present' ? null : onpress,
      child: Text(childText),
      style: ElevatedButton.styleFrom(
        textStyle: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
        minimumSize: Size(70.w, 100.h), //change size of this beautiful button
        // We can change style of this beautiful elevated button thanks to style prop
        backgroundColor: Colors.red, // we can set primary color
        foregroundColor: Colors.white, // change color of child prop
        disabledForegroundColor: Colors.purple, // surface color,
        disabledBackgroundColor: Colors.yellow,
        shadowColor: Colors
            .grey, //shadow prop is a very nice prop for every button or card widgets.
        elevation: 5, // we can set elevation of this beautiful button
        side: BorderSide(
            color: Colors.redAccent.shade400, //change border color
            width: 2, //change border width
            style: BorderStyle
                .solid), // change border side of this beautiful button
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
              30), //change border radius of this beautiful button thanks to BorderRadius.circular function
        ),
        tapTargetSize: MaterialTapTargetSize.padded,
      ),
    );
  }
}
