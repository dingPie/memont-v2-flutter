import 'dart:ui';

class PaletteDto {
  int id;
  String name;
  String color;

  PaletteDto({
    required this.id,
    required this.name,
    required this.color,
  });

  PaletteDto.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        color = json['color'];

  Map<String, Object?> toJson() {
    return {
      'id': id,
      'name': name,
      'color': color,
    };
  }

  PaletteDto copyWith({
    int? id,
    String? name,
    String? color,
  }) {
    return PaletteDto(
      id: id ?? this.id,
      name: name ?? this.name,
      color: color ?? this.color,
    );
  }

  @override
  String toString() {
    return 'PaletteDto('
        'id: $id, '
        'name: $name, '
        'color: ${color.toString()}'
        ')';
  }

  @override
  bool operator ==(Object other) {
    return other is PaletteDto &&
        id == other.id &&
        name == other.name &&
        color == other.color;
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType,
      id,
      name,
      color,
    );
  }

  get nameLength => name.length;
}
