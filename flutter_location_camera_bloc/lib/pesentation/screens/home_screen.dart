import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_location_camera_bloc/domain/entiites/record_entities.dart';
import 'package:flutter_location_camera_bloc/pesentation/bloc/record_bloc.dart';
import 'package:flutter_location_camera_bloc/pesentation/bloc/record_event.dart';
import 'package:flutter_location_camera_bloc/pesentation/bloc/record_state.dart';
import 'package:flutter_location_camera_bloc/pesentation/routes/app_routes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<RecordBloc>().add(LoadRecordsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Location & Camera Records'),
        centerTitle: true,
      ),

      /// 📸 BOTÓN CÁMARA
      floatingActionButton: FloatingActionButton(
        tooltip: 'Capture photo and location',
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.camera);
        },
        child: const Icon(Icons.add_a_photo),
      ),

      body: BlocBuilder<RecordBloc, RecordState>(
        builder: (context, state) {
          /// ⏳ LOADING GLOBAL
          if (state.status == RecordStatus.loading && state.records.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          /// ❌ ERROR
          if (state.status == RecordStatus.error) {
            return Center(
              child: Text(
                state.error ?? 'Unexpected error',
                style: const TextStyle(color: Colors.red),
                textAlign: TextAlign.center,
              ),
            );
          }

          /// 📭 SIN REGISTROS
          if (state.records.isEmpty) {
            return const Center(
              child: Text(
                'No records yet.\nTap the camera button to create one.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            );
          }

          /// 📋 LISTA DE REGISTROS
          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: state.records.length,
            itemBuilder: (context, index) {
              final RecordEntity record = state.records[index];

              return Card(
                elevation: 3,
                margin: const EdgeInsets.only(bottom: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.file(
                      File(record.imagePath),
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(
                    'Lat: ${record.latitude.toStringAsFixed(4)} '
                    'Lng: ${record.longitude.toStringAsFixed(4)}',
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ),
                  subtitle: Text(
                    record.createdAt.toLocal().toString(),
                    style: const TextStyle(fontSize: 12),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      AppRoutes.detail,
                      arguments: record,
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
