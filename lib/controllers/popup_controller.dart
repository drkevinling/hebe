import 'package:get/get.dart';

class PopUpController extends GetxController {
  var isPop = true.obs;

  Future<void> changePop() async {
    isPop.value = false;
  }

  void changeBack() {
    isPop.value = true;
  }
}
