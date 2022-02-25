// ignore_for_file: unrelated_type_equality_checks, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

var ninjaNameController = TextEditingController();

changeName() {
  Mycontroller controller = Get.put(Mycontroller());
  Get.defaultDialog(
      title: 'New Ninja Name',
      titlePadding: EdgeInsets.fromLTRB(0, 30, 0, 5),
      content: SizedBox(
        width: 230,
        child: TextField(
          controller: ninjaNameController,
          maxLength: 10,
          decoration: InputDecoration(
            border: UnderlineInputBorder(),
            hintText: 'ninja name',
            contentPadding: EdgeInsets.fromLTRB(5, 20, 5, 20),
          ),
        ),
      ),
      barrierDismissible: false,
      cancel:
          OutlinedButton(onPressed: () => Get.back(), child: Text('Cancel')),
      confirm: ElevatedButton(
        onPressed: () {
          if (ninjaNameController.text.trimLeft() == '') {
          } else {
            controller.ninjaName.value = ninjaNameController.text.trimLeft();
            Get.back();
            ninjaNameController.clear();
          }
        },
        child: Text('Update'),
      ));
}
