import 'base_model.dart';

class HesCode extends BaseModel {
  int id;
  String hesCode;
  String name;
  String validityDate;

  HesCode({this.id, this.hesCode, this.name, this.validityDate});

  factory HesCode.fromJson(Map<String, Object> o) => HesCode(
      id: o["id"] == null ? null : int.tryParse(o["id"].toString()),
      hesCode: o["hesCode"] == null ? null : o["hesCode"],
      name: o["name"] == null ? null : o["name"],
      validityDate: o["validityDate"] == null ? null : o["validityDate"]);

  @override
  fromJson(Map<String, Object> json) {
    HesCode.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    var map = Map<String, dynamic>();
    map["hesCode"] = hesCode;
    map["name"] = name;
    map["validityDate"] = validityDate;

    if (id != null) {
      map["id"] = id;
    }

    return map;
  }
}
