import 'package:deskly_app/core/errors/failure.dart';
import 'package:deskly_app/features/home/domain/enums/location_permission_status.dart';

class LocationFailure extends Failure {
  final LocationPermissionStatus status;

  LocationFailure(this.status) : super(_messageFor(status));

  static String _messageFor(
    LocationPermissionStatus status,
  ) => switch (status) {
    LocationPermissionStatus.serviceDisabled =>
      'Location services are turned off. Please enable GPS from your device settings.',
    LocationPermissionStatus.denied =>
      'Location permission was denied. Please allow location access to see workspaces near you.',
    LocationPermissionStatus.deniedForever =>
      'Location permission is permanently denied. Please enable it for Deskly from your app settings.',
    LocationPermissionStatus.granted || LocationPermissionStatus.unknown =>
      'Unable to get your location. Please try again later.',
  };
}
