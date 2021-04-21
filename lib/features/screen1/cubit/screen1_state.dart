part of 'screen1_cubit.dart';

@immutable
abstract class Screen1State {
  const Screen1State();

  List<Object> get props => [];
}

class Screen1InitialState extends Screen1State {}

class Screen1LoadingState extends Screen1State {}

class Screen1LoadedState extends Screen1State {
  Screen1LoadedState(this.model);

  final Screen1Model model;
}

class Screen1ErrorState extends Screen1State {}
