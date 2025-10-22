List<T> entityListFromJson<T extends Entity>(
  dynamic data,
  T Function(Map<String, dynamic>) fromJson,
) => List<T>.from(data.map((x) => fromJson(x)));

abstract class Entity {
  const Entity({required this.id});

  final int id;
}
