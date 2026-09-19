import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deskly_app/features/home/data/model/amenity_model.dart';
import 'package:deskly_app/features/home/data/model/workspace_model/workspace_cahce_model.dart';
import 'package:deskly_app/features/home/domain/entity/workspace_entity.dart';

class WorkspaceModel extends WorkspaceEntity {
  const WorkspaceModel({
    required super.id,
    required super.name,
    required super.address,
    required super.price,
    super.priceUnit = 'hr',
    required super.rating,
    required super.reviewsCount,
    required super.type,
    super.description,
    super.images = const [],
    super.isOpen = true,
    super.isFavorite = false,
    super.amenities = const [],
    super.services = const [],
    super.availableTimes = const [],
    required super.latitude,
    required super.longitude,
  });

  factory WorkspaceModel.fromJson(Map<String, dynamic> json) {
    final geoPoint = json['location'] as GeoPoint;

    return WorkspaceModel(
      id: json['id'] as String,
      name: json['name'] as String,
      address: json['address'] as String,
      price: (json['price'] as num).toDouble(),
      priceUnit: json['priceUnit'] as String? ?? 'hr',
      rating: (json['rating'] as num).toDouble(),
      reviewsCount: (json['reviewsCount'] as num).toInt(),
      type: json['type'] as String,
      description: json['description'] as String?,
      images:
          (json['images'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      isOpen: json['isOpen'] as bool? ?? true,
      isFavorite: json['isFavorite'] as bool? ?? false,
      amenities:
          (json['amenities'] as List<dynamic>?)
              ?.map((e) => AmenityModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      services:
          (json['services'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      availableTimes:
          (json['availableTimes'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      latitude: geoPoint.latitude,
      longitude: geoPoint.longitude,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'address': address,
      'price': price,
      'priceUnit': priceUnit,
      'rating': rating,
      'reviewsCount': reviewsCount,
      'type': type,
      'description': description,
      'images': images,
      'isOpen': isOpen,
      'isFavorite': isFavorite,
      'amenities': amenities
          .map(
            (e) => e is AmenityModel
                ? e.toJson()
                : {'id': e.id, 'label': e.label, 'icon': e.icon},
          )
          .toList(),
      'services': services,
      'availableTimes': availableTimes,
      'location': GeoPoint(latitude, longitude),
    };
  }

  WorkspaceCacheModel toCacheModel() {
    return WorkspaceCacheModel(
      id: id,
      name: name,
      address: address,
      price: price,
      priceUnit: priceUnit,
      rating: rating,
      reviewsCount: reviewsCount,
      latitude: latitude,
      longitude: longitude,
      image: images.first,
    );
  }
}
