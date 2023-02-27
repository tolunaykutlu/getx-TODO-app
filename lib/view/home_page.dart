import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../util/counter.dart';

class MyHomePage extends StatelessWidget {
  final String title;
  const MyHomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final Controller controller = Get.put(Controller());
    final TextEditingController c = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        SizedBox(
          height: 400,
          child: Obx(
            //wrap the widget that you want to refresh with obx
            () {
              return ListView.builder(
                itemCount: controller.todo.length,
                itemBuilder: (context, index) {
                  return todoListTile(controller, index);
                },
              );
            },
          ),
        ),
        SizedBox(
          child: TextField(controller: c),
        )
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.addListItem(c.text);
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
          child: Center(child: Text(controller.todo[index].toString())),
        ),
      ),
    );
  }
}
