import 'package:deskly_app/features/home/domain/entity/user_entity.dart';
import 'package:hive_ce/hive_ce.dart';

part 'user_cache_model.g.dart';

@HiveType(typeId: 1)
class UserCacheModel extends HiveObject {
  UserCacheModel({
    required this.id,
    required this.name,
    this.imageProfile,
  });

  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String? imageProfile;

  UserEntity toEntity() => UserEntity(
    id: id,
    name: name,
    imageProfile: imageProfile,
  );
}