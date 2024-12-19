class CommonInsertModel {
  late int _status;
  late String _message;

  int get status => _status;

  String get message => _message;

  CommonInsertModel.fromJson(Map<String, dynamic> json) {
    _status = json['status'];
    _message = json['message'];
  }
}
