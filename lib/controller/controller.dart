import 'package:get/get.dart';

class PageViewController extends GetxController {
  int index = 0;

  void pageview(int ind) {
    index = ind;
    update();
  }
}
