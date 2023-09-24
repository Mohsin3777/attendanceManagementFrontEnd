// class AttendanceModel {
//   bool? success;
//   Data? data;

//   AttendanceModel({this.success, this.data});

//   AttendanceModel.fromJson(Map<String, dynamic> json) {
//     success = json['success'];
//     data = json['data'] != null ? new Data.fromJson(json['data']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['success'] = this.success;
//     if (this.data != null) {
//       data['data'] = this.data!.toJson();
//     }
//     return data;
//   }
// }

// class Data {
//   String? sId;
//   String? date;
//   String? dayNo;
//   List<Attendance>? attendance;
//   String? createdAt;
//   String? updatedAt;
//   int? iV;

//   Data(
//       {this.sId,
//       this.date,
//       this.dayNo,
//       this.attendance,
//       this.createdAt,
//       this.updatedAt,
//       this.iV});

//   Data.fromJson(Map<String, dynamic> json) {
//     sId = json['_id'];
//     date = json['date'];
//     dayNo = json['DayNo'];
//     if (json['attendance'] != null) {
//       attendance = <Attendance>[];
//       json['attendance'].forEach((v) {
//         attendance!.add(new Attendance.fromJson(v));
//       });
//     }
//     createdAt = json['createdAt'];
//     updatedAt = json['updatedAt'];
//     iV = json['__v'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['_id'] = this.sId;
//     data['date'] = this.date;
//     data['DayNo'] = this.dayNo;
//     if (this.attendance != null) {
//       data['attendance'] = this.attendance!.map((v) => v.toJson()).toList();
//     }
//     data['createdAt'] = this.createdAt;
//     data['updatedAt'] = this.updatedAt;
//     data['__v'] = this.iV;
//     return data;
//   }
// }

// class Attendance {
//   String? sId;
//   String? name;
//   String? rollNumber;
//   String? email;
//   String? profilePic;
//   bool? registered;
//   String? status;
//   int? iV;

//   Attendance(
//       {this.sId,
//       this.name,
//       this.rollNumber,
//       this.email,
//       this.profilePic,
//       this.registered,
//       this.status,
//       this.iV});

//   Attendance.fromJson(Map<String, dynamic> json) {
//     sId = json['_id'];
//     name = json['name'];
//     rollNumber = json['rollNumber'];
//     email = json['email'];
//     profilePic = json['profilePic'];
//     registered = json['registered'];
//     status = json['status'];
//     iV = json['__v'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['_id'] = this.sId;
//     data['name'] = this.name;
//     data['rollNumber'] = this.rollNumber;
//     data['email'] = this.email;
//     data['profilePic'] = this.profilePic;
//     data['registered'] = this.registered;
//     data['status'] = this.status;
//     data['__v'] = this.iV;
//     return data;
//   }
// }



class AttendanceModel {
  String? sId;
  String? date;
  String? dayNo;
  List<Attendance>? attendance;
  String? createdAt;
  String? updatedAt;
  int? iV;

  AttendanceModel(
      {this.sId,
      this.date,
      this.dayNo,
      this.attendance,
      this.createdAt,
      this.updatedAt,
      this.iV});

  AttendanceModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    date = json['date'];
    dayNo = json['DayNo'];
    if (json['attendance'] != null) {
      attendance = <Attendance>[];
      json['attendance'].forEach((v) {
        attendance!.add(new Attendance.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
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
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class Attendance {
  String? sId;
  String? name;
  String? rollNumber;
  String? email;
  String? profilePic;
  bool? registered;
  String? status;
  int? iV;

  Attendance(
      {this.sId,
      this.name,
      this.rollNumber,
      this.email,
      this.profilePic,
      this.registered,
      this.status,
      this.iV});

  Attendance.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    rollNumber = json['rollNumber'];
    email = json['email'];
    profilePic = json['profilePic'];
    registered = json['registered'];
    status = json['status'];
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
    data['status'] = this.status;
    data['__v'] = this.iV;
    return data;
  }
}
