import 'dart:convert';

import 'package:flutter_location_camera_bloc/domain/entiites/record_entities.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class RecordLocalDataSource {
  Future<void> saveRecord(RecordEntity record);
  Future<List<RecordEntity>> getRecords();
}

class RecordLocalDataSourceImpl implements RecordLocalDataSource {
  static const _key = 'records';

  @override
  Future<void> saveRecord(RecordEntity record) async {
    final prefs = await SharedPreferences.getInstance();
    final records = await getRecords();

    records.add(record);

    final encoded = records.map((e) => jsonEncode(e.toMap())).toList();

    await prefs.setStringList(_key, encoded);
  }

  @override
  Future<List<RecordEntity>> getRecords() async {
    final prefs = await SharedPreferences.getInstance();
    final list = prefs.getStringList(_key) ?? [];

    return list.map((e) => RecordEntity.fromMap(jsonDecode(e))).toList();
  }
}
