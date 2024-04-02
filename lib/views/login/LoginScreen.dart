import 'package:flutter/material.dart';
import 'package:oopportinitie/views/login/LoginPage1.dart';
import 'login_page.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: const LoginPage(),
    );
  }
}
