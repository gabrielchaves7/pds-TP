import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:premium_todo/modules/home/widgets/widgets.dart';

class SalaryRangeFilterCubit extends Cubit<SalaryRangeFilter> {
  SalaryRangeFilterCubit() : super(SalaryRangeFilter.any);

  void update(SalaryRangeFilter newValue) => emit(newValue);
}
