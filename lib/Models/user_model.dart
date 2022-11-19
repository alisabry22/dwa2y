
class UserModel {
  String username , email , phone ,type;
UserModel({
  required this.username,
  required this.email,
  required this.phone,
  required this.type,
});
factory UserModel.fromJson(Map<String,dynamic>json){
  final username=json["username"];
  final email=json["email"];
  final phone=json["phone"];
  final type=json["type"];

  return UserModel(email:email ,username:username ,phone: phone,type: type);
}

}