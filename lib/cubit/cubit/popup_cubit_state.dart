import 'package:equatable/equatable.dart';

class TestPopUpState extends Equatable {
  final bool isPOP;

  const TestPopUpState({this.isPOP = true});

  TestPopUpState copyWith({bool? ispop}) {
    return TestPopUpState(isPOP: ispop ?? isPOP);
  }

  @override
  List<Object> get props => [];
}
