import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/category_task.dart';
import 'categroy_state.dart';

class CategroyCubit extends Cubit<CategroyState> {
  CategroyCubit() : super(CategroyState(categoryTask: getCategroy[0]));

  void changeCategory(int index) {
    emit(CategroyState(categoryTask: getCategroy[index]));
  }
}
