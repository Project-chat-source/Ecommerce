class MetaEntity {
  final DateTime createdAt;

  final DateTime updatedAt;

  final String barcode;

  final String qrCode;

  MetaEntity({
    required this.createdAt,
    required this.updatedAt,
    required this.barcode,
    required this.qrCode,
  });

  factory MetaEntity.empty() => MetaEntity(
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    barcode: '',
    qrCode: '',
  );
}
