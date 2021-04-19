import 'package:cubit/cubit.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_app/features/screen1/data/model/screen1_model.dart';
import 'package:flutter_app/features/screen1/data/screen1_repository.dart';
import 'package:meta/meta.dart';
part 'screen1_state.dart';

class Screen1Cubit extends Cubit<Screen1State> {
  Screen1Cubit(this.repository) : super(Screen1InitialState());
  Screen1State get initialState => Screen1InitialState();

  final MockScreen1Repository repository;

  void drainStream() {
    //  _subject.value = null;
  }

  @mustCallSuper
  void dispose() async {
    //   await _subject.drain();
    //   _subject.close();
  }

  void getTrendingMovies() async {
    try {
      emit(Screen1LoadingState());
      final movies = await repository.getMockeData();
      emit(Screen1LoadedState(movies));
    } catch (e) {
      emit(Screen1ErrorState());
    }
  }
}
