class TodoModel {
  int? id;
  String? task;
  String? description;
  bool? state;

  TodoModel({this.id, this.task, this.description, this.state});

  TodoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    task = json['task'];
    description = json['description'];
    state = json['state'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['task'] = task;
    data['description'] = description;
    data['state'] = state;
    return data;
  }
}
