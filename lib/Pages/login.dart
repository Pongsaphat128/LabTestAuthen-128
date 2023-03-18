import 'package:authentest_128/service/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:authentest_128/Pages/completelogin.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final _fromkey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: SafeArea(
          child: Form(
        key: _fromkey,
        child: ListView(
          children: [
            Text("Email : "),
            TextFormField(
              controller: _emailController,
            ),
            Text("Password :"),
            TextFormField(
              controller: _passwordController,
            ),
            ElevatedButton(
                onPressed: () {
                  if (_fromkey.currentState!.validate()) {
                    AuthService.loginUser(
                            _emailController.text, _passwordController.text)
                        .then((value) {
                      if (value == 1) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => completelogin()),
                        );
                      }
                    });
                    ;
                  }
                },
                child: const Text("Login")),
          ],
        ),
      )),
    );
  }
}
