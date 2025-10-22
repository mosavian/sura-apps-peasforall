import 'request.dart';

class LoadLimitReq extends Request {
  const LoadLimitReq({this.offset = 0, this.limit = 100});
  final int offset;
  final int limit;

  @override
  Map<String, dynamic> toMap() => {'offset': offset, 'limit': limit};
}
