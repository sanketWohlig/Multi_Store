class User {
  String? name;
  String? email;
  String? id;

  User({required this.name,required this.email,required this.id});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['id'] = id;
    return data;
  }
}