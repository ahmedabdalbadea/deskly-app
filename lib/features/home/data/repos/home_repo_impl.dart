import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:deskly_app/core/errors/failure.dart';
import 'package:deskly_app/features/home/data/data%20source/home_local_data_source.dart';
import 'package:deskly_app/features/home/data/data%20source/home_remote_data_source.dart';
import 'package:deskly_app/features/home/data/errors/firestore_failure.dart';
import 'package:deskly_app/features/home/data/model/workspace_model/workspace_model.dart';
import 'package:deskly_app/features/home/domain/entity/category_entity.dart';
import 'package:deskly_app/features/home/domain/entity/user_entity.dart';
import 'package:deskly_app/features/home/domain/entity/workspace_entity.dart';
import 'package:deskly_app/features/home/domain/entity/workspaces_result.dart';
import 'package:deskly_app/features/home/domain/repos/home_repo.dart';
import 'package:geolocator/geolocator.dart';

class HomeRepoImpl implements HomeRepo {
  HomeRepoImpl({
    required this._remoteDataSource,
    required this._localDataSource,
  });

  final HomeRemoteDataSource _remoteDataSource;
  final HomeLocalDataSource _localDataSource;

  @override
  Stream<Either<Failure, List<CategoryEntity>>> fetchCategories() async* {
    try {
      var data = await _remoteDataSource.fetchCategories();

      await _localDataSource.cacheCategories(
        data.map((e) => e.toCacheModel()).toList(),
      );
      // TODO: `data` is List<CategoryModel>, not List<CategoryEntity>.
      // This only works because CategoryModel extends CategoryEntity.
      // CategoryModel has no toEntity() (decided it wasn't needed since
      // it's a direct subclass) — this is the one place still relying
      // on that inheritance instead of an explicit conversion.
      yield right(data);
    } catch (e) {
      yield left(_mapExceptionToFailure(e));
      // Empty-cache guard intentionally NOT applied here — decided to
      // handle "cache is empty" as an explicit `emptyResult` state at
      // the Cubit level instead of guarding every repo method with
      // `if (cachedData.isNotEmpty)`. So this can legitimately yield
      // Right([]) after a Left(failure); that's expected, not a bug.
      var cachedData = _localDataSource.getCachedCategories();
      var cachedDataAsList = cachedData.map((e) => e.toEntity()).toList();
      yield right(cachedDataAsList);
    }
  }

  @override
  Stream<Either<Failure, WorkspacesResult>> fetchPopularWorkspaces({
    Object? startAfter,
    int pageSize = 10,
  }) async* {
    try {
      var data = await _remoteDataSource.fetchPopularWorkspaces(
        startAfter: startAfter as DocumentSnapshot?,
        pageSize: pageSize,
      );
      // Caching intentionally only happens for the first page
      // (startAfter == null). Later pages never overwrite the cache —
      // the cache is meant as an offline fallback for page 1 only.
      if (startAfter == null) {
        await _localDataSource.cachePopularWorkspaces(
          data.workspaces.map((w) => w.toCacheModel()).toList(),
        );
      }
      yield right(
        WorkspacesResult(
          // TODO: same Model-vs-Entity note as above — data.workspaces
          // is List<WorkspaceModel>, relying on WorkspaceModel extends
          // WorkspaceEntity rather than an explicit .toEntity() map.
          workspaces: data.workspaces,
          nextCursor: data.lastDocument,
        ),
      );
    } catch (e) {
      yield left(_mapExceptionToFailure(e));

      // Cache fallback only fires for the first page. A failed later
      // page should NOT silently show page-1 cache data — that would
      // be misleading (user asked for "more", not "page 1 again").
      if (startAfter == null) {
        var cachedData = _localDataSource.getCachedPopularWorkspaces();
        var cachedDataAsList = cachedData.map((e) => e.toEntity()).toList();
        yield right(
          WorkspacesResult(workspaces: cachedDataAsList, nextCursor: null),
        );
      }
    }
  }

