class CheckVersion {
  late int id;
  late int versionCode;
  late String versionName;
  late String launchDate;
  late int severity;
  late int appType;

  CheckVersion({
    this.id = 0,
    this.versionCode = 0,
    this.versionName = '',
    this.launchDate = '',
    this.severity = 0,
    this.appType = 0,
  });

  CheckVersion.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    versionCode = json['version_code'] ?? 0;
    versionName = json['version_name'] ?? '';
    launchDate = json['launch_date'] ?? '';
    severity = json['severity'] ?? 0;
    appType = json['app_type'] ?? 0;
  }
}
