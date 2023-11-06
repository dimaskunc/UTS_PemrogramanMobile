import 'package:flutter/material.dart';
import 'package:form_login/dashboard.dart';

class Login extends StatelessWidget {
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
          title: Text('Login Form'),
        ),
        body: LoginForm(),
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

class LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Email'
            ),
          ),
          SizedBox(height: 20.0),
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Password'
            ),
            obscureText: true,
          ),
          Row(
            children: <Widget>[
              Checkbox(
                value: false, // Anda dapat mengatur nilai awal sesuai kebutuhan
                onChanged: (value) {
                  // Tambahkan logika yang sesuai di sini
                },
              ),
              Text('Remember Me'),
            ],
          ),
          InkWell(
            onTap: () {
              // Tambahkan logika untuk tautan "Forgot Password" di sini
            },
            child: Text(
              'Forgot Password?',
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
          ),
          SizedBox(height: 10.0),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Dashboard()),
              );
            },
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(Size(150, 50)), // Atur lebar dan tinggi yang Anda inginkan
            ),
            child: Text('Login', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          ),
        ],
      ),
    );
  }
}
