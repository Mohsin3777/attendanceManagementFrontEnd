class AttendanceModel {
  Data? data;

  AttendanceModel({this.data});

  AttendanceModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson(data) {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? date;
  String? dayNo;
  List<Attendance>? attendance;
  String? sId;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Data(
      {this.date,
      this.dayNo,
      this.attendance,
      this.sId,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    dayNo = json['DayNo'];
    if (json['attendance'] != null) {
      attendance = <Attendance>[];
      json['attendance'].forEach((v) {
        attendance!.add(new Attendance.fromJson(v));
      });
    }
    sId = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['DayNo'] = this.dayNo;
    if (this.attendance != null) {
      data['attendance'] = this.attendance!.map((v) => v.toJson()).toList();
    }
    data['_id'] = this.sId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
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
  String? email;
  String? profilePic;
  bool? registered;
  int? iV;

  StudentId(
      {this.sId,
      this.name,
      this.rollNumber,
      this.email,
      this.profilePic,
      this.registered,
      this.iV});

  StudentId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    rollNumber = json['rollNumber'];
    email = json['email'];
    profilePic = json['profilePic'];
    registered = json['registered'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['rollNumber'] = this.rollNumber;
    data['email'] = this.email;
    data['profilePic'] = this.profilePic;
    data['registered'] = this.registered;
    data['__v'] = this.iV;
    return data;
  }
}
