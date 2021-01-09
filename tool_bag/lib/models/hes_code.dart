class HesCode {
  int id;
  String hesCode;
  String name;
  String validityDate;

  HesCode({this.hesCode, this.name, this.validityDate});
  HesCode.withId({this.id, this.hesCode, this.name, this.validityDate});

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["hesCode"] = hesCode;
    map["name"] = name;
    map["validityDate"] = validityDate;

    if (id != null) {
      map["id"] = id;
    }

    return map;
  }

  HesCode.fromObject(dynamic o) {
    this.id = int.tryParse(o["id"].toString());
    this.hesCode = o["hesCode"];
    this.name = o["name"];
    this.validityDate = o["validityDate"];
  }
}
