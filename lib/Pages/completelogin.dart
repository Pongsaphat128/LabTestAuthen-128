import 'package:authentest_128/Pages/login.dart';
import 'package:flutter/material.dart';
import '../service/auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

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

  List<Widget> createDataList(QuerySnapshot<Map<String, dynamic>>? data) {
    List<Widget> widgets = [];
    widgets = data!.docs.map((doc) {
      var data = doc.data();
      print(data['product_name']);
      return ListTile(
        onTap: () {
          print(doc.id);
          // ดึงข้อมูล มาแสดง เพื่อแก้ไข
        },
        title: Text(data['name'] + ", " + data['tel'].toString() + ""),
        subtitle: Text(data['type']),
      );
    }).toList();

    return widgets;
  }
}
