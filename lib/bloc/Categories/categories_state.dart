part of "categories_bloc.dart";

abstract class CategoriesState extends Equatable {
  const CategoriesState();

  @override
  List<Object?> get props => [];
}

class CategoriesInitial extends CategoriesState {
  @override
  List<Object?> get props => [];
}

class CategoriesLoading extends CategoriesState {
  @override
  List<Object?> get props => [];
}

class CategoriesError extends CategoriesState {
  final String error;
  const CategoriesError(this.error);

  @override
  List<Object?> get props => [error];
}

class CategoriesLoaded extends CategoriesState {
  final List<String> categoriess;
  const CategoriesLoaded(this.categoriess);
  @override
  List<Object?> get props => [categoriess];
}
