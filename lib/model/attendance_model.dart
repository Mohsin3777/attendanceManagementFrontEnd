class AttendanceModel {
  bool? success;
  Data? data;

  AttendanceModel({this.success, this.data});

  AttendanceModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? sId;
  String? date;
  String? dayNo;
  List<Attendance>? attendance;
  int? iV;

  Data({this.sId, this.date, this.dayNo, this.attendance, this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    date = json['date'];
    dayNo = json['DayNo'];
    if (json['attendance'] != null) {
      attendance = <Attendance>[];
      json['attendance'].forEach((v) {
        attendance!.add(new Attendance.fromJson(v));
      });
    }
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['date'] = this.date;
    data['DayNo'] = this.dayNo;
    if (this.attendance != null) {
      data['attendance'] = this.attendance!.map((v) => v.toJson()).toList();
    }
    data['__v'] = this.iV;
    return data;
  }
}

class Attendance {
  String? sId;
  StudentId? studentId;
  bool? registered;
  String? date;
  String? status;
  int? iV;

  Attendance(
      {this.sId,
      this.studentId,
      this.registered,
      this.date,
      this.status,
      this.iV});

  Attendance.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    studentId = json['studentId'] != null
        ? new StudentId.fromJson(json['studentId'])
        : null;
    registered = json['registered'];
    date = json['date'];
    status = json['status'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.studentId != null) {
      data['studentId'] = this.studentId!.toJson();
    }
    data['registered'] = this.registered;
    data['date'] = this.date;
    data['status'] = this.status;
    data['__v'] = this.iV;
    return data;
  }
}

class StudentId {
  String? sId;
  String? name;
  String? rollNumber;
  int? iV;

  StudentId({this.sId, this.name, this.rollNumber, this.iV});

  StudentId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    rollNumber = json['rollNumber'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['rollNumber'] = this.rollNumber;
    data['__v'] = this.iV;
    return data;
  }
}
