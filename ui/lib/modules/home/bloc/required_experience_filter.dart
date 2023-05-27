import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:premium_todo/modules/home/widgets/widgets.dart';

class RequiredExperienceFilterCubit extends Cubit<RequiredExperienceFilter> {
  RequiredExperienceFilterCubit() : super(RequiredExperienceFilter.all);

  void update(RequiredExperienceFilter newValue) => emit(newValue);
}
