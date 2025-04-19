import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:expense_repo/expense_repository.dart';

part 'create_category_event.dart';
part 'create_category_state.dart';

class CreateCategoryBloc extends Bloc<CreateCategoryEvent, CreateCategoryState> {
  final ExpenseRepo expenseRepository;

  CreateCategoryBloc(this.expenseRepository) : super(CreateCategoryInitial()) {
    on<CreateCategory>(_onCreateCategory); // Manejador específico para CreateCategory
  }

  Future<void> _onCreateCategory(
    CreateCategory event,
    Emitter<CreateCategoryState> emit,
  ) async {
    emit(CreateCategoryLoading());
    try {
      await expenseRepository.createCategory(event.category);
      emit(CreateCategorySucess());
    } catch (e) {
      emit(CreateCategoryFailure());
    }
  }
}