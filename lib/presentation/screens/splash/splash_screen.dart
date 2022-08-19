import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projects/constants.dart';
import 'package:projects/routes/route_helper.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3),(){
      Get.toNamed(RouteHelper.loginPage);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
              Center(child: Image.asset("assets/images/logo.jpeg"),),
              SizedBox(height: 50,),
              CircularProgressIndicator(),
        ],
      ),
    );
  }
}
