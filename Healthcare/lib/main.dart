import 'package:flutter/material.dart';
import 'package:form_login/homepage.dart';
import 'login.dart';
import 'register.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
      '/': (context) => HomePage(),
      '/login': (context) => Login(),
      '/register': (context) => Register(),
      '/homepage': (context) => HomePage(),
  },
  debugShowCheckedModeBanner: false,
    );
    
  }
}