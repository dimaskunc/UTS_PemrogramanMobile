import 'package:flutter/material.dart';
import 'package:form_login/login.dart';
import 'package:form_login/dashboard.dart';

class Register extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, 
      home: Scaffold(
        appBar: AppBar(
           leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text('Register Form'),
          actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
            },
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
            },
          ),
        ],
        ),
        body: RegisterForm(),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Explore',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.email),
              label: 'Message',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_rounded),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}

class RegisterForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(border: OutlineInputBorder(),
            hintText: 'Username'),
          ),
          SizedBox(height: 20.0),
          TextFormField(
            decoration: InputDecoration(border: OutlineInputBorder(),
            hintText: 'Email'),
          ),
          SizedBox(height: 20.0),
          TextFormField(
            decoration: InputDecoration(border: OutlineInputBorder(),
            hintText: 'Password'),
            obscureText: true,
          ),
          SizedBox(height: 20.0),
          TextFormField(
            decoration: InputDecoration(border: OutlineInputBorder(),
            hintText: 'Confirm Password'),
            obscureText: true,
          ),
          SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () {
               Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Dashboard()), // Ganti dengan nama layar perhitungan BMI yang sesuai
          );   
            },
            style: ButtonStyle(
    minimumSize: MaterialStateProperty.all(Size(150, 50)), // Atur lebar dan tinggi yang Anda inginkan
  ),
            child: Text('Sign Up', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
          ),
          SizedBox(height: 20.0),
          Text('Have an Account ?'),
          InkWell(
            onTap: () {
             Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Login()), // Ganti dengan nama layar perhitungan BMI yang sesuai
          );          
            },
            child: Text('Login Here',style: TextStyle(
      color: Colors.blue,),),
          ),
        ],
      ),
    );
  }
}

