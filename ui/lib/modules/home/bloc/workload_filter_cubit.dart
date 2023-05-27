import 'package:flutter_bloc/flutter_bloc.dart';

class FulltimeFilterCubit extends Cubit<bool> {
  FulltimeFilterCubit() : super(true);

  void update(bool newValue) => emit(newValue);
}

class InterimFilterCubit extends Cubit<bool> {
  InterimFilterCubit() : super(true);

  void update(bool newValue) => emit(newValue);
}

class PartTimeFilterCubit extends Cubit<bool> {
  PartTimeFilterCubit() : super(true);

  void update(bool newValue) => emit(newValue);
}
