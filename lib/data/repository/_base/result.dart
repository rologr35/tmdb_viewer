abstract class Result<T> {
  static ResultSuccess<T> success<T>({
    required T value,
    bool hostUnable = false,
  }) =>
      ResultSuccess(
        value: value,
        hostUnable: hostUnable,
      );

  static ResultError<T> error<T>({
    required dynamic error,
    required int code
  }) =>
      ResultError(
        error: error,
        code: code
      );
}

class ResultSuccess<T> extends Result<T> {
  final T value;
  bool hostUnable = false;

  ResultSuccess({
    required this.value,
    this.hostUnable = false,
  });
}

class ResultError<T> extends Result<T> {
  final dynamic error;
  final int code;

  ResultError({
    required this.error,
    required this.code
  });
}
