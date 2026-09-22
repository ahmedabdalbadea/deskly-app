part of 'address_cubit.dart';

@immutable
sealed class AddressState {}

final class AddressInitial extends AddressState {}

final class AddressLoading extends AddressState {}

final class AddressLoaded extends AddressState {
  final AddressEntity address;

  AddressLoaded(this.address);
}

final class AddressError extends AddressState {
  final String message;

  AddressError(this.message);
}
