import 'package:get/get.dart';

class Controller extends GetxController {
  var count = 0.obs;
  List<String> todo = ["yemek ", "içmek", "uyumak"].obs;

  increment() {
    count++; //count.value for if else statements
    update();
  }

  addListItem(String value) {
    todo.add(value);
    update();
  }
}
