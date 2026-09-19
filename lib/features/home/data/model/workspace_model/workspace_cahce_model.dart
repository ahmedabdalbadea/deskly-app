import 'package:deskly_app/features/home/domain/entity/workspace_entity.dart';
import 'package:hive_ce/hive_ce.dart';

part 'workspace_cahce_model.g.dart';

@HiveType(typeId: 0)
class WorkspaceCacheModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String address;

  @HiveField(3)
  final String image;

  @HiveField(4)
  final double rating;

  @HiveField(5)
  final double price;

  @HiveField(6)
  final String priceUnit;

  @HiveField(7)
  final int reviewsCount;

  @HiveField(8)
  final double latitude;

  @HiveField(9)
  final double longitude;

  WorkspaceCacheModel({
    required this.id,
    required this.name,
    required this.address,
    required this.price,
    this.priceUnit = 'hr',
    required this.reviewsCount,
    required this.latitude,
    required this.longitude,
    required this.image,
    required this.rating,
  });

  factory WorkspaceCacheModel.fromJson(Map<String, dynamic> json) {
    return WorkspaceCacheModel(
      id: json['id'] as String,
      name: json['name'] as String,
      address: json['address'] as String,
      price: (json['price'] as num).toDouble(),
      priceUnit: json['priceUnit'] as String? ?? 'hr',
      reviewsCount: (json['reviewsCount'] as num).toInt(),
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      image: json['image'] as String,
      rating: (json['rating'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'address': address,
      'price': price,
      'priceUnit': priceUnit,
      'reviewsCount': reviewsCount,
      'latitude': latitude,
      'longitude': longitude,
      'image': image,
      'rating': rating,
    };
  }

  WorkspaceEntity toEntity() {
    return WorkspaceEntity(
      id: id,
      name: name,
      address: address,
      price: price,
      priceUnit: priceUnit,
      rating: rating,
      reviewsCount: reviewsCount,
      latitude: latitude,
      longitude: longitude,
      images: [image],
      type: "",
    );
  }
}
