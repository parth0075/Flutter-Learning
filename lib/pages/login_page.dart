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

  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });

      await Future.delayed(Duration(seconds: 1));
      Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: SingleChildScrollView(
            child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Image.asset(
                      "assets/images/login.png",
                      fit: BoxFit.cover,
                    ),
                    Text(
                      "Welcome $name",
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
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
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Username cannot be empty";
                                }
                                return null;
                              },
                            ),
                            TextFormField(
                              obscureText: true,
                              decoration: InputDecoration(
                                  hintText: "Please Enter Your Password",
                                  labelText: "Password"),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Password cannot be empty";
                                } else if (value.length < 6) {
                                  return "Password length must be at least 6 characters";
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 40.0,
                            ),
                            Material(
                                color: Colors.deepPurple,
                                borderRadius: BorderRadius.circular(
                                    changeButton ? 50 : 8),
                                child: InkWell(
                                    splashColor: Colors.red,
                                    onTap: () => moveToHome(context),
                                    child: AnimatedContainer(
                                      duration: Duration(seconds: 2),
                                      width: 150,
                                      height: 50,
                                      alignment: Alignment.center,
                                      child: changeButton
                                          ? Icon(
                                              Icons.done,
                                              color: Colors.white,
                                            )
                                          : Text("Login",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18)),
                                    )))
                          ],
                        ))
                  ],
                ))));
  }
}
