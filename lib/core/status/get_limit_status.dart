import '../entity.dart';

sealed class GetLimitStatus<T extends Entity> {
  const GetLimitStatus();
}

///loading
final class LoGetLimitStatus<T extends Entity> extends GetLimitStatus<T> {
  const LoGetLimitStatus();
}

///success
final class SuGetLimitStatus<T extends Entity> extends GetLimitStatus<T> {
  const SuGetLimitStatus(this.items, this.isComplated);
  final List<T> items;
  final bool isComplated;
}

///error
final class ErGetLimitStatus<T extends Entity> extends GetLimitStatus<T> {
  const ErGetLimitStatus(this.errorMsg);
  final String errorMsg;
}
