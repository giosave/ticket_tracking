class ServicesResponse<T> {
  final int httpStatusCode;
  final bool isSuccess;
  final String message;
  final T? data;

  ServicesResponse({
    required this.httpStatusCode,
    required this.isSuccess,
    required this.message,
    this.data,
  });

  factory ServicesResponse.fromJson(Map<String, dynamic> json, T Function(Object? json) fromJsonT) {
    return ServicesResponse<T>(
      httpStatusCode: json['HTTPStatusCode'],
      isSuccess: json['IsSuccess'],
      message: json['Message'],
      data: json['Data'] != null ? fromJsonT(json['Data']) : null,
    );
  }

  Map<String, dynamic> toJson(Map<String, dynamic> Function(T value) toJsonT) {
    return {
      'HTTPStatusCode': httpStatusCode,
      'IsSuccess': isSuccess,
      'Message': message,
      'Data': data != null ? toJsonT(data!) : null,
    };
  }
}
