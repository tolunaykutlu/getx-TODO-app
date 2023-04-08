import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'counter.dart';

Future<dynamic> addTask(BuildContext context) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      final Controller controller = Get.put(Controller());
      final TextEditingController c = TextEditingController();
      return AlertDialog(
        title: const Text('Görev Ekle'),
        actions: [
          TextField(
            controller: c,
            decoration: const InputDecoration(
                focusColor: Colors.amber,
                labelText: "Görev",
                border: OutlineInputBorder(),
                hintText: "Görevi giriniz"),
          ),
          Row(
            children: [
              TextButton(
                onPressed: () {
                  controller.addTask(c.text, false);
                },
                child: const Text('Kaydet'),
              ),
              const SizedBox(
                width: 30,
              ),
              TextButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text('Geri Dön'),
              ),
            ],
          ),
        ],
      );
    },
  );
}
