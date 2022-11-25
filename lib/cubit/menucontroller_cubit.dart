import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hebe/constants/others/keys.dart';

import 'package:hebe/cubit/menustate.dart';
import 'package:hebe/screens/widgets/helper.dart';

class MenucontrollerCubit extends Cubit<MenuState> {
  MenucontrollerCubit()
      : super(const MenuState(offSet: 0, isVisible: false));

  void click() {
    double offset = CalculateWidgetPosition.getOffset(servicekey);
    emit(MenuState(offSet: offset, isVisible: !state.isVisible));
  }
}
