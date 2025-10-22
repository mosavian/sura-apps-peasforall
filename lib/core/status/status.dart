sealed class Status {
  const Status();
}

final class InitStatus extends Status {
  const InitStatus();
}

final class LoStatus extends Status {
  const LoStatus();
}

final class SuStatus extends Status {
  const SuStatus(this.msg);
  final String msg;
}

final class ErStatus extends Status {
  const ErStatus(this.errorMsg, {this.statusCode = 400});
  final String errorMsg;
  final int statusCode;
}
