class UserModel {
  String? email;
  String? profilePic;
  String? sId;
  String? name;
  String? rollNumber;
  int? iV;
  bool? registered;

  UserModel(
      {this.email,
      this.profilePic,
      this.sId,
      this.name,
      this.rollNumber,
      this.registered,
      this.iV});

  UserModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    profilePic = json['profilePic'];
    sId = json['_id'];
    name = json['name'];
    rollNumber = json['rollNumber'];
    registered = json['registered'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['profilePic'] = this.profilePic;
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['rollNumber'] = this.rollNumber;
    data['registered'] = this.registered;
    data['__v'] = this.iV;
    return data;
  }
}
