class UserModel {
  String? email;
  String? profilePic;
  String? sId;
  String? name;
  String? rollNumber;
  int? iV;

  UserModel(
      {this.email,
      this.profilePic,
      this.sId,
      this.name,
      this.rollNumber,
      this.iV});

  UserModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    profilePic = json['profilePic'];
    sId = json['_id'];
    name = json['name'];
    rollNumber = json['rollNumber'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['profilePic'] = this.profilePic;
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['rollNumber'] = this.rollNumber;
    data['__v'] = this.iV;
    return data;
  }
}
