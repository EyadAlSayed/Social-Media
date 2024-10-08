import 'dart:convert';

/// email : ""
/// password : ""

SignupRequestEntity signupRequestEntityFromJson(String str) =>
    SignupRequestEntity.fromJson(json.decode(str));

String signupRequestEntityToJson(SignupRequestEntity data) =>
    json.encode(data.toJson());

class SignupRequestEntity {
  SignupRequestEntity({
    String? email,
    String? password,
  }) {
    _email = email;
    _password = password;
  }

  SignupRequestEntity.fromJson(dynamic json) {
    _email = json['email'];
    _password = json['password'];
  }

  String? _email;
  String? _password;

  SignupRequestEntity copyWith({
    String? email,
    String? password,
  }) =>
      SignupRequestEntity(
        email: email ?? _email,
        password: password ?? _password,
      );

  String? get email => _email;

  String? get password => _password;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = _email;
    map['password'] = _password;
    return map;
  }
}
