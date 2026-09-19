import '../../../core/entity.dart';

final class VerseEntity extends Entity {
  VerseEntity({
    required super.id,
    required this.arabic,
    required this.chapter,
    this.verse,
    this.juz,
    this.hizb,
    this.page,
    this.translate,
  });

  String arabic;
  final int chapter;
  final int? verse;
  final int? juz;
  final int? hizb;
  final int? page;
  String? translate;

  factory VerseEntity.fromJson(Map<String, dynamic> json) => VerseEntity(
    id: json['id'],
    arabic: json['Arabic'],
    chapter: json['Chapter'],
    verse: json['Verse'],
    juz: json['Juz'],
    hizb: json['Hizb'],
    page: json['Page'],
  );
}
