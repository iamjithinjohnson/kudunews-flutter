import 'package:get/get.dart';

class TextSmallController extends GetxController {
  bool flag = true;

  void pageview(bool ind) {
    flag = ind;
    update();
  }
}
