import 'dart:ui';

class Palette {
  int id;
  String name;
  Color color;

  Palette({
    required this.id,
    required this.name,
    required this.color,
  });

  Palette.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        color = Color(int.parse('0xFF${(json['color']).split('#')[1]}'));

  Map<String, Object?> toJson() {
    return {
      'id': id,
      'name': name,
      'color': color,
    };
  }

  Palette copyWith({
    int? id,
    String? name,
    Color? color,
  }) {
    return Palette(
      id: id ?? this.id,
      name: name ?? this.name,
      color: color ?? this.color,
    );
  }

  @override
  String toString() {
    return 'Palette('
        'id: $id, '
        'name: $name, '
        'color: ${color.toString()}'
        ')';
  }

  @override
  bool operator ==(Object other) {
    return other is Palette &&
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
