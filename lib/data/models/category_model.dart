import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_mate/domain/entities/category.dart';
import 'package:money_mate/shared/enums/categories_enum.dart';
import 'package:money_mate/shared/enums/category_type.dart';

part 'category_model.freezed.dart';
part 'category_model.g.dart';

@freezed
class CategoryModel with _$CategoryModel {
  const factory CategoryModel(
      {required String id,
      required String name,
      required String type,
      @JsonKey(name: 'enum') required String data,
      required double? budget}) = _CategoryModel;

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);
}

extension CategoryModelX on CategoryModel {
  Category toEntity() {
    final catEnum = CategoriesEnum.parseEnum(data);
    final catType = CategoriesType.fromString(type);
    return Category(
        id: id,
        name: name,
        type: catType,
        icon: catEnum.icon,
        color: catEnum.color,
        budget: budget);
  }
}
