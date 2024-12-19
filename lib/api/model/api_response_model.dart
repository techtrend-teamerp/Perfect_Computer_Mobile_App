class ApiResponse<T> {
  int status;
  String message;
  T result;

  ApiResponse(
      {required this.status, required this.message, required this.result});

  factory ApiResponse.fromJson(
      Map<String, dynamic> json, T Function(dynamic) fromJsonT) {
    return ApiResponse(
      status: json['Status'] ?? 0,
      message: json['Message'] ?? 'Something went wrong',
      result: (json["Result"] is List)
          ? fromJsonT(json['Result'] ?? [])
          : fromJsonT(json['Result'] ?? ""),
    );
  }
}
