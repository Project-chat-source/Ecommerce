class DimensionsEntity {
  final double width;
  final double height;
  final double depth;

  DimensionsEntity({
    required this.width,
    required this.height,
    required this.depth,
  });

  factory DimensionsEntity.empty() =>
      DimensionsEntity(width: 0, height: 0, depth: 0);
}
