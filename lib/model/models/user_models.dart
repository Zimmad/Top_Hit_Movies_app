class UserModel {
  String? token;

  UserModel({this.token});
  UserModel.fromJson(Map<String, dynamic> json) {
    token = json["token"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};

    _data["token"] = this.token;
    return _data;
  }
}
