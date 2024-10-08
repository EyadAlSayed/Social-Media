import 'dart:convert';

/// email : ""

LogoutRequestEntity logoutRequestEntityFromJson(String str) =>
    LogoutRequestEntity.fromJson(json.decode(str));

String logoutRequestEntityToJson(LogoutRequestEntity data) =>
    json.encode(data.toJson());

class LogoutRequestEntity {
  LogoutRequestEntity({
    String? email,
  }) {
    _email = email;
  }

  LogoutRequestEntity.fromJson(dynamic json) {
    _email = json['email'];
  }

  String? _email;

  LogoutRequestEntity copyWith({
    String? email,
  }) =>
      LogoutRequestEntity(
        email: email ?? _email,
      );

  String? get email => _email;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = _email;
    return map;
  }
}
