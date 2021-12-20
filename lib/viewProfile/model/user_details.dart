class UserDetailsModel {
  UserDetailsModel({
    required this.fullName,
    required this.address,
    required this.userid,
    required this.email,
  });
  UserDetailsModel.fromJson(Map<String, dynamic> json) {
    fullName = json['full_name'].toString();
    address = json['address'].toString();
    userid = json['userid'].toString();
    email = json['email'].toString();
  }
  late String fullName;
  late String address;
  late String userid;
  late String email;

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['full_name'] = fullName;
    _data['address'] = address;
    _data['userid'] = userid;
    _data['email'] = email;
    return _data;
  }
}
