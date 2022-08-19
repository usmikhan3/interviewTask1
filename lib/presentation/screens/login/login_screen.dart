import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projects/models/users.dart';
import 'package:projects/presentation/screens/home/home_screen.dart';
import 'package:projects/routes/route_helper.dart';
import 'package:projects/services/services.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  List<User>? users;

  var isLoaded = false;


  getUserData() async {
    users = await APiService().getUsers();
    if (users != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  navigateToHome(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                HomeScreen(
                  email: emailController.text,
                  username: passwordController.text,

                ))
    );
  }
    @override
    Widget build(BuildContext context) {
      var formKey = GlobalKey<FormState>();
      return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                "assets/images/logo.jpeg",
                height: 200,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    TextFormField(
                      controller: emailController,

                      decoration: InputDecoration(
                        hintText: "Email",
                        fillColor: Colors.black12.withOpacity(0.04),
                        border: InputBorder.none,
                        filled: true,

                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter email';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(

                        hintText: "Password",
                        fillColor: Colors.black12.withOpacity(0.04),
                        border: InputBorder.none,
                        filled: true,
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.visibility),
                          onPressed: () {},
                          color: Colors.grey,
                        ),),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter password';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              Get.toNamed(RouteHelper.homePage);
                            }

                          },
                          child: const Text(
                            "LOGIN",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                        height: 45),
                  ],
                ),
              ),
            )
          ],
        ),
      );
    }
  }

