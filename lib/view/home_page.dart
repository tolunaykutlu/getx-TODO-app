import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../util/add_task.dart';
import '../util/counter.dart';

class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({super.key, required this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final Controller controller = Get.put(Controller());

    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        SizedBox(
          height: 400,
          child: Obx(
            //wrap the widget that you want to refresh with obx
            () {
              return ListView.builder(
                itemCount: controller.todo.length,
                itemBuilder: (context, index) {
                  return Obx(() => todoListTile(controller, index));
                },
              );
            },
          ),
        ),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addTask(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Padding todoListTile(Controller controller, int index) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.amber[800],
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomRight: Radius.circular(20))),
        height: 40,
        child: Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Row(children: [
            Obx(() => Checkbox(
                  value: controller.isDone[index],
                  onChanged: (value) {
                    value = controller.checkBoxChanged(index);
                  },
                )),
            Center(
                child: controller.isDone[index] == true
                    ? Text(controller.todo[index].toString(),
                        style: const TextStyle(
                            decoration: TextDecoration.lineThrough))
                    : Text(
                        controller.todo[index].toString(),
                      )),
            const Spacer(), //with this widget we can push other widget to the end
            IconButton(
                onPressed: () => controller.deleteTask(index),
                icon: const Icon(Icons.delete))
          ]),
        ),
      ),
    );
  }
}
