import 'package:equatable/equatable.dart';

class MenuState extends Equatable {
  final bool isVisible;
  final double offSet;
  const MenuState({this.isVisible = false, this.offSet = 0});

  static MenuState copyWith({bool? isVisible, double? offSet}) {
    return MenuState(
        isVisible: isVisible ?? false, offSet: offSet ?? 0);
  }

  @override
  List<Object> get props => [isVisible, offSet];
}
