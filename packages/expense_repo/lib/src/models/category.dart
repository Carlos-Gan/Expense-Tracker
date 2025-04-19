import '../entities/entities.dart';

class Category{
  String categoryId;
  String name;
  int total;
  String description;
  String icon;
  String color;

  Category({
    required this.categoryId,
    required this.name,
    required this.total,
    required this.description,
    required this.icon,
    required this.color,

  });

  static final empty = Category(
    categoryId: '',
    name: '',
    total: 0,
    description: '',
    icon: '',
    color: '',
  );
  

  CategoryEntity toEntity() {
    return CategoryEntity(
      categoryId: categoryId,
      name: name,
      total: total,
      description: description,
      icon: icon,
      color: color,
    );
  }

  static Category fromEntity(CategoryEntity entity) {
    return Category(
      categoryId: entity.categoryId,
      name: entity.name,
      total: entity.total,
      description: entity.description,
      icon: entity.icon,
      color: entity.color,
    );
  }

}