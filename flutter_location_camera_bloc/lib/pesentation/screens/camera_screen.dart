import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_location_camera_bloc/pesentation/bloc/record_bloc.dart';
import 'package:flutter_location_camera_bloc/pesentation/bloc/record_event.dart';

import '../bloc/record_state.dart';

class CameraScreen extends StatelessWidget {
  const CameraScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Capture Record')),
      body: BlocListener<RecordBloc, RecordState>(
        listener: (context, state) {
          if (state.status == RecordStatus.success) {
            Navigator.pop(context);
          }

          if (state.status == RecordStatus.error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error ?? 'Unknown error')),
            );
          }
        },
        child: Center(
          child: BlocBuilder<RecordBloc, RecordState>(
            builder: (context, state) {
              if (state.status == RecordStatus.loading) {
                return const CircularProgressIndicator();
              }

              return ElevatedButton.icon(
                icon: const Icon(Icons.camera_alt),
                label: const Text('Take Photo & Save Location'),
                onPressed: () {
                  context.read<RecordBloc>().add(CreateRecordEvent());
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
