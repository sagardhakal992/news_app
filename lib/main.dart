import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shikhar_daily/pages/HomePage.dart';
import 'package:shikhar_daily/pages/detailPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      initialRoute: "/home",
      getPages: [
        GetPage(name: "/home", page:()=>const HomePage()),
        GetPage(name: "/detail", page:()=>DetailPage()),

      ],
    );
  }
}
