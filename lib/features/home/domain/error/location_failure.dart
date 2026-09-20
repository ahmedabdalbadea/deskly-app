import 'package:deskly_app/core/errors/failure.dart';
import 'package:deskly_app/features/home/domain/enums/location_permission_status.dart';

class LocationFailure extends Failure {
  final LocationPermissionStatus status;

  LocationFailure(this.status) : super(_messageFor(status));

  static String _messageFor(LocationPermissionStatus status) => switch (status) {
    LocationPermissionStatus.serviceDisabled => 'Location service is disabled',
    LocationPermissionStatus.denied => 'Location permission denied',
    LocationPermissionStatus.deniedForever =>
      'Location permission permanently denied',
    LocationPermissionStatus.granted => 'Could not get location',
    LocationPermissionStatus.unknown => 'Could not get location',
  };
}