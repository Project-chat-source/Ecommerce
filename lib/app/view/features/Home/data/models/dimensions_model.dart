import 'package:json_annotation/json_annotation.dart';
import 'package:learning/app/view/features/Home/domain/entities/dimension_entity.dart';
part 'dimensions_model.g.dart';

@JsonSerializable()
class DimensionsModel {
  @JsonKey(name: 'width', defaultValue: 0)
  final double width;

  @JsonKey(name: 'height', defaultValue: 0)
  final double height;

  @JsonKey(name: 'depth', defaultValue: 0)
  final double depth;

  DimensionsModel({
    required this.width,
    required this.height,
    required this.depth,
  });

  factory DimensionsModel.empty() =>
      DimensionsModel(width: 0, height: 0, depth: 0);

  factory DimensionsModel.fromJson(Map<String, dynamic> json) =>
      _$DimensionsModelFromJson(json);

  Map<String, dynamic> toJson() => _$DimensionsModelToJson(this);

  DimensionsEntity toDomain() =>
      DimensionsEntity(width: width, height: height, depth: depth);
}
