import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';

void main() {
  runApp(GetMaterialApp(
    title: 'To-Do App',
    initialRoute: '/',
    getPages: AppPages.routes,
    debugShowCheckedModeBanner: false,
  ));
}