import 'package:flutter/material.dart';
import 'package:signup/main.dart';
import 'package:signup/views/login_page/login_page.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
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
                "Sign Up for Free",
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
                    if (passwordController.text.isEmpty) {
                      return 'Please enter your password';
                    } else {
                      return null;
                    }
                    if (passwordController.text.length >= 6) {
                      return null;
                    } else {
                      return 'Password should have more than 6 charectors';
                    }
                  }),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: TextFormField(
                  controller: confirmPasswordController,
                  decoration: InputDecoration(
                    labelText: "Your Confirm Password",
                    border: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 1, color: Colors.green.shade300),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  validator: (value) {
                    if (passwordController.text.isEmpty) {
                      return 'Please enter your password';
                    } else {
                      return null;
                    }
                    if (confirmPasswordController.text ==
                        passwordController.text) {
                      return null;
                    } else {
                      return 'Password does not match!';
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
                  setState(() {});
                  if (_formKey.currentState!.validate()) {
                    email = emailController.text;
                    password = passwordController.text;
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ));
                  }
                },
                child: Center(child: Text("Sign Up")),
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
                    Text("Already have an account?"),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginPage(),
                              ));
                        },
                        child: Text(
                          "Sign In",
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
