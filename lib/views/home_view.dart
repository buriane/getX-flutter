import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Get.toNamed('/profile');
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text('Welcome ${homeController.userName.value}!')),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/data');
              },
              child: Text('Lihat Data Item'),
            ),
          ],
        ),
      ),
    );
  }
}