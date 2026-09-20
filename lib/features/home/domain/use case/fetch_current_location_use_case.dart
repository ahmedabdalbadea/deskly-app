import 'package:dartz/dartz.dart';
import 'package:deskly_app/core/errors/failure.dart';
import 'package:deskly_app/core/use_case/no_param_use_case.dart';
import 'package:deskly_app/features/home/domain/entity/location_entity.dart';
import 'package:deskly_app/features/home/domain/enums/location_permission_status.dart';
import 'package:deskly_app/features/home/domain/error/location_failure.dart';
import 'package:deskly_app/features/home/domain/repos/location_repo.dart';

class FetchCurrentLocationUseCase implements UseCase<LocationEntity> {
  final LocationRepo locationRepo;

  FetchCurrentLocationUseCase({required this.locationRepo});

  @override
  Future<Either<Failure, LocationEntity>> call() async {
    final isServiceEnabled = await locationRepo.isLocationServiceEnabled();
    if (!isServiceEnabled) {
      return left(LocationFailure(LocationPermissionStatus.serviceDisabled));
    }
    var status = await locationRepo.checkPermission();
    if (status == LocationPermissionStatus.denied) {
      status = await locationRepo.requestPermission();
    }

    if (status != LocationPermissionStatus.granted) {
      return left(LocationFailure(status));
    }
    return locationRepo.fetchCurrentLocation();
  }
}
