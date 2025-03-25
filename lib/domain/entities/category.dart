import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_mate/shared/enums/category_type.dart';

part 'category.freezed.dart';

@freezed
class Category with _$Category {
  const factory Category(
      {required String id,
      required String name,
      required CategoriesType type,
      required IconData icon,
      required Color color,
      required double? budget,
      @Default(false) bool isSelected}) = _Category;
}
