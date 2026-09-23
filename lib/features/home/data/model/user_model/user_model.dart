import 'package:deskly_app/features/home/data/model/user_model/user_cache_model.dart';
import 'package:deskly_app/features/home/domain/entity/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.id,
    required super.name,
    super.imageProfile,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['uId'] as String,
      name: json['name'] as String,
      imageProfile: json['imageProfile'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uId': id,
      'name': name,
      'imageProfile': imageProfile,
    };
  }

  UserCacheModel toCacheModel() => UserCacheModel(
    id: id,
    name: name,
    imageProfile: imageProfile,
  );
}
