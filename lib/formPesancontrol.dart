import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';

class TextControl extends GetxController {
  var nama = "".obs, alamat = "".obs;

  TextEditingController ctrlNama = TextEditingController();
  TextEditingController ctrlAlamat = TextEditingController();

  @override
  void onClose() {
    ctrlNama.dispose();
    ctrlAlamat.dispose();
    super.onClose();
  }
}

class RadioControl extends GetxController {
  var payMethod = "".obs;

  onChangedMethod(var newValue) {
    payMethod(newValue);
  }
}

class CheckboxControl extends GetxController {
  var isPremium = false.obs;

  onPressed(bool? premium) {
    isPremium(premium);
  }
}
