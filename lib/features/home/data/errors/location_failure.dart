import 'package:deskly_app/core/errors/failure.dart';
import 'package:deskly_app/features/home/domain/enums/location_permission_status.dart';

class LocationFailure extends Failure {
  const LocationFailure(super.message);

  factory LocationFailure.fromPermissionStatus(
    LocationPermissionStatus status,
  ) {
    switch (status) {
      case LocationPermissionStatus.serviceDisabled:
        return const LocationFailure(
          'Location services are turned off. Please enable GPS from your device settings.',
        );
      case LocationPermissionStatus.denied:
        return const LocationFailure(
          'Location permission was denied. Please allow location access to see workspaces near you.',
        );
      case LocationPermissionStatus.deniedForever:
        return const LocationFailure(
          'Location permission is permanently denied. Please enable it for Deskly from your app settings.',
        );
      case LocationPermissionStatus.granted:
      case LocationPermissionStatus.unknown:
        return const LocationFailure(
          'Unable to get your location. Please try again later.',
        );
    }
  }
}
