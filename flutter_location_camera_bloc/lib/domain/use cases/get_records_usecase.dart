import 'package:flutter_location_camera_bloc/domain/entiites/record_entities.dart';
import 'package:flutter_location_camera_bloc/domain/repositories/record_repository.dart';

class GetRecordsUseCase {
  final RecordRepository repository;

  GetRecordsUseCase(this.repository);

  Future<List<RecordEntity>> call() async {
    return repository.getRecords();
  }
}
