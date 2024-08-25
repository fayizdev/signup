import 'package:flutter/material.dart';
import 'package:signup/main.dart';
import 'package:signup/views/home_page/home_page.dart';
import 'package:signup/views/registration_page/restration_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back,
          weight: 10,
          size: 30,
          color: Colors.black,
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            SizedBox(
              height: 90,
            ),
            Center(
              child: Text(
                "Sign in to Your Account",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(30),
              child: TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: "Your Email Address",
                    border: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 1, color: Colors.green.shade300),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  validator: (value) {
                    if (emailController.text.isNotEmpty) {
                      return null;
                    } else {
                      return 'Please enter your email address';
                    }
                    if (emailController.text.contains("@")) {
                      return null;
                    } else {
                      return 'Please enter a valid email address';
                    }
                    if (value != email) {
                      return 'Email is not valid';
                    } else {
                      return null;
                    }
                  }),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: TextFormField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    labelText: "Your Password",
                    border: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 1, color: Colors.green.shade300),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  validator: (value) {
                    if (passwordController.text.isNotEmpty) {
                      return null;
                    } else {
                      return 'Please enter your password';
                    }
                    if (passwordController.text.length >= 6) {
                      return null;
                    } else {
                      return 'Password should have more than 6 charectors';
                    }
                    if (value != password) {
                      return 'Password does not match';
                    } else {
                      return null;
                    }
                  }),
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    if (emailController.text == email &&
                        passwordController.text == password) {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                        (Route<dynamic> route) => false,
                      );
                    }
                  }
                },
                child: Center(child: Text("Sign in")),
                style: ButtonStyle(
                  minimumSize:
                      MaterialStateProperty.all(Size(double.infinity, 45)),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
            ),
            Spacer(),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?"),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RegistrationPage(),
                              ));
                        },
                        child: Text(
                          "Sign Up",
                          style: TextStyle(color: Colors.blue),
                        ))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
