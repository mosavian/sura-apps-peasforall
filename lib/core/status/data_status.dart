abstract class DataStatus<T> {
  const DataStatus();
}

///initilize
final class InitDataStatus<T> extends DataStatus<T> {
  const InitDataStatus();
}

///loading
final class LoDataStatus<T> extends DataStatus<T> {
  const LoDataStatus();
}

///success
final class SuDataStatus<T> extends DataStatus<T> {
  const SuDataStatus(this.data, {this.message});
  final T data;
  final String? message;
}

///error
final class ErDataStatus<T> extends DataStatus<T> {
  const ErDataStatus(this.errorMsg);
  final String errorMsg;
}
