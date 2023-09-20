import 'dart:convert';
import 'dart:io';

import 'package:attendance_system/constants/app_constants.dart';
import 'package:attendance_system/model/attendance_model.dart';
import 'package:attendance_system/services/http_services.dart';

import '../../api_response_helperclass.dart';
import 'package:http/http.dart' as http;

class AttendanceService {
  Future getAttendance() async {
    try {
      http.Response response = await get(
          'api/attendance/GetSingleDayAttendance/650573d8c0bf568f68b83e27');
      // print(response.body);
      switch (response.statusCode) {
        case 200:
          var data = await jsonDecode(response.body);

          // print(data);
          AttendanceModel attendanceModel = AttendanceModel.fromJson(data);
          // storeUserTokenInSharedPref(data['accessToken']);
          // UserModel? rNetUser = await getUserData();
          // return rNetUser;
          return attendanceModel;
        default:
          // scaffoldKey.currentState;

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
