import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hebe/cubit/cubit/popup_cubit_state.dart';

class PopUpCubit extends Cubit<TestPopUpState> {
  PopUpCubit() : super(const TestPopUpState());

  Future<void> changeFalse() async {
    emit(state.copyWith(ispop: false));
    Future.delayed(const Duration(seconds: 1));
  }

  void changeTrue() => emit(state.copyWith(ispop: true));
}
