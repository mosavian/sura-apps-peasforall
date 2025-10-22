import '../../../core/entity.dart';

final class QariEntity extends Entity {
  QariEntity({
    required super.id,
    required this.faName,
    required this.arName,
    required this.isAudioTranslation,
    this.isActive = false,
  });

  final String faName;
  final String arName;
  final bool isAudioTranslation;
  bool isActive;

  factory QariEntity.fromJson(Map<String, dynamic> json) => QariEntity(
    id: json['id'],
    faName: json['fa_name'],
    arName: json['ar_name'],
    isAudioTranslation: (json['audio_translation'] as int) == 1,
  );
}
