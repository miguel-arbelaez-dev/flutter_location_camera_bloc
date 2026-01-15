import 'package:flutter_location_camera_bloc/domain/entiites/record_entities.dart';

enum RecordStatus { initial, loading, success, error }

class RecordState {
  final RecordStatus status;
  final List<RecordEntity> records;
  final String? error;

  const RecordState({
    this.status = RecordStatus.initial,
    this.records = const [],
    this.error,
  });

  RecordState copyWith({
    RecordStatus? status,
    List<RecordEntity>? records,
    String? error,
  }) {
    return RecordState(
      status: status ?? this.status,
      records: records ?? this.records,
      error: error,
    );
  }
}
