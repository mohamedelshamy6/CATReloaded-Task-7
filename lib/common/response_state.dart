class ResponseState<T> {
  final int statusCode;
  final T? data;
  final String message;

  ResponseState({
    this.data,
    required this.statusCode,
    this.message = '',
  });

  factory ResponseState.error() {
    return ResponseState(statusCode: -1, message: 'Error has occurred',data: null);
  }

  factory ResponseState.networkError() {
    return ResponseState(
        statusCode: -1, message: 'Please check your internet connection',data: null);
  }
}
