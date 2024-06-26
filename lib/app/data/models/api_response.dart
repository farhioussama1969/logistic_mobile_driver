class ApiResponse {
  int? statusCode;
  dynamic message;
  dynamic body;
  dynamic error;
  RequestStatus? requestStatus;

  ApiResponse({this.statusCode, this.body, this.error, this.message, this.requestStatus});
}

enum RequestStatus {
  success,
  serverError,
  internetError,
  internalError,
  clientError,
}
