/// __typename : "Mutation"
/// register : {"__typename":"UserRO","user":{"__typename":"User","_id":"608aeda720aead00156962fc","username":"qwerty","phonenumber":"07013024711","email":"hghghg@gmail.com"},"token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2MDhhZWRhNzIwYWVhZDAwMTU2OTYyZmMiLCJpYXQiOjE2MTk3MTc1NDMsImV4cCI6MTYxOTgwMzk0M30.ZVDe_Z3J7Pf95WsSBEuDe5OTDMR-Caee4e0znjNzHhw"}

class SignUpResponse {
  String _typename;
  Register _register;

  String get typename => _typename;
  Register get register => _register;

  SignUpResponse({String typename, Register register}) {
    _typename = typename;
    _register = register;
  }

  SignUpResponse.fromJson(dynamic json) {
    _typename = json["__typename"];
    _register =
        json["register"] != null ? Register.fromJson(json["register"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["__typename"] = _typename;
    if (_register != null) {
      map["register"] = _register.toJson();
    }
    return map;
  }
}

/// __typename : "UserRO"
/// user : {"__typename":"User","_id":"608aeda720aead00156962fc","username":"qwerty","phonenumber":"07013024711","email":"hghghg@gmail.com"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2MDhhZWRhNzIwYWVhZDAwMTU2OTYyZmMiLCJpYXQiOjE2MTk3MTc1NDMsImV4cCI6MTYxOTgwMzk0M30.ZVDe_Z3J7Pf95WsSBEuDe5OTDMR-Caee4e0znjNzHhw"

class Register {
  String _typename;
  User _user;
  String _token;

  String get typename => _typename;
  User get user => _user;
  String get token => _token;

  Register({String typename, User user, String token}) {
    _typename = typename;
    _user = user;
    _token = token;
  }

  Register.fromJson(dynamic json) {
    _typename = json["__typename"];
    _user = json["user"] != null ? User.fromJson(json["user"]) : null;
    _token = json["token"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["__typename"] = _typename;
    if (_user != null) {
      map["user"] = _user.toJson();
    }
    map["token"] = _token;
    return map;
  }
}

/// __typename : "User"
/// _id : "608aeda720aead00156962fc"
/// username : "qwerty"
/// phonenumber : "07013024711"
/// email : "hghghg@gmail.com"

class User {
  String _typename;
  String _id;
  String _username;
  String _phonenumber;
  String _email;

  String get typename => _typename;
  String get id => _id;
  String get username => _username;
  String get phonenumber => _phonenumber;
  String get email => _email;

  User(
      {String typename,
      String id,
      String username,
      String phonenumber,
      String email}) {
    _typename = typename;
    _id = id;
    _username = username;
    _phonenumber = phonenumber;
    _email = email;
  }

  User.fromJson(dynamic json) {
    _typename = json["__typename"];
    _id = json["_id"];
    _username = json["username"];
    _phonenumber = json["phonenumber"];
    _email = json["email"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["__typename"] = _typename;
    map["_id"] = _id;
    map["username"] = _username;
    map["phonenumber"] = _phonenumber;
    map["email"] = _email;
    return map;
  }
}
