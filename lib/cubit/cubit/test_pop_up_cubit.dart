import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'test_pop_up_state.dart';

class TestPopUpCubit extends Cubit<TestPopUpState> {
  TestPopUpCubit() : super(TestPopUpInitial());
}
