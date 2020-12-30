class ToDo{

  int id;
  String description;
  bool isDone = false;

  ToDo({this.description});
  ToDo.withId({this.id, this.description});

  Map<String,dynamic> toMap(){
    var map = Map<String,dynamic>();
    map["description"] = description;
    map["isDone"] = isDone == true ? 1 : 0;

    if(id!=null){
      map["id"] = id;

    } 

    return map;
  }

  ToDo.fromObject(dynamic o ){
    this.id = int.tryParse(o["id"].toString());
    this.description = o["description"];
    this.isDone = o["isDone"] == 1 ? true: false;
  }
  
}