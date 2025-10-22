import '../../../core/entity.dart';

final class TranslatorEntity extends Entity {
  TranslatorEntity({
    required super.id,
    required this.faName,
    required this.arName,
    required this.tblName,
    this.isActive = false,
  });

  final String faName;
  final String arName;
  final String tblName;
  bool isActive;

  factory TranslatorEntity.fromJson(Map<String, dynamic> json) =>
      TranslatorEntity(
        id: json['id'],
        faName: json['fa_name'],
        arName: json['ar_name'],
        tblName: json['tblName'],
      );
}
