import 'package:dartz/dartz.dart';
import 'package:deskly_app/core/errors/failure.dart';
import 'package:deskly_app/features/home/domain/entity/location_entity.dart';
import 'package:deskly_app/features/home/domain/enums/location_permission_status.dart';
import 'package:deskly_app/features/home/domain/error/location_failure.dart';
import 'package:deskly_app/features/home/domain/repos/location_repo.dart';
import 'package:geolocator/geolocator.dart';

class LocationRepoImpl implements LocationRepo {

  LocationRepoImpl();
  @override
  Future<Either<Failure, LocationEntity>> fetchCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
          timeLimit: Duration(seconds: 10),
        ),
      );
      return right(
        LocationEntity(
          latitude: position.latitude,
          longitude: position.longitude,
        ),
      );
    } on PermissionDeniedException {
      return left(LocationFailure(LocationPermissionStatus.denied));
    } on LocationServiceDisabledException {
      return left(LocationFailure(LocationPermissionStatus.serviceDisabled));
    } catch (_) {
      return left(LocationFailure(LocationPermissionStatus.unknown));
    }
  }

  @override
  Future<LocationPermissionStatus> checkPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    return _mapPermission(permission);
  }

  @override
  Future<LocationPermissionStatus> requestPermission() async {
    LocationPermission permission = await Geolocator.requestPermission();
    return _mapPermission(permission);
  }

  @override
  Future<bool> isLocationServiceEnabled() =>
      Geolocator.isLocationServiceEnabled();

  LocationPermissionStatus _mapPermission(LocationPermission permission) {
    switch (permission) {
      case LocationPermission.always:
      case LocationPermission.whileInUse:
        return LocationPermissionStatus.granted;
      case LocationPermission.deniedForever:
        return LocationPermissionStatus.deniedForever;
      case LocationPermission.denied:
      case LocationPermission.unableToDetermine:
        return LocationPermissionStatus.denied;
    }
  }
}
