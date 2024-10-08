import 'dart:convert';
/// id : ""

HomeResponseEntity homeResponseEntityFromJson(String str) => HomeResponseEntity.fromJson(json.decode(str));
String homeResponseEntityToJson(HomeResponseEntity data) => json.encode(data.toJson());
class HomeResponseEntity {
  HomeResponseEntity({
      String? id,}){
    _id = id;
}

  HomeResponseEntity.fromJson(dynamic json) {
    _id = json['id'];
  }
  String? _id;
HomeResponseEntity copyWith({  String? id,
}) => HomeResponseEntity(  id: id ?? _id,
);
  String? get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    return map;
  }

}