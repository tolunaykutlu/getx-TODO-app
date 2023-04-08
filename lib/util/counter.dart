import 'package:get/get.dart';

class Controller extends GetxController {
  var count = 0.obs;
  List todo = ["yemek", "içmek", "uyumak"].obs;
  // with 2 lists we can achieve the goal :D
  List isDone = [false, false, false].obs;

  increment() {
    count++; //count.value for if else statements
    update();
  }

  checkBoxChanged(int index) {
    isDone[index] = !isDone[index];

    update();
  }

//add Task
  addTask(String task, bool value) {
    todo.add(task);
    isDone.add(value);
    update();
    Get.snackbar("Görev Başarıyla Eklendi", task,
        duration: const Duration(seconds: 1));
  }

//delete task
  deleteTask(int index) {
    todo.removeAt(index);
    isDone.removeAt(index);
    update();
  }
}
