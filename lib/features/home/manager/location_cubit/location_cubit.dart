import 'package:bloc/bloc.dart';
import 'package:deskly_app/features/home/domain/use%20case/fetch_current_location_use_case.dart';
import 'package:meta/meta.dart';
part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit({required this._fetchCurrentLocationUseCase})
    : super(LocationInitial());
  final FetchCurrentLocationUseCase _fetchCurrentLocationUseCase;
  Future<void> checkLocationReadiness() async {
    emit(LocationChecking());

    var result = await _fetchCurrentLocationUseCase.call();

    result.fold(
      (failure) {
        emit(LocationNotReady(failure.message));
      },
      (_) {
        emit(LocationReady());
      },
    );
  }
}
