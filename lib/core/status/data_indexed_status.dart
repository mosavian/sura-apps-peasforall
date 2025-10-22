sealed class DataIndexedStatus<T> {
  const DataIndexedStatus({this.index});

  ///index of list view
  final int? index;
}

///initilize
final class InitDataIndexedStatus<T> extends DataIndexedStatus<T> {
  const InitDataIndexedStatus();
}

///loading
final class LoDataIndexedStatus<T> extends DataIndexedStatus<T> {
  const LoDataIndexedStatus({required super.index});
}

///success
final class SuDataIndexedStatus<T> extends DataIndexedStatus<T> {
  const SuDataIndexedStatus(this.data, {required super.index});
  final T data;
}

///error
final class ErDataIndexedStatus<T> extends DataIndexedStatus<T> {
  const ErDataIndexedStatus(this.errorMsg, {required super.index});
  final String errorMsg;
}
