
class UserModel {
  String username, phone, type, countrycode, profileImageLink;
  UserModel({
    required this.username,
    required this.phone,
    required this.type,
    required this.countrycode,
    required this.profileImageLink,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) {
    final username = json["username"];
    final phone = json["phone"];
    final type = json["type"];
    final profileImageLink = json["profileImage"];
    final countryCode = json["countryCode"];

    return UserModel(
        username: username,
        phone: phone,
        type: type,
        profileImageLink: profileImageLink,
        countrycode: countryCode);
  }

 Map<String,dynamic>  userModelToJson()=>{
  "username":username,
  "phone":phone,
  "countryCode":countrycode,
  "type":type,
  "profileImageLink":profileImageLink,
 };

  


}
