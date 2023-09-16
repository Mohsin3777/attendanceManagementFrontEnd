import 'package:attendance_system/model/attendance_model.dart';
import 'package:flutter/material.dart';

import '../services/http_services/attendance_service/attendance_service.dart';

class AttendanceProvider extends ChangeNotifier {
  List<AttendanceModel>? attendanceOfAllDays = [];
  AttendanceModel? attendanceModel = AttendanceModel();

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  AttendanceOfAllDays() {
    isLoading = true;
    _AttendanceOfAllDays();
    isLoading = false;
    notifyListeners();
  }

  void _AttendanceOfAllDays() async {
    AttendanceService attendanceService = AttendanceService();
    attendanceModel = await attendanceService.getAttendance();
  }
}
