import 'package:expends_repo/expense_repository.dart';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseExpenseRepo implements ExpenseRepo {
  final CategoryCollection = FirebaseFirestore.instance.collection(
    'categories',
  );
  final ExpenseCollection = FirebaseFirestore.instance.collection('expenses');

  @override
  Future<void> createCategory(Category category) async {
    try {
      await CategoryCollection
      .doc(category.categoryId,)
      .set(category.toEntity().toDocument());

    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<List<Category>> getCategory() async {
    try {
      return await CategoryCollection
      .get()
      .then((value) => value.docs.map((e) => 
        Category.fromEntity(CategoryEntity.fromDocument(e.data())))
      .toList());
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
  
  @override
  Future<void> createExpense() {
    // TODO: implement createExpense
    throw UnimplementedError();
  }
}
