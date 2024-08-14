class HttpResponseError extends Error {
  int code;
  String message;

  HttpResponseError(this.code, this.message);
}
