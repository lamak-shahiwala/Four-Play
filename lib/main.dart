import 'package:flutter/material.dart';
import 'package:four_play/core/bindings/main_bindings.dart';
import 'package:four_play/screens/dashboard.dart';
import 'package:get/get.dart';

void main() {
  runApp(MaterialApp(home: MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: MainBindings(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => Dashboard())
      ],
    );
  }
}
