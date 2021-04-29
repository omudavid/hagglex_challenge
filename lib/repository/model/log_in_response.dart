/// __typename : "Mutation"
/// login : {"__typename":"LoginRO","user":{"__typename":"User","_id":"6082eb94cdcc460015af1f76","email":"izundukingsleyemeka@gmail.com","role":{"__typename":"Role","role":"user","description":"The normal user...."}},"token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2MDgyZWI5NGNkY2M0NjAwMTVhZjFmNzYiLCJpYXQiOjE2MTk3MTAxMTcsImV4cCI6MTYxOTc5NjUxN30.wYl0W2w7HqA9AwR9psHu8EdAHeBAQvYNlCuOymcDnOY","twoFactorAuth":"null"}

class LogInResponse {
  String _typename;
  Login _login;

  String get typename => _typename;
  Login get login => _login;

  LogInResponse({String typename, Login login}) {
    _typename = typename;
    _login = login;
  }

  LogInResponse.fromJson(dynamic json) {
    _typename = json["__typename"];
    _login = json["login"] != null ? Login.fromJson(json["login"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["__typename"] = _typename;
    if (_login != null) {
      map["login"] = _login.toJson();
    }
    return map;
  }
}

/// __typename : "LoginRO"
/// user : {"__typename":"User","_id":"6082eb94cdcc460015af1f76","email":"izundukingsleyemeka@gmail.com","role":{"__typename":"Role","role":"user","description":"The normal user...."}}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2MDgyZWI5NGNkY2M0NjAwMTVhZjFmNzYiLCJpYXQiOjE2MTk3MTAxMTcsImV4cCI6MTYxOTc5NjUxN30.wYl0W2w7HqA9AwR9psHu8EdAHeBAQvYNlCuOymcDnOY"
/// twoFactorAuth : "null"

class Login {
  String _typename;
  User _user;
  String _token;
  String _twoFactorAuth;

  String get typename => _typename;
  User get user => _user;
  String get token => _token;
  String get twoFactorAuth => _twoFactorAuth;

  Login({String typename, User user, String token, String twoFactorAuth}) {
    _typename = typename;
    _user = user;
    _token = token;
    _twoFactorAuth = twoFactorAuth;
  }

  Login.fromJson(dynamic json) {
    _typename = json["__typename"];
    _user = json["user"] != null ? User.fromJson(json["user"]) : null;
    _token = json["token"];
    _twoFactorAuth = json["twoFactorAuth"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["__typename"] = _typename;
    if (_user != null) {
      map["user"] = _user.toJson();
    }
    map["token"] = _token;
    map["twoFactorAuth"] = _twoFactorAuth;
    return map;
  }
}

/// __typename : "User"
/// _id : "6082eb94cdcc460015af1f76"
/// email : "izundukingsleyemeka@gmail.com"
/// role : {"__typename":"Role","role":"user","description":"The normal user...."}

class User {
  String _typename;
  String _id;
  String _email;
  Role _role;

  String get typename => _typename;
  String get id => _id;
  String get email => _email;
  Role get role => _role;

  User({String typename, String id, String email, Role role}) {
    _typename = typename;
    _id = id;
    _email = email;
    _role = role;
  }

  User.fromJson(dynamic json) {
    _typename = json["__typename"];
    _id = json["_id"];
    _email = json["email"];
    _role = json["role"] != null ? Role.fromJson(json["role"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["__typename"] = _typename;
    map["_id"] = _id;
    map["email"] = _email;
    if (_role != null) {
      map["role"] = _role.toJson();
    }
    return map;
  }
}

/// __typename : "Role"
/// role : "user"
/// description : "The normal user...."

class Role {
  String _typename;
  String _role;
  String _description;

  String get typename => _typename;
  String get role => _role;
  String get description => _description;

  Role({String typename, String role, String description}) {
    _typename = typename;
    _role = role;
    _description = description;
  }

  Role.fromJson(dynamic json) {
    _typename = json["__typename"];
    _role = json["role"];
    _description = json["description"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["__typename"] = _typename;
    map["role"] = _role;
    map["description"] = _description;
    return map;
  }
}
