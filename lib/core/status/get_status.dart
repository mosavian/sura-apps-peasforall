sealed class GetStatus<T> {
  const GetStatus();
}

///loading
final class LoGetStatus<T> extends GetStatus<T> {
  const LoGetStatus();
}

///success
final class SuGetStatus<T> extends GetStatus<T> {
  const SuGetStatus({required this.items});
  final List<T> items;
}

///error
final class ErGetStatus<T> extends GetStatus<T> {
  const ErGetStatus(this.errorMsg);
  final String errorMsg;
}
