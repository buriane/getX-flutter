import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/data_controller.dart';

class DataView extends StatelessWidget {
  final DataController dataController = Get.put(DataController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Data Item')),
      body: Obx(() {
        return ListView.builder(
          itemCount: dataController.items.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(dataController.items[index]),
            );
          },
        );
      }),
    );
  }
}
