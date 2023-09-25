import 'package:attendance_system/model/attendance_model.dart';
import 'package:flutter/material.dart';

import '../services/http_services/attendance_service/attendance_service.dart';

class AttendanceProvider extends ChangeNotifier {
  AttendanceService attendanceService = AttendanceService();
  List<AttendanceModel>? attendanceOfAllDays = [];
  AttendanceModel? attendanceModel = AttendanceModel();

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;

    notifyListeners();
  }

  //create attendnace
  Future createTodayAttendance(BuildContext context) async {
    isLoading = true;

    await _createTodayAttendance(context);
    isLoading = false;
    notifyListeners();
  }

  _createTodayAttendance(BuildContext context) async {
    attendanceModel =
        await attendanceService.createAttendance(context: context);

    notifyListeners();
  }

//get single day attendcane with id
  Future attendanceOfDay(BuildContext context) async {
    isLoading = true;

    await _attendanceOfDay(context);
    isLoading = false;

    notifyListeners();
  }

  _attendanceOfDay(BuildContext context) async {
    attendanceModel = await attendanceService.getAttendance();

    notifyListeners();
  }

  updateAttenceModel(int index, String status) {
    attendanceModel!.attendance![index].status = status;
    notifyListeners();
  }

  //mark attendance

  Future markAttendance({
    required int index,
    required BuildContext context,
    required String? attendanceId,
    required String? studentRollNumber,
  }) async {
    // isLoading = true;

    String status = 'present';
    if (attendanceModel!.attendance![index].status == 'present') {
      status = 'absent';
      await _markAttendance(
          context: context,
          attendanceId: attendanceId!,
          studentRollNumber: studentRollNumber!,
          attendanceStatus: status);
      isLoading = false;
      notifyListeners();
    } else {
      status = 'present';
      await _markAttendance(
          context: context,
          attendanceId: attendanceId!,
          studentRollNumber: studentRollNumber!,
          attendanceStatus: status);
      isLoading = false;
      notifyListeners();
    }
  }

  _markAttendance({
    required BuildContext context,
    required String? attendanceId,
    required String? studentRollNumber,
    required String? attendanceStatus,
  }) async {
    await attendanceService.makeSinglePresent(
        context: context,
        attendanceId: attendanceId!,
        studentRollNumber: studentRollNumber!,
        attendanceStatus: attendanceStatus!);
  }

//mark arrivalTIme

  Future markArrivalTimeAttendance({
    required int index,
    required BuildContext context,
    required String? attendanceId,
    required String? studentRollNumber,
  }) async {
    // isLoading = true;

    String status = 'present';
    if (attendanceModel!.attendance![index].status == 'present') {
      // status = 'absent';
      status = 'present';

      await _markAttendance(
          context: context,
          attendanceId: attendanceId!,
          studentRollNumber: studentRollNumber!,
          attendanceStatus: status);
      isLoading = false;
      notifyListeners();
    } else {
      status = 'present';
      await _markArrivalTimeAttendance(
          context: context,
          attendanceId: attendanceId!,
          studentRollNumber: studentRollNumber!,
          attendanceStatus: status);
      isLoading = false;
      notifyListeners();
    }
  }

  _markArrivalTimeAttendance({
    required BuildContext context,
    required String? attendanceId,
    required String? studentRollNumber,
    required String? attendanceStatus,
  }) async {
    await attendanceService.markArrivalTime(
        context: context,
        attendanceId: attendanceId!,
        studentRollNumber: studentRollNumber!,
        attendanceStatus: attendanceStatus!);
  }

  updateArrivalTmeinListWithStatus(
      {required int index,
      required String status,
      required String arrivalTime}) {
    attendanceModel!.attendance![index].status = status;
    attendanceModel!.attendance![index].arrivalTime = arrivalTime;

    notifyListeners();
  }

//arrival time end xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

//end time with total hours
  Future markEndTimeAttendance(
      {required int index,
      required BuildContext context,
      required String? attendanceId,
      required String? studentRollNumber,
   }) async {
    // isLoading = true;

    await _markEndTimeAttendance(
        context: context,
        attendanceId: attendanceId!,
        studentRollNumber: studentRollNumber!,
        );
  }

  _markEndTimeAttendance(
      {required BuildContext context,
      required String? attendanceId,
      required String? studentRollNumber,
  }) async {
    await attendanceService.markEndTime(
        context: context,
        attendanceId: attendanceId!,
        studentRollNumber: studentRollNumber!,
     );
  }

  updateEndTimeListWithTotalHours(
      {required int index,
      required String totalTimeSpend,
      required String endTime}) {
    attendanceModel!.attendance![index].totalTimeSpend = totalTimeSpend;
    attendanceModel!.attendance![index].endTime = endTime;

    notifyListeners();
  }

//end time end xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

//get all attendance

  Future getAllDayAttendance(BuildContext context) async {
    isLoading = true;

    await _getAllDayAttendance(context);
    isLoading = false;
    notifyListeners();
  }

  _getAllDayAttendance(BuildContext context) async {
    List<AttendanceModel>? atten = [];

    attendanceOfAllDays = await attendanceService.getAllDaysAttendance();

    notifyListeners();
  }
}
