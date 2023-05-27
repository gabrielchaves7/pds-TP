import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:premium_todo/modules/home/widgets/date_posted_filter.dart';

class DatePostedFilterCubit extends Cubit<DatePostedFilter> {
  DatePostedFilterCubit() : super(DatePostedFilter.all);

  void update(DatePostedFilter newValue) => emit(newValue);
}
