import 'package:bloc/bloc.dart';
import 'package:deskly_app/features/home/domain/entity/address_entity.dart';
import 'package:deskly_app/features/home/domain/use%20case/fetch_address_from_location.dart';
import 'package:meta/meta.dart';

part 'address_state.dart';

class AddressCubit extends Cubit<AddressState> {
  AddressCubit({required this._fetchAddressUseCase}) : super(AddressInitial());

  final FetchAddressFromLocation _fetchAddressUseCase;

  Future<void> fetchAddress({required double lat, required double lng}) async {
    emit(AddressLoading());
    final result = await _fetchAddressUseCase(
      FetchAddressParams(latitude: lat, longitude: lng),
    );
    result.fold(
      (failure) => emit(AddressError(failure.message)),
      (address) => emit(AddressLoaded(address)),
    );
  }
}
