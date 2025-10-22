sealed class IndexedStatus {
  const IndexedStatus({this.index});

  ///index of list view
  final int? index;
}

///initilize
final class InitIndexedStatus extends IndexedStatus {
  const InitIndexedStatus();
}

///loading
final class LoIndexedStatus extends IndexedStatus {
  const LoIndexedStatus({required super.index});
}

///success
final class SuIndexedStatus extends IndexedStatus {
  const SuIndexedStatus(this.message, {required super.index});
  final String message;
}

///error
final class ErIndexedStatus extends IndexedStatus {
  const ErIndexedStatus(this.errorMsg, {required super.index});
  final String errorMsg;
}
