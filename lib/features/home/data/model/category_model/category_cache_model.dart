import 'package:deskly_app/features/home/domain/entity/category_entity.dart';
import 'package:hive_ce/hive_ce.dart';

part 'category_cache_model.g.dart';

@HiveType(typeId: 2)
class CategoryCacheModel extends HiveObject {
  CategoryCacheModel({
    required this.id,
    required this.name,
    required this.icon,
  });

  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String icon;

  CategoryEntity toEntity() {
    return CategoryEntity(id: id, name: name, icon: icon);
  }
}
