import 'package:get/get.dart';

class MainBottomNavController extends GetxController {
  int _selectedIndex = 0;

  int get currentIndex => _selectedIndex;

  void ChangeIndex(int index) {
    if (_selectedIndex == index) {
      return;
    }
    _selectedIndex = index;
    update();
  }

  void backToHome() {
    ChangeIndex(0);
  }
}
