import 'amenity_entity.dart';

class WorkspaceEntity {
  final String id;
  final String name;
  final String address;
  final double price;
  final String priceUnit;
  final double rating;
  final int reviewsCount;
  final String type;
  final String? description;
  final List<String> images;
  final bool isOpen;
  final bool isFavorite;
  final List<AmenityEntity> amenities;
  final List<String> services;
  final List<String> availableTimes;
  final double latitude;
  final double longitude;

  const WorkspaceEntity({
    required this.id,
    required this.name,
    required this.address,
    required this.price,
    this.priceUnit = 'hr',
    required this.rating,
    required this.reviewsCount,
    required this.type,
    this.description,
    this.images = const [],
    this.isOpen = true,
    this.isFavorite = false,
    this.amenities = const [],
    this.services = const [],
    this.availableTimes = const [],
    required this.latitude,
    required this.longitude,
  });
}
