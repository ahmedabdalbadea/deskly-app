part of 'location_cubit.dart';

@immutable
sealed class LocationState {}

final class LocationInitial extends LocationState {}

class LocationChecking extends LocationState {}

class LocationReady extends LocationState {}

class LocationNotReady extends LocationState {
  final String message;
  LocationNotReady(this.message);
}
