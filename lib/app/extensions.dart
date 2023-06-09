// extension on string

extension NonNullString on String? {
  String get nonNull => this ?? '';
}

extension NonNullInt on int? {
  int get nonNull => this ?? 0;
}

extension NonNullDouble on double? {
  double get nonNull => this ?? 0.0;
}

extension NonNullBool on bool? {
  bool get nonNull => this ?? false;
}

extension NonNullList<T> on List<T>? {
  List<T> get nonNull => this ?? [];
}
