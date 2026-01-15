import 'package:flutter_location_camera_bloc/domain/entiites/record_entities.dart';

abstract class RecordRepository {
  Future<void> createRecord();
  Future<List<RecordEntity>> getRecords();
}
