import 'package:attendance_system/providers/attendance_provder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class BasicPageScreen extends StatefulWidget {
  const BasicPageScreen({super.key});

  @override
  State<BasicPageScreen> createState() => _BasicPageScreenState();
}

class _BasicPageScreenState extends State<BasicPageScreen> {
  void initState() {
    super.initState();
    final provider = Provider.of<AttendanceProvider>(context, listen: false);
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      try {
        provider.AttendanceOfAllDays();
      } catch (e) {
        SnackBar(content: Text(e.toString()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<AttendanceProvider>(
        builder: (context, value, child) {
          return value.isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Container(
                  width: MediaQuery.of(context).size.width / 2,
                  color: Colors.yellow,
                  child: Column(
                    children: [
                      Text(
                        'Today Attendance ' +
                            value.attendanceModel!.data!.date.toString(),
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(value.attendanceModel!.data!.sId.toString()),
                      Expanded(
                          child: ListView.builder(
                              itemCount: value.attendanceModel != null
                                  ? value
                                      .attendanceModel!.data!.attendance?.length
                                  : 0,
                              // itemCount: 0,
                              itemBuilder: (context, index) {
                                return Card(
                                  child: Column(
                                    children: [
                                      Text("Name  "
                                          "${value.attendanceModel!.data!.attendance![index].studentId!.name}"
                                          ''),
                                      Text("RollNumber  "
                                          "${value.attendanceModel!.data!.attendance![index].studentId!.rollNumber}"
                                          ''),
                                    ],
                                  ),
                                );
                              }))
                    ],
                  ),
                );
        },
      ),
    );
  }
}
