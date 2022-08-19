import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projects/routes/route_helper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task 1',
      theme: ThemeData(

        primarySwatch: Colors.red,
      ),
      initialRoute: RouteHelper.splashPage,
      getPages: RouteHelper.routes,
    );
  }
}

