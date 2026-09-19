import 'package:deskly_app/features/home/data/model/category_model/category_cache_model.dart';
import 'package:deskly_app/features/home/domain/entity/category_entity.dart';

class CategoryModel extends CategoryEntity {
  const CategoryModel({
    required super.id,
    required super.name,
    required super.icon,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'] as String,
      name: json['name'] as String,
      icon: json['icon'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'icon': icon,
    };
  }

  CategoryCacheModel toCacheModel() {
    return CategoryCacheModel(
      id: id,
      name: name,
      icon: icon,
    );
  }
}