import 'package:dartz/dartz.dart';
import 'package:deskly_app/core/errors/failure.dart';
import 'package:deskly_app/core/use_case/use_case.dart';
import 'package:deskly_app/features/home/domain/entity/address_entity.dart';
import 'package:deskly_app/features/home/domain/entity/location_entity.dart';
import 'package:deskly_app/features/home/domain/repos/location_repo.dart';

class FetchAddressParams {
  final double latitude;
  final double longitude;

  FetchAddressParams({required this.latitude, required this.longitude});
}

class FetchAddressFromLocation
    implements UseCase<AddressEntity, FetchAddressParams> {
  final LocationRepo _locationRepo;

  FetchAddressFromLocation({required this._locationRepo});
  @override
  Future<Either<Failure, AddressEntity>> call(FetchAddressParams params) async {
    return await _locationRepo.fetchAddressFromLocation(
      latitude: params.latitude,
      longitude: params.longitude,
    );
  }
}
