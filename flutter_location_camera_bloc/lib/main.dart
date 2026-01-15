import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_location_camera_bloc/data/data%20sources/camera_data_source.dart';
import 'package:flutter_location_camera_bloc/data/data%20sources/location_data_source.dart';
import 'package:flutter_location_camera_bloc/data/data%20sources/record_local_data_source.dart';
import 'package:flutter_location_camera_bloc/data/repositories/record_repository_impl.dart';
import 'package:flutter_location_camera_bloc/domain/use%20cases/create_record_usecase.dart';
import 'package:flutter_location_camera_bloc/domain/use%20cases/get_records_usecase.dart';
import 'package:flutter_location_camera_bloc/pesentation/bloc/record_bloc.dart';
import 'package:flutter_location_camera_bloc/pesentation/routes/app_routes.dart';
import 'package:flutter_location_camera_bloc/pesentation/theme/app_theme.dart';

void main() {
  final repository = RecordRepositoryImpl(
    camera: CameraDataSourceImpl(),
    location: LocationDataSourceImpl(),
    local: RecordLocalDataSourceImpl(),
  );

  runApp(
    BlocProvider(
      create: (_) => RecordBloc(
        createRecord: CreateRecordUseCase(repository),
        getRecords: GetRecordsUseCase(repository),
      ),
      child: const MyApp(),
    ),
  );
}

/// 👇 ESTA CLASE FALTABA
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: AppRoutes.home,
      onGenerateRoute: AppRoutes.generate,
    );
  }
}
