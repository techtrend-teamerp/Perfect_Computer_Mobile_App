class LoginModel {
  late int _status;
  late String _message;
  late List<Result> _result;

  int get status => _status;

  String get message => _message;

  List<Result> get result => _result;

  LoginModel.fromJson(Map<String, dynamic> json) {
    _status = json['status'];
    _message = json['message'];
    if (json['result'] != null) {
      _result = <Result>[];
      json['result'].forEach((v) {
        _result.add(Result.fromJson(v));
      });
    }
  }
}

class Result {
  late int _userId;
  late String _username;
  late String _fullName;
  late String _email;
  late String _phoneNumber;
  late String _createdAt;

  int get userId => _userId;

  String get username => _username;

  String get fullName => _fullName;

  String get email => _email;

  String get phoneNumber => _phoneNumber;

  String get createdAt => _createdAt;

  Result.fromJson(Map<String, dynamic> json) {
    _userId = json['user_id'];
    _username = json['username'];
    _fullName = json['full_name'];
    _email = json['email'];
    _phoneNumber = json['phone_number'];
    _createdAt = json['created_at'];
  }
}
