class ApiUrls {
  /// Swagger URL
  /// https://api.dummy.in/swagger/index.html
  // TODO Local
  static const String baseUrl = 'https://api.dummy.in/';

  //common header for json/application type
  static const Map<String, String> header = {
    'Accept': 'application/json',
    'Content-Type':
        'application/x-www-form-urlencoded' //'Content-Type': 'application/json'
  };

  //terms and conditions and privacy policy
  static const String termsAndConditionUrl = "https://www.google.com/";
  static const String privacyPolicyUrl = "https://www.google.com/";
}
