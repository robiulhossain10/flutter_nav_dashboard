import 'package:get/get.dart';

class NavController extends GetxController {
  // বর্তমান সিলেক্টেড পেজ ইনডেক্স
  var currentIndex = 0.obs;

  // ইনডেক্স পরিবর্তন করার ফাংশন
  void changePage(int index) {
    currentIndex.value = index;
  }
}
