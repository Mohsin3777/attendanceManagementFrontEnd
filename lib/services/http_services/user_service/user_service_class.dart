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
  Future UpdateUserWithRegister(
      {required BuildContext context,
      required String userId,
      required UserModel? userModel
      }) async {
    try {


      http.Response response = await put(
          "api/userDoc/updateUserDetails/$userId",
          jsonEncode({"registered": userModel!.registered,
          "name":userModel.name
          }));
      print(response.body);
      switch (response.statusCode) {
        case 200:
          CustomSnackBar.buildSuccessSnackbar(context, 'Success Fully updated');
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


  //remove registration
    //register User
  Future removeRegister(
      {required BuildContext context,
      required String userId,
   }) async {
    try {
      http.Response response = await put(
          "api/registerUser/removeRegisteredUser/$userId",
          jsonEncode({}));
      print(response.body);
      switch (response.statusCode) {
        case 200:
          CustomSnackBar.buildSuccessSnackbar(context, 'Success Fully remove');
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
