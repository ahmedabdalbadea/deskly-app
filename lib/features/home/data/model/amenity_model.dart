import 'package:deskly_app/features/home/domain/entity/amenity_entity.dart';

class AmenityModel extends AmenityEntity {
  const AmenityModel({
    required super.id,
    required super.label,
    required super.icon,
  });

  factory AmenityModel.fromJson(Map<String, dynamic> json) {
    return AmenityModel(
      id: json['id'] as String,
      label: json['label'] as String,
      icon: json['icon'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'label': label,
      'icon': icon,
    };
  }
}
