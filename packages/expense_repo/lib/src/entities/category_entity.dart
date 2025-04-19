class CategoryEntity{
  String categoryId;
  String name;
  int total;
  String description;
  String icon;
  String color;

  CategoryEntity({
    required this.categoryId,
    required this.name,
    required this.total,
    required this.description,
    required this.icon,
    required this.color,
  });

  Map<String, Object?> toDocument(){
    return {
      'categoryId': categoryId,
      'name': name,
      'total': total,
      'description': description,
      'icon': icon,
      'color': color,
    };
  }

  static CategoryEntity fromDocument(Map<String, Object?> doc){
    return CategoryEntity(
      categoryId: doc['categoryId'] as String,
      name: doc['name'] as String,
      total: doc['total'] as int,
      description: doc['description'] as String,
      icon: doc['icon'] as String,
      color: doc['color'] as String,
    );
  }
}