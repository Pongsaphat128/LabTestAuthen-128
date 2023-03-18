import 'package:authentest_128/Pages/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../service/auth_service.dart';

class completelogin extends StatefulWidget {
  const completelogin({super.key});

  @override
  State<completelogin> createState() => _completeloginState();
}

class _completeloginState extends State<completelogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Text("Login complete"),
            Icon(Icons.check_outlined, color: Colors.green),
            ElevatedButton(
                onPressed: () {
                  AuthService.logOutUser();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Loginpage()));
                },
                child: const Text("Logout"))
          ],
        ),
      ),
    );
  }
}
