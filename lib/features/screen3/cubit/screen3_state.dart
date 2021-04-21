part of 'screen3_cubit.dart';

@immutable
abstract class Screen3State {
  const Screen3State();

  List<Object> get props => [];
}

class Screen3InitialState extends Screen3State {}

class Screen3LoadingState extends Screen3State {}

class Screen3LoadedState extends Screen3State {
  Screen3LoadedState(this.model);

  final Screen3Model model;
}

class Screen3ErrorState extends Screen3State {}
