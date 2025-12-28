import 'package:json_annotation/json_annotation.dart';
import 'package:learning/app/view/features/Home/domain/entities/meta_entity.dart';
part 'meta_model.g.dart';

DateTime dateTimeFromJson(dynamic json) {
  return json == null ? DateTime.now() : DateTime.parse(json as String);
}

@JsonSerializable()
class MetaModel {
  @JsonKey(name: 'createdAt', fromJson: dateTimeFromJson)
  final DateTime createdAt;

  @JsonKey(name: 'updatedAt', fromJson: dateTimeFromJson)
  final DateTime updatedAt;

  @JsonKey(name: 'barcode', defaultValue: '')
  final String barcode;

  @JsonKey(name: 'qrCode', defaultValue: '')
  final String qrCode;

  MetaModel({
    required this.createdAt,
    required this.updatedAt,
    required this.barcode,
    required this.qrCode,
  });

  factory MetaModel.empty() => MetaModel(
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    barcode: '',
    qrCode: '',
  );

  factory MetaModel.fromJson(Map<String, dynamic> json) =>
      _$MetaModelFromJson(json);

  Map<String, dynamic> toJson() => _$MetaModelToJson(this);

  MetaEntity toDomain() => MetaEntity(
    createdAt: createdAt,
    updatedAt: updatedAt,
    barcode: barcode,
    qrCode: qrCode,
  );
}
