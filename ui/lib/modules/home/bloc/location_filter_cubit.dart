import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:premium_todo/modules/home/widgets/widgets.dart';

class LocationFilterCubit extends Cubit<LocationFilter> {
  LocationFilterCubit() : super(LocationFilter.near);

  void update(LocationFilter newValue) => emit(newValue);
}
