import 'package:flutter/material.dart';
import 'package:authentest_128/Pages/login.dart';
import 'package:authentest_128/service/auth_service.dart';
import 'package:auth_buttons/auth_buttons.dart';

class Registerpage extends StatefulWidget {
  const Registerpage({super.key});

  @override
  State<Registerpage> createState() => _RegisterpageState();
}

class _RegisterpageState extends State<Registerpage> {
  final _fromkey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _tel = TextEditingController();
  final TextEditingController _name = TextEditingController();
  String? status;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("REGISTER"),
      ),
      body: SafeArea(
        child: Form(
          key: _fromkey,
          child: ListView(
            children: [
              buildEmailInput(),
              buildPasswordInput(),
              buildNameInput(),
              buildTelInput(),
              RadioListTile(
                title: Text("อาจารย์"),
                value: "อาจารย์",
                groupValue: status,
                onChanged: (value) {
                  setState(() {
                    status = value.toString();
                  });
                },
              ),
              RadioListTile(
                title: Text("นิสิต"),
                value: "นิสิต",
                groupValue: status,
                onChanged: (value) {
                  setState(() {
                    status = value.toString();
                  });
                },
              ),
              RadioListTile(
                title: Text("เจ้าหน้าที่"),
                value: "เจ้าหน้าที่",
                groupValue: status,
                onChanged: (value) {
                  setState(() {
                    status = value.toString();
                  });
                },
              ),
              buildEmailSignUp(),
            ],
          ),
        ),
      ),
    );
  }

  TextFormField buildEmailInput() {
    return TextFormField(
      controller: _email,
      validator: (value) {
        if (value!.isEmpty) {
          return "กรุณากรอก Email";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "E-mail",
      ),
    );
  }

  TextFormField buildPasswordInput() {
    return TextFormField(
      controller: _password,
      validator: (value) {
        if (value!.isEmpty) {
          return "กรุณากรอก Password";
        }
        return null;
      },
      obscureText: true,
      decoration: const InputDecoration(
        labelText: "Password",
      ),
    );
  }

  Widget buildNameInput() {
    return TextFormField(
      controller: _name,
      decoration: const InputDecoration(labelText: "Name"),
    );
  }

  Widget buildTelInput() {
    return TextFormField(
      controller: _tel,
      decoration: const InputDecoration(
        labelText: "Tel",
      ),
    );
  }

  Widget buildEmailSignUp() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: EmailAuthButton(
        text: "Sing Up",
        onPressed: () {
          AuthService()
              .signUpWithEmail(
                  _email.text, _password.text, _name.text, _tel.text)
              .then((value) => Navigator.pop(context));
        },
      ),
    );
  }
}
