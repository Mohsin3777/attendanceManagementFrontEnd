import 'package:attendance_system/model/attendance_model.dart';
import 'package:flutter/material.dart';

import '../services/http_services/attendance_service/attendance_service.dart';

class AttendanceProvider extends ChangeNotifier {
  AttendanceService attendanceService = AttendanceService();
  List<AttendanceModel>? attendanceOfAllDays = [];
  AttendanceModel? attendanceModel =
      AttendanceModel(data: Data(attendance: [], date: '', dayNo: ''));

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
}
