/// __typename : "Query"
/// resendVerificationCode : true

class ResendVerificationResponse {
  String _typename;
  bool _resendVerificationCode;

  String get typename => _typename;
  bool get resendVerificationCode => _resendVerificationCode;

  ResendVerificationResponse({String typename, bool resendVerificationCode}) {
    _typename = typename;
    _resendVerificationCode = resendVerificationCode;
  }

  ResendVerificationResponse.fromJson(dynamic json) {
    _typename = json["__typename"];
    _resendVerificationCode = json["resendVerificationCode"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["__typename"] = _typename;
    map["resendVerificationCode"] = _resendVerificationCode;
    return map;
  }
}
