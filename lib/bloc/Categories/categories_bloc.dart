import 'package:e_com_app/repos/repo/product_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'categories_event.dart';

part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoryEvent, CategoriesState> {
  CategoriesBloc() : super(CategoriesInitial()) {
    final ApiRepo apiRepo = ApiRepo();
    on<LoadCategoryEvent>((event, emit) async {
      try {
        emit(CategoriesLoading());
        final List<String> categories = await apiRepo.fetchCategories();
        emit(CategoriesLoaded(categories));
      } catch (e) {
        emit(CategoriesError('$e'));
      }
    });
  }
}
