class ToDo{

  int id;
  String description;
  bool isDone;

  ToDo({this.description, this.isDone});
  ToDo.withId({this.id, this.description, this.isDone});

  Map<String,dynamic> toMap(){
    var map = Map<String,dynamic>();
    map["description"] = description;
    map["isDone"] = isDone;

    if(id!=null){
      map["id"] = id;

    } 

    return map;
  }

  ToDo.fromObject(dynamic o ){
    this.id = int.tryParse(o["id"].toString());
    this.description = o["description"];
    this.isDone = o["unitPrice"];
  }
  
}