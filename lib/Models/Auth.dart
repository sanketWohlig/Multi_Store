class LoginRequest {
  Auth0? auth0;
  String? type;

  LoginRequest({this.auth0, this.type});

  LoginRequest.fromJson(Map<String, dynamic> json) {
    auth0 = json['auth0'] != null ? new Auth0.fromJson(json['auth0']) : null;
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.auth0 != null) {
      data['auth0'] = this.auth0!.toJson();
    }
    data['type'] = this.type;
    return data;
  }
}

class Auth0 {
  String? name;
  String? email;
  String? id;

  Auth0({this.name, this.email, this.id});

  Auth0.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['id'] = this.id;
    return data;
  }
}