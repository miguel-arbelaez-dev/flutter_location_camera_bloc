import 'package:flutter/material.dart';
import 'package:flutter_location_camera_bloc/domain/entiites/record_entities.dart';
import 'package:flutter_location_camera_bloc/pesentation/screens/camera_screen.dart';
import 'package:flutter_location_camera_bloc/pesentation/screens/detail_screen.dart';
import 'package:flutter_location_camera_bloc/pesentation/screens/home_screen.dart';

class AppRoutes {
  static const home = '/';
  static const camera = '/camera';
  static const detail = '/detail';

  static Route<dynamic> generate(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      case camera:
        return MaterialPageRoute(builder: (_) => const CameraScreen());

      case detail:
        final record = settings.arguments as RecordEntity;
        return MaterialPageRoute(
          builder: (_) => RecordDetailScreen(record: record),
        );

      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('Route not found'))),
        );
    }
  }
}
