import 'dart:convert';
import 'dart:io';

import 'package:attendance_system/model/user_model.dart';
import 'package:attendance_system/services/api_response_helperclass.dart';
import 'package:attendance_system/services/http_services.dart';
import 'package:attendance_system/widgets/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserServiceClass {
  Future<List<UserModel>?> getAllUsers({required BuildContext context}) async {
    try {
      http.Response response = await get(
        "api/userDoc/allUsers/",
      );
      // print(response.body);
      switch (response.statusCode) {
        case 200:
          var data = await jsonDecode(response.body);

          List<UserModel> userList = List<UserModel>.from(json
              .decode(response.body)["data"]
              .map((x) => UserModel.fromJson(x)));
          // print(data['data']);
          return userList;
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

  //register User
  Future registerUser(
      {required BuildContext context,
      required String userId,
      required bool registerStatus}) async {
    try {
      http.Response response = await put(
          "api/registerUser/registeredUser/$userId",
          jsonEncode({"registered": registerStatus}));
      // print(response.body);
      switch (response.statusCode) {
        case 200:
          CustomSnackBar.buildErrorSnackbar(context, 'Success Fully added');
          return response.body;
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
}
