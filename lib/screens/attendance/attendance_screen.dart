import 'package:attendance_system/providers/attendance_provder.dart';
import 'package:attendance_system/screens/attendance/all_attendance_screen.dart';
import 'package:attendance_system/screens/attendance/widgets/header_transparent_tile.dart';
import 'package:attendance_system/screens/home_screen.dart';
import 'package:attendance_system/services/http_services/attendance_service/attendance_service.dart';
import 'package:attendance_system/utils/dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../model/attendance_model.dart';
import '../../widgets/custom_snackbar.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({super.key});

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

List<String> tableHeadingList =[
        'RollNo',
                                      "Name",
                                      "email",
                                      "status",
                                      "Registered",
                                      // 'Button',
                                      "ArrivalTime",
                                      "EndTime",
                                      // "TotalTimeSpend"
];

class _AttendanceScreenState extends State<AttendanceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
  
      body: Container(
                height: 1.sh,
        width: 1.sw,
        decoration: const BoxDecoration(
          image: DecorationImage(image: NetworkImage('https://images.unsplash.com/photo-1564069114553-7215e1ff1890?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1632&q=80'),fit: BoxFit.cover)
        ),
        child: Consumer<AttendanceProvider>(
          builder: (context, value, child) {
            // print(value.attendanceModel.toString() + 'AAAAAAAAAdtrafa');
            return value.isLoading == true
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Container(
                    // width: 1.sw,
                    color: Colors.black12,
                    margin: EdgeInsets.symmetric(horizontal: 10.h),
                    child: Column(
                      children: [
                        // if (value.attendanceModel!.attendance != null)
                        //   Text(value.attendanceModel!.sId.toString()),
                SizedBox(height: 30.h,),
 HeaderTile(title: 'TODAY ATTENDANCE',leftBtn: (){
  Navigator.pop(context);
 },),
SizedBox(height: 20.h,),
      
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
                                                  MaterialStateProperty.all(Colors.white.withOpacity(0.5)),
                                              headingRowColor:
                                                  MaterialStateProperty.all(Colors.grey.withOpacity(0.7)),
                           
      
                                    columns: tableHeader(length:tableHeadingList.length, names: tableHeadingList),
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
          Text(attendanceModel.attendance![index].registered.toString() ,style: _CustomDataCellTextDecoration,),
        ),
        // DataCell(ElevatedButton(
        //     child: const Text('Attendance'),
        //     onPressed: () async {
        //       AttendanceService attendanceService = AttendanceService();
        //       String status = 'present';
        //       if (attendanceModel.attendance![index].status == 'present') {
        //         status = 'absent';
        //       } else {
        //         status = 'present';
        //       }

        //       final provider =
        //           Provider.of<AttendanceProvider>(context, listen: false);
        //       provider.markAttendance(
        //         index: index,
        //         context: context,
        //         attendanceId: attendanceModel.sId.toString(),
        //         studentRollNumber:
        //             attendanceModel.attendance![index].rollNumber.toString(),
        //       );

        //       // Navigator.push(context,
        //       //     MaterialPageRoute(builder: (context) => HomeScreen()));
        //       // val.updateAttenceModel(index, status);

        //       // await attendanceService.makeSinglePresent(
        //       //     context: context,
        //       //     attendanceId: attendanceModel.data!.sId.toString(),
        //       //     studentRollNumber: attendanceModel
        //       //         .data!.attendance![index].rollNumber
        //       //         .toString(),
        //       //     attendanceStatus: status);

        //       provider.updateAttenceModel(index, status);
        //     })),
        DataCell(
          // Text(attendanceModel.attendance![index].arrivalTime.toString()),

          ElevatedButton(
            child: Text((attendanceModel.attendance![index].arrivalTime != '' &&
                    attendanceModel.attendance![index].arrivalTime != null)
                ? DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.parse(
                    attendanceModel.attendance![index].arrivalTime.toString()))
                : ''),
  //  child: Text(DateFormat.yMMMMd().add_Hm().format(DateTime.fromMillisecondsSinceEpoch(int.parse(attendanceModel.attendance![index].arrivalTime!)))),
            onPressed: attendanceModel.attendance![index].status == 'present'
                ? null
                : () async {
                   
CustomDialogsCls.showCustomDialog(context: context ,mainButtonText: 'YES',secondButtonText: 'Back',
titleText: 'MARK ARRIVAL TIME',
secondButton: (){
  Navigator.pop(context);
},
mainButton: ()async{
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
                         Navigator.pop(context);
}
);

                  },
          ),
        ),
        DataCell(
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red[50], foregroundColor: Colors.red),
            child: Text(attendanceModel.attendance![index].endTime != '' &&
                    attendanceModel.attendance![index].endTime != null
                ? DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.parse(
                    attendanceModel.attendance![index].endTime.toString()))
                : ''),
            // child: Text(DateFormat.yMMMMd().add_Hm().format(DateTime.fromMillisecondsSinceEpoch(int.parse(attendanceModel.attendance![index].endTime!)))),
            // child: Text(''),
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

                               CustomSnackBar.buildSuccessSnackbar(
              context, 'done');
                  },
          ),
        ),
        // DataCell(
        //   Text(attendanceModel.attendance![index].totalTimeSpend.toString()),
        // ),
      ],
    );
  }

  var _CustomDataCellTextDecoration = TextStyle(
    color: Colors.black,
  );
}


