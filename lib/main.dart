import 'package:flutter/material.dart';
import 'package:plantoria/screens/signup_page.dart';

void main() {
  runApp(Plantoria());
}

class Plantoria extends StatelessWidget {
  const Plantoria({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: SignupPage());
  }
}
