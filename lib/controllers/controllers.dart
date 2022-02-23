// ignore_for_file: unrelated_type_equality_checks

import 'package:get/get.dart';

// class MyBindings extends Bindings {
//   @override
//   void dependencies() {
//     Get.lazyPut(() => Mycontroller());
//   }
// }

class Mycontroller extends GetxController {
  var ninjaName = 'Titulek'.obs;
  var ninjaLevel = 0.obs;
  var ninjaStatus = 'Begginer'.obs;

  incrementLevel() {
    ninjaLevel++;

    if (ninjaLevel < 5) {
      ninjaStatus.value = 'Jenin';
    }
    if (ninjaLevel > 5 && ninjaLevel < 10) {
      ninjaStatus.value = 'Chunin';
    }
    if (ninjaLevel > 10 && ninjaLevel < 20) {
      ninjaStatus.value = 'Jonin ';
    }
    if (ninjaLevel > 20 && ninjaLevel < 1000) {
      ninjaStatus.value = 'Master ';
    }
  }
}
