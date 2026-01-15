import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_location_camera_bloc/domain/entiites/record_entities.dart';

class RecordDetailScreen extends StatelessWidget {
  final RecordEntity record;

  const RecordDetailScreen({super.key, required this.record});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Record Detail'), centerTitle: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// IMAGE
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.file(
                File(record.imagePath),
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 20),

            /// LOCATION
            Text('Location', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 8),
            Text('Latitude: ${record.latitude}'),
            Text('Longitude: ${record.longitude}'),

            const SizedBox(height: 20),

            /// DATE
            Text('Created at', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 8),
            Text(record.createdAt.toLocal().toString()),
          ],
        ),
      ),
    );
  }
}
