class RecordEntity {
  final double latitude;
  final double longitude;
  final String imagePath;
  final DateTime createdAt;

  RecordEntity({
    required this.latitude,
    required this.longitude,
    required this.imagePath,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() => {
    'latitude': latitude,
    'longitude': longitude,
    'imagePath': imagePath,
    'createdAt': createdAt.toIso8601String(),
  };

  factory RecordEntity.fromMap(Map<String, dynamic> map) {
    return RecordEntity(
      latitude: map['latitude'],
      longitude: map['longitude'],
      imagePath: map['imagePath'],
      createdAt: DateTime.parse(map['createdAt']),
    );
  }
}
