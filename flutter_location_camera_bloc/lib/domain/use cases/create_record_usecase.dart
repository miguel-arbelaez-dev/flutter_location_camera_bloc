import 'package:flutter_location_camera_bloc/domain/repositories/record_repository.dart';

class CreateRecordUseCase {
  final RecordRepository repository;

  CreateRecordUseCase(this.repository);

  Future<void> call() async {
    await repository.createRecord();
  }
}
