import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/routes.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String name = "";
  bool changeButton = false;
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: SingleChildScrollView(
            child: Column(
          children: [
            Image.asset(
              "assets/images/login.png",
              fit: BoxFit.cover,
            ),
            Text(
              "Welcome $name",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20.0,
            ),
            Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: "Please Enter Your Name",
                          labelText: "User Name"),
                      onChanged: (value) {
                        name = value;
                        setState(() {});
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: "Please Enter Your Password",
                          labelText: "Password"),
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    // ElevatedButton(
                    //   onPressed: () {
                    //     Navigator.pushNamed(context, MyRoutes.homeRoute);
                    //     print("Hiii");
                    //   },
                    //   style: TextButton.styleFrom(
                    //     minimumSize: Size(150, 30),
                    //   ),
                    //   child: Text(
                    //     "Login",
                    //     style: TextStyle(
                    //         fontSize: 25, backgroundColor: Colors.blue),
                    //   ),
                    // )
                    InkWell(
                        onTap:  () async {
                          setState(() {
                            changeButton = true;
                          });

                          await Future.delayed(Duration(seconds: 2));
                          Navigator.pushNamed(context, MyRoutes.homeRoute);
                        },
                        child: AnimatedContainer(
                          duration: Duration(seconds: 2),
                          width: changeButton ? 50 : 150,
                          height: 50,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.deepPurple,
                          ),
                          child: Text("Login",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18)),
                        ))
                  ],
                ))
          ],
        )));
  }
}
