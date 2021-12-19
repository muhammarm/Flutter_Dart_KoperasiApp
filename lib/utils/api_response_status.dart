enum ApiResponseStatus { SUCCESS, ERROR }

extension ParseToString on ApiResponseStatus {
  String toShortString() {
    return toString().split('.').last;
  }
}