  @override
  Stream<Either<Failure, List<WorkspaceEntity>>> fetchNearbyWorkspaces({
    required double latitude,
    required double longitude,
    required double radius,
  }) async* {
    try {
      var data = await _remoteDataSource.fetchAllWorkSpaces();
      // No Firestore-level pagination for nearby: distance isn't a
      // stored field, so it can't be ordered/paginated by Firestore —
      // we fetch everything and filter/sort client-side instead.

      List<({WorkspaceModel workspace, double distance})> nearbyList = [];

      for (WorkspaceModel workspace in data) {
        // Geolocator.distanceBetween (Haversine, real meters) — chosen
        // over a naive Euclidean sqrt() formula, which is inaccurate
        // on a sphere and has no real physical unit.
        double distance = Geolocator.distanceBetween(
          latitude,
          longitude,
          workspace.latitude,
          workspace.longitude,
        );
        if (distance <= radius) {
          nearbyList.add((workspace: workspace, distance: distance));
        }
      }
      nearbyList.sort((a, b) => a.distance.compareTo(b.distance));
      // Only cache the nearest 10 — caching the full nearby list isn't
      // worth it for an offline fallback. The live UI still gets the
      // full sorted/filtered list below.
      await _localDataSource.cacheNearbyWorkspaces(
        nearbyList.take(10).map((e) => e.workspace.toCacheModel()).toList(),
      );
      // TODO: same Model-vs-Entity note — .workspace is WorkspaceModel,
      // not WorkspaceEntity, relying on inheritance again.
      yield right(nearbyList.map((e) => e.workspace).toList());
    } catch (e) {
      yield left(_mapExceptionToFailure(e));

      // Same empty-cache note as fetchCategories: no isNotEmpty guard
      // here by design — handled at the Cubit level instead.
      var cachedData = _localDataSource.getCachedNearbyWorkspaces();
      var cachedDataAsList = cachedData.map((e) => e.toEntity()).toList();
      yield right(cachedDataAsList);
    }
  }

  @override
  Stream<Either<Failure, UserEntity>> fetchUserData() async* {
    try {
      String uId = await _fetchUserUId();
      var data = await _remoteDataSource.fetchUserData(uId: uId);
      await _localDataSource.cacheUser(data.toCacheModel());
      yield right(data);
    } catch (e) {
      yield left(_mapExceptionToFailure(e));

      var cacheData = _localDataSource.getCachedUser();
      if (cacheData != null) {
        yield right(cacheData.toEntity());
      }
    }
  }

  Future<String> _fetchUserUId() async {
    final uId = await _remoteDataSource.fetchUserUId();
    if (uId == null) {
      throw Exception("user not found");
    }
    return uId;
    // Note: no try/catch wrapping the remote call here on purpose —
    // if fetchUserUId() throws a FirebaseException, it must propagate
    // unchanged so the `e is FirebaseException` check in fetchUserData
    // above still works. An earlier version wrapped this in try/catch
    // and rethrew a generic Exception, silently breaking that check.
  }

  @override
  Future<Either<Failure, List<WorkspaceEntity>>> fetchWorkspacesByCategory({
    required String categoryId,
    required double latitude,
    required double longitude,
  }) async {
    // Future, not Stream: unlike the other methods, this one has no
    // local caching at all (deliberate decision), so there's no second
    // value to yield — a single Future is enough.
    // Also: no pagination here — fetches the full category result set,
    // sorts by distance client-side. Acceptable as long as per-category
    // counts stay small; would need the same cursor-pagination treatment
    // as fetchPopularWorkspaces if counts grow large.
    try {
      var data = await _remoteDataSource.fetchWorkspacesByCategory(
        categoryId: categoryId,
        latitude: latitude,
        longitude: longitude,
      );

      List<({WorkspaceModel workspace, double distance})> workspacesList = [];
      for (WorkspaceModel worspace in data) {
        double distance = Geolocator.distanceBetween(
          latitude,
          longitude,
          worspace.latitude,
          worspace.longitude,
        );
        workspacesList.add((workspace: worspace, distance: distance));
      }
      workspacesList.sort((a, b) => a.distance.compareTo(b.distance));
      // TODO: same Model-vs-Entity note as the other methods.
      return right(workspacesList.map((e) => e.workspace).toList());
    } catch (e) {
      return left(_mapExceptionToFailure(e));
    }
  }

  // Centralizes exception → Failure mapping, extracted because the
  // same if/else was duplicated identically in all five methods above —
  // a real risk if a new exception type (e.g. connectivity errors)
  // needs handling later and only gets added in some of the five spots.
  Failure _mapExceptionToFailure(Object e) {
    if (e is FirebaseException) {
      return FirestoreFailure.fromFirebaseException(e);
    }
    return FirestoreFailure("unexpected error occurred");
  }
}