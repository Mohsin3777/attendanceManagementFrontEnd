import 'package:attendance_system/model/attendance_model.dart';
import 'package:attendance_system/services/http_services/user_service/user_service_class.dart';
import 'package:flutter/material.dart';

import '../model/user_model.dart';
import '../services/http_services/attendance_service/attendance_service.dart';

class UserDocumentProvider extends ChangeNotifier {
  List<UserModel>? usersList = [];

//registerd list
  List<UserModel>? _registeredList = [];
  List<UserModel>? get registeredList => _registeredList;

  set registeredList(List<UserModel>? value) {
    _registeredList = usersList!.where((c) => c.registered == true).toList();

    notifyListeners();
  }

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
    registeredList = usersList;
    // registeredList = usersList!.where((c) => c.registered == true).toList();
  }

  //register user
  registerUser(
      {required BuildContext context,
      required String userId,
      required bool registerStatus}) {
    isLoading = true;
    _registerUser(
        context: context, userId: userId, registerStatus: registerStatus);

    isLoading = false;

    notifyListeners();
  }

  _registerUser(
      {required BuildContext context,
      required String userId,
      required bool registerStatus}) async {
    UserServiceClass userServiceClass = UserServiceClass();
    await userServiceClass.registerUser(
        context: context, userId: userId, registerStatus: registerStatus);
  }
}
