import 'package:expends_repo/expense_repository.dart';

abstract class ExpenseRepo {
  Future<void> createCategory(Category category);

  Future<void> createExpense();
}