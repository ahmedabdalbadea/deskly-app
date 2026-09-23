import 'package:bloc/bloc.dart';
import 'package:deskly_app/features/home/domain/entity/category_entity.dart';
import 'package:deskly_app/features/home/domain/use%20case/fetch_categories_use_case.dart';
import 'package:meta/meta.dart';

part 'categoires_state.dart';

class CategoiresCubit extends Cubit<CategoiresState> {
  CategoiresCubit({required this._fetchCategoriesUseCase})
    : super(CategoiresInitial());

  final FetchCategoriesUseCase _fetchCategoriesUseCase;

  void fetchCategories(){
    emit(CategoriesLoading());
    _fetchCategoriesUseCase.call().listen((event) {
      event.fold((failure) {
        emit(CategoriesError(failure.message));
      }, (categories) {
        if(categories.isEmpty){
          emit(CategoriesEmptyResult());
        }else{
          emit(CategoriesLoaded(categories));
        }
        
      });
    });
  }
}
