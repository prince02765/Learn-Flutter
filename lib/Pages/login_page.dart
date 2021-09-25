import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:futter_learn/utils/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;

  @override
  Widget build(BuildContext context) {
    // changeButton = false;
    return Material(
        color: Colors.white,
        child: SingleChildScrollView(
            child: Column(children: [
          const SizedBox(
            height: 24,
          ),
          Image.asset(
            "assets/images/login_img.png",
            fit: BoxFit.cover,
          ),
          const SizedBox(
            height: 24,
          ),
          Text("Welcome $name",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(
            height: 24,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                      hintText: "Enter Username", labelText: "Username"),
                  onChanged: (Value) {
                    name = Value;
                    setState(() {});
                  },
                ),
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                      hintText: "Enter Password", labelText: "Password"),
                ),
                const SizedBox(
                  height: 40,
                ),
                InkWell(
                  onTap: () async {
                    setState(() {
                      changeButton = true;
                    });

                    await Future.delayed(Duration(milliseconds: 500));
                    Navigator.pushNamed(context, Routes.HomeRoute);
                    setState(() {
                      changeButton = true;
                    });
                  },
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 500),
                    width: changeButton ? 50 : 150,
                    height: 40,
                    alignment: Alignment.center,
                    child: changeButton
                        ? Icon(Icons.done, color: Colors.white)
                        : Text("Login",
                            style:
                                TextStyle(fontSize: 16, color: Colors.white)),
                    decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius:
                            BorderRadius.circular(changeButton ? 50 : 6)),
                  ),
                ),
                //   ElevatedButton(
                //       style:
                //           TextButton.styleFrom(minimumSize: const Size(150, 40)),
                //       onPressed: () {
                //         Navigator.pushNamed(context, Routes.HomeRoute);
                //       },
                //       child: const Text("Login"))
              ],
            ),
          )
        ])));
  }
}
