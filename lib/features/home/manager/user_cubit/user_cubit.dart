import 'package:bloc/bloc.dart';
import 'package:deskly_app/features/home/domain/entity/user_entity.dart';
import 'package:deskly_app/features/home/domain/use%20case/fetch_user_data_use_case.dart';
import 'package:meta/meta.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit({required this._fetchUserDataUseCase})
      : super(UserInitial());

  final FetchUserDataUseCase _fetchUserDataUseCase;

  void fetchData() {
    emit(UserLoading());
    _fetchUserDataUseCase.call().listen((result) {
      result.fold(
        (failure) {
          emit(UserError(failure.message));
        },
        (user) {
          emit(UserLoaded(user));
        },
      );
    });
  }
}
