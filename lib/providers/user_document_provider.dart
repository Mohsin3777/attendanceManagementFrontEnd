import 'package:attendance_system/model/attendance_model.dart';
import 'package:attendance_system/services/http_services/user_service/user_service_class.dart';
import 'package:flutter/material.dart';

import '../model/user_model.dart';
import '../services/http_services/attendance_service/attendance_service.dart';

class UserDocumentProvider extends ChangeNotifier {
  List<UserModel>? usersList = [];

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  getAllStudents({required BuildContext context}) {
    isLoading = true;
    _getAllStudents(context: context);
    isLoading = false;
    notifyListeners();
  }

  void _getAllStudents({required BuildContext context}) async {
    UserServiceClass userServiceClass = UserServiceClass();
    usersList = await userServiceClass.getAllUsers(context: context);
  }
}
