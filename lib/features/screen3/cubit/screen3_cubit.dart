import 'package:cubit/cubit.dart';
import 'package:flutter_app/features/screen3/data/model/screen3_model.dart';
import 'package:flutter_app/features/screen3/data/screen3_repository.dart';
import 'package:meta/meta.dart';
part 'screen3_state.dart';

class Screen3Cubit extends Cubit<Screen3State> {
  Screen3Cubit(this.repository) : super(Screen3InitialState());
  Screen3State get initialState => Screen3InitialState();

  final MockScreen3Repository repository;

  void drainStream() {
    //  _subject.value = null;
  }

  @mustCallSuper
  void dispose() async {
    //   await _subject.drain();
    //   _subject.close();
  }

  // A function to call the api and get the data
  void getDataFromAPI() async {
    try {
      emit(Screen3LoadingState());
      final data = await repository.getMockeData();
      emitLoadedState(data);
    } catch (e) {
      emit(Screen3ErrorState());
    }
  }

  void emitLoadedState(Screen3Model data) {
    emit(Screen3LoadedState(data));
  }
}
