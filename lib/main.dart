import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planet_app/views/screen/homepage.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    getPages: [
      GetPage(name: '/', page: () => HomePage()),
    ],
  ));
}
