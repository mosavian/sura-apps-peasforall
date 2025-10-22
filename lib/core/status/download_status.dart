sealed class DownloadStatus {
  const DownloadStatus();
}

final class InitDownloadStatus extends DownloadStatus {
  const InitDownloadStatus();
}

///loading
final class LoDownloadStatus extends DownloadStatus {
  const LoDownloadStatus({this.progress});

  final double? progress;
}

///success
final class SuDownloadStatus extends DownloadStatus {
  const SuDownloadStatus({this.message});
  final String? message;
}

final class ErDownloadStatus extends DownloadStatus {
  const ErDownloadStatus(this.errorMsg);
  final String errorMsg;
}
