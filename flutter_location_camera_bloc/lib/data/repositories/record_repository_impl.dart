import 'package:flutter_location_camera_bloc/data/data%20sources/camera_data_source.dart';
import 'package:flutter_location_camera_bloc/data/data%20sources/location_data_source.dart';
import 'package:flutter_location_camera_bloc/data/data%20sources/record_local_data_source.dart';
import 'package:flutter_location_camera_bloc/domain/entiites/record_entities.dart';
import 'package:flutter_location_camera_bloc/domain/repositories/record_repository.dart';

class RecordRepositoryImpl implements RecordRepository {
  final CameraDataSource camera;
  final LocationDataSource location;
  final RecordLocalDataSource local;

  RecordRepositoryImpl({
    required this.camera,
    required this.location,
    required this.local,
  });

  @override
  Future<void> createRecord() async {
    final position = await location.getCurrentLocation();
    final imagePath = await camera.takePhoto();

    final record = RecordEntity(
      latitude: position.latitude,
      longitude: position.longitude,
      imagePath: imagePath,
      createdAt: DateTime.now(),
    );

    await local.saveRecord(record);
  }

  @override
  Future<List<RecordEntity>> getRecords() async {
    return await local.getRecords();
  }
}
