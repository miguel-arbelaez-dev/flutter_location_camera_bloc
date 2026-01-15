import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_location_camera_bloc/domain/use%20cases/create_record_usecase.dart';
import 'package:flutter_location_camera_bloc/domain/use%20cases/get_records_usecase.dart';
import 'record_event.dart';
import 'record_state.dart';

class RecordBloc extends Bloc<RecordEvent, RecordState> {
  final CreateRecordUseCase createRecord;
  final GetRecordsUseCase getRecords;

  RecordBloc({required this.createRecord, required this.getRecords})
    : super(const RecordState()) {
    on<CreateRecordEvent>(_create);
    on<LoadRecordsEvent>(_load);
  }

  Future<void> _create(
    CreateRecordEvent event,
    Emitter<RecordState> emit,
  ) async {
    emit(state.copyWith(status: RecordStatus.loading));

    try {
      await createRecord();
      final records = await getRecords();

      emit(state.copyWith(status: RecordStatus.success, records: records));
    } catch (e) {
      emit(state.copyWith(status: RecordStatus.error, error: e.toString()));
    }
  }

  Future<void> _load(LoadRecordsEvent event, Emitter<RecordState> emit) async {
    final records = await getRecords();
    emit(state.copyWith(records: records));
  }
}
