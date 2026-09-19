import 'package:deskly_app/constants.dart';
import 'package:deskly_app/features/home/data/model/category_model/category_cache_model.dart';
import 'package:deskly_app/features/home/data/model/user_model/user_cache_model.dart';
import 'package:deskly_app/features/home/data/model/workspace_model/workspace_cahce_model.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:deskly_app/hive_registrar.g.dart';

Future<void> initHive() async {
  await Hive.initFlutter();
  Hive.registerAdapters();
  await Hive.openBox<WorkspaceCacheModel>(kPopularWorkspacesBox);
  await Hive.openBox<WorkspaceCacheModel>(kNearbyWorkspacesBox);
  await Hive.openBox<CategoryCacheModel>(kCategoriesBox);
  await Hive.openBox<UserCacheModel>(kUserBox);
}
