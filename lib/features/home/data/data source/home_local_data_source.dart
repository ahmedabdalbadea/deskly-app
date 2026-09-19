import 'package:deskly_app/constants.dart';
import 'package:deskly_app/features/home/data/model/category_model/category_cache_model.dart';
import 'package:deskly_app/features/home/data/model/user_model/user_cache_model.dart';
import 'package:deskly_app/features/home/data/model/workspace_model/workspace_cahce_model.dart';
import 'package:hive_ce/hive_ce.dart';

class HomeLocalDataSource {
  static const _userKey = 'current_user';

  Future<void> cachePopularWorkspaces(
    List<WorkspaceCacheModel> workspaces,
  ) async {
    var box = Hive.box<WorkspaceCacheModel>(kPopularWorkspacesBox);
    // We use clear() + addAll() here instead of putAll(id) because a
    // fresh fetch is meant to fully replace the previous result, not
    // merge with it. If an item disappeared from the new fetch (e.g.
    // no longer popular, or removed), clear() makes sure it disappears
    // from the cache too. putAll(id) would only overwrite matching
    // keys and leave stale entries behind.
    await box.clear();
    await box.addAll(workspaces);
  }

  Future<void> cacheNearbyWorkspaces(
    List<WorkspaceCacheModel> workspaces,
  ) async {
    var box = Hive.box<WorkspaceCacheModel>(kNearbyWorkspacesBox);
    // Same reasoning as cachePopularWorkspaces: full replace on every
    // fetch, so clear() + addAll() rather than a keyed put.
    await box.clear();
    await box.addAll(workspaces);
  }

  Future<void> cacheCategories(List<CategoryCacheModel> categories) async {
    var box = Hive.box<CategoryCacheModel>(kCategoriesBox);
    // Categories are a small, fixed set by design (currently 4) — kept
    // as a simple clear() + addAll() like the lists above rather than
    // a keyed putAll(), since there's no per-item update/delete need.
    await box.clear();
    await box.addAll(categories);
  }

  // The user is a single entity, not a list of results to replace on
  // every fetch — we want to overwrite the same record in place, so
  // put() with a fixed key fits here, unlike the list caches above.
  Future<void> cacheUser(UserCacheModel user) async {
    await Hive.box<UserCacheModel>(kUserBox).put(_userKey, user);
  }

  List<WorkspaceCacheModel> getCachedPopularWorkspaces() =>
      Hive.box<WorkspaceCacheModel>(kPopularWorkspacesBox).values.toList();

  List<WorkspaceCacheModel> getCachedNearbyWorkspaces() =>
      Hive.box<WorkspaceCacheModel>(kNearbyWorkspacesBox).values.toList();


  List<CategoryCacheModel> getCachedCategories() =>
      Hive.box<CategoryCacheModel>(kCategoriesBox).values.toList();

  UserCacheModel? getCachedUser() =>
      Hive.box<UserCacheModel>(kUserBox).get(_userKey);
}
