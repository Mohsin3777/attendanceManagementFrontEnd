import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AddAttendance extends StatefulWidget {
  const AddAttendance({super.key});

  @override
  State<AddAttendance> createState() => _AddAttendanceState();
}

class _AddAttendanceState extends State<AddAttendance> {
  final _signUpFormKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Attendance'),
      ),
      body: Form(
        key: _signUpFormKey,
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
