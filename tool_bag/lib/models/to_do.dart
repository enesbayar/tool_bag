import 'base_model.dart';

class ToDo extends BaseModel {
  ToDo({this.id, this.description, this.isDone});

  int id;
  String description;
  bool isDone = false;

  factory ToDo.fromObject(Map<String, Object> o) => ToDo(
        id: o["id"] == null ? null : int.tryParse(o["id"].toString()),
        description: o["description"] == null ? null : o["description"],
        isDone: o["isDone"] == null
            ? null
            : o["isDone"] == 1
                ? true
                : false,
      );

  @override
  fromJson(Map<String, Object> json) {
    return ToDo.fromObject(json);
  }

  @override
  Map<String, Object> toJson() {
    var map = Map<String, dynamic>();
    map["description"] = description;
    map["isDone"] = isDone == true ? 1 : 0;

    if (id != null) {
      map["id"] = id;
    }

    return map;
  }
}
