// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meta_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MetaModel _$MetaModelFromJson(Map<String, dynamic> json) => MetaModel(
  createdAt: dateTimeFromJson(json['createdAt']),
  updatedAt: dateTimeFromJson(json['updatedAt']),
  barcode: json['barcode'] as String? ?? '',
  qrCode: json['qrCode'] as String? ?? '',
);

Map<String, dynamic> _$MetaModelToJson(MetaModel instance) => <String, dynamic>{
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
  'barcode': instance.barcode,
  'qrCode': instance.qrCode,
};
