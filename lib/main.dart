import 'package:api_container/user_container.dart';
import 'package:flutter/material.dart';
import 'user_container.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: UserContainer(),
    );
  }
}
