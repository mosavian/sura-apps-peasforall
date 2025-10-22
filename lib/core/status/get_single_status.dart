sealed class GetSingleStatus<T> {
  const GetSingleStatus({this.statusCode});

  final int? statusCode;
}

///loading
final class LoGetSingleStatus<T> extends GetSingleStatus<T> {
  const LoGetSingleStatus();
}

///success
final class SuGetSingleStatus<T> extends GetSingleStatus<T> {
  const SuGetSingleStatus(this.data) : super(statusCode: 200);
  final T data;
}

///error
final class ErGetSingleStatus<T> extends GetSingleStatus<T> {
  const ErGetSingleStatus(this.errorMsg, {super.statusCode = 400});
  final String errorMsg;
}
