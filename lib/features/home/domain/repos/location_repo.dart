import 'package:dartz/dartz.dart';
import 'package:deskly_app/core/errors/failure.dart';
import 'package:deskly_app/features/home/domain/entity/address_entity.dart';
import 'package:deskly_app/features/home/domain/entity/location_entity.dart';
import 'package:deskly_app/features/home/domain/enums/location_permission_status.dart';

abstract class LocationRepo {
  Future<bool> isLocationServiceEnabled();
  Future<LocationPermissionStatus> checkPermission();
  Future<LocationPermissionStatus> requestPermission();
  Future<Either<Failure, LocationEntity>> fetchCurrentLocation();

  Future<Either<Failure, AddressEntity>> fetchAddressFromLocation({
    required double latitude,
    required double longitude,
  });
}
