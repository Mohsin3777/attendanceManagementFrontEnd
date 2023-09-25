// class UserModel {
//   String? email;
//   String? profilePic;
//   String? sId;
//   String? name;
//   String? rollNumber;
//   int? iV;
//   bool? registered;

//   UserModel(
//       {this.email,
//       this.profilePic,
//       this.sId,
//       this.name,
//       this.rollNumber,
//       this.registered,
//       this.iV});

//   UserModel.fromJson(Map<String, dynamic> json) {
//     email = json['email'];
//     profilePic = json['profilePic'];
//     sId = json['_id'];
//     name = json['name'];
//     rollNumber = json['rollNumber'];
//     registered = json['registered'];
//     iV = json['__v'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['email'] = this.email;
//     data['profilePic'] = this.profilePic;
//     data['_id'] = this.sId;
//     data['name'] = this.name;
//     data['rollNumber'] = this.rollNumber;
//     data['registered'] = this.registered;
//     data['__v'] = this.iV;
//     return data;
//   }
// }

//new model  xxxxxxxxxxx
class UserModel {
  String? name;
  String? rollNumber;
  String? email;
  String? profilePic;
  bool? registered;
  String? status;
  String? arrivalTime;
  String? endTime;
  String? totalTimeSpend;
  String? sId;

  UserModel(
      {this.name,
      this.rollNumber,
      this.email,
      this.profilePic,
      this.registered,
      this.status,
      this.arrivalTime,
      this.endTime,
      this.totalTimeSpend,
      this.sId});

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    rollNumber = json['rollNumber'];
    email = json['email'];
    profilePic = json['profilePic'];
    registered = json['registered'];
    status = json['status'];
    arrivalTime = json['arrivalTime'];
    endTime = json['endTime'];
    totalTimeSpend = json['totalTimeSpend'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['rollNumber'] = this.rollNumber;
    data['email'] = this.email;
    data['profilePic'] = this.profilePic;
    data['registered'] = this.registered;
    data['status'] = this.status;
    data['arrivalTime'] = this.arrivalTime;
    data['endTime'] = this.endTime;
    data['totalTimeSpend'] = this.totalTimeSpend;
    data['_id'] = this.sId;
    return data;
  }
}
