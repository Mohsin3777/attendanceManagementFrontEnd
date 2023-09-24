import 'dart:convert';
import 'dart:io';

import 'package:attendance_system/constants/app_constants.dart';
import 'package:attendance_system/model/attendance_model.dart';
import 'package:attendance_system/services/http_services.dart';
import 'package:flutter/material.dart';

import '../../../widgets/custom_snackbar.dart';
import '../../api_response_helperclass.dart';
import 'package:http/http.dart' as http;

class AttendanceService {
  Future<AttendanceModel?> getAttendance() async {
    try {
      http.Response response = await get(
          'api/attendance/GetSingleDayAttendance/650c003cc729fc6b74d884bf');
      // print(response.body);
      switch (response.statusCode) {
        case 200:
          var data = await jsonDecode(response.body);

          // print(data);
          AttendanceModel? attendanceModel = AttendanceModel.fromJson(data);

          return attendanceModel;
        default:
          throw Exception(response.reasonPhrase);
      }
    } on SocketException {
      throw NoInternetException('No Internet');
    } on HttpException {
      throw NoServiceFoundException('No Service Found');
    } on FormatException {
      throw InvalidFormatException('Invalid Data Format');
    } catch (e) {
      throw UnknownException(e.toString());
    }
  }

  //create todayAttendance
  Future<AttendanceModel> createAttendance(
      {required BuildContext context}) async {
    try {
      http.Response response =
          await post("api/attendance/createAttendance", '');
      // print(response.body);
      switch (response.statusCode) {
        case 200:
          var data = await jsonDecode(response.body)['data'];

          AttendanceModel attendanceModel = AttendanceModel.fromJson(data);
          // print(data['data']);
          return attendanceModel;
        default:
          // ignore: use_build_context_synchronously
          CustomSnackBar.buildErrorSnackbar(
              context, response.reasonPhrase.toString());

          throw Exception(response.reasonPhrase);
      }
    } on SocketException {
      CustomSnackBar.buildErrorSnackbar(context, 'NO Internet');
      throw NoInternetException('No Internet');
    } on HttpException {
      CustomSnackBar.buildErrorSnackbar(context, 'No Service Found');
      throw NoServiceFoundException('No Service Found');
    } on FormatException {
      CustomSnackBar.buildErrorSnackbar(context, 'Invalid Data Format');
      throw InvalidFormatException('Invalid Data Format');
    } catch (e) {
      CustomSnackBar.buildErrorSnackbar(context, e.toString());
      throw UnknownException(e.toString());
    }
  }

  //update status
  Future<AttendanceModel> makeSinglePresent({
    required BuildContext context,
    required String? attendanceId,
    required String? studentRollNumber,
    required String? attendanceStatus,
  }) async {
    try {
      print(studentRollNumber.toString());
      print(attendanceId);
      http.Response response = await patch(
          "api/attendance/AddAttendance/$attendanceId",
          json.encode({
            "rollNumber": studentRollNumber.toString(),
            "attendanceStatus": attendanceStatus,
          }));
      // print(response.body);
      switch (response.statusCode) {
        case 200:
          var data = await jsonDecode(response.body);

          CustomSnackBar.buildSuccessSnackbar(
              context, response.body.toString());
          AttendanceModel attendanceModel = AttendanceModel.fromJson(data);
          print(data['data']['attendance']);
          return attendanceModel;
        default:
          // ignore: use_build_context_synchronously
          CustomSnackBar.buildErrorSnackbar(
              context, response.reasonPhrase.toString());

          throw Exception(response.reasonPhrase);
      }
    } on SocketException {
      CustomSnackBar.buildErrorSnackbar(context, 'NO Internet');
      throw NoInternetException('No Internet');
    } on HttpException {
      CustomSnackBar.buildErrorSnackbar(context, 'No Service Found');
      throw NoServiceFoundException('No Service Found');
    } on FormatException {
      CustomSnackBar.buildErrorSnackbar(context, 'Invalid Data Format');
      throw InvalidFormatException('Invalid Data Format');
    } catch (e) {
      CustomSnackBar.buildErrorSnackbar(context, e.toString());
      throw UnknownException(e.toString());
    }
  }

  //get all days Attendance
  Future<List<AttendanceModel>?> getAllDaysAttendance() async {
    try {
      http.Response response = await get('api/attendance/getallDaysAttendance');

      switch (response.statusCode) {
        case 200:
          var data = await jsonDecode(response.body);
          AttendanceModel attendanceModel = AttendanceModel();
          List<AttendanceModel>? attendanceModelList = [];
          for (var i = 0; i < data['data']!.length; i++) {
            attendanceModelList.add(AttendanceModel.fromJson(data['data'][i]));
          }
          print(attendanceModelList[0].date);
          return attendanceModelList;
        default:
          throw Exception(response.reasonPhrase);
      }
    } on SocketException {
      throw NoInternetException('No Internet');
    } on HttpException {
      throw NoServiceFoundException('No Service Found');
    } on FormatException {
      throw InvalidFormatException('Invalid Data Format');
    } catch (e) {
      throw UnknownException(e.toString());
    }
  }
}
