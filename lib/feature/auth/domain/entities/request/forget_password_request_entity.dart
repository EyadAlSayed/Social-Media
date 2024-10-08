import 'dart:convert';

/// email : ""

ForgetPasswordRequestEntity forgetPasswordRequestEntityFromJson(String str) =>
    ForgetPasswordRequestEntity.fromJson(json.decode(str));

String forgetPasswordRequestEntityToJson(ForgetPasswordRequestEntity data) =>
    json.encode(data.toJson());

class ForgetPasswordRequestEntity {
  ForgetPasswordRequestEntity({
    String? email,
  }) {
    _email = email;
  }

  ForgetPasswordRequestEntity.fromJson(dynamic json) {
    _email = json['email'];
  }

  String? _email;

  ForgetPasswordRequestEntity copyWith({
    String? email,
  }) =>
      ForgetPasswordRequestEntity(
        email: email ?? _email,
      );

  String? get email => _email;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = _email;
    return map;
  }
}
