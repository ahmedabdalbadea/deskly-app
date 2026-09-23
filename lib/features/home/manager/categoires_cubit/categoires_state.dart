part of 'categoires_cubit.dart';

@immutable
sealed class CategoiresState {}

final class CategoiresInitial extends CategoiresState {}

final class CategoriesLoading extends CategoiresState {}

final class CategoriesEmptyResult extends CategoiresState {}

final class CategoriesLoaded extends CategoiresState {
  final List<CategoryEntity> categories;

  CategoriesLoaded(this.categories);
}

final class CategoriesError extends CategoiresState {
  final String message;

  CategoriesError(this.message);
}
