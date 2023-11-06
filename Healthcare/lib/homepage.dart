import 'package:flutter/material.dart';
import 'login.dart';
import 'register.dart';
import 'dashboard.dart';

void main() => runApp(MaterialApp(home: HomePage()));

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Health Care Pedia'),
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Logo atau gambar Anda dapat ditambahkan di sini
            Image.asset('images/klinik.jpg', width: 150, height: 150),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    // Aksi yang ingin Anda lakukan ketika tombol Login ditekan
                    // Misalnya, pindah ke halaman login
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
                  },
                  child: Text('Login'),
                ),
                SizedBox(width: 20), // Spasi horizontal antara tombol Login dan Register
                ElevatedButton(
                  onPressed: () {
                    // Aksi yang ingin Anda lakukan ketika tombol Register ditekan
                    // Misalnya, pindah ke halaman registrasi
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Register()));
                  },
                  child: Text('Register'),
                ),
              ],
            ),
            SizedBox(height: 20), // Spasi horizontal antara tombol Login dan Register
                ElevatedButton(
                  onPressed: () {
                    // Aksi yang ingin Anda lakukan ketika tombol Register ditekan
                    // Misalnya, pindah ke halaman registrasi
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Dashboard()));
                  },
                  child: Text('Cek Sekarang Yuk'),
                ),
                SizedBox(height: 20),
                Text('Dokter Praktek', style: TextStyle(fontWeight:FontWeight.bold)),
                 Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Card(
                  child: Column(
                    children: <Widget>[
                      Image.asset('images/dokter 1.jpg', fit: BoxFit.cover, width: 100, height: 150),
                      Text('dr. Asmoro'),
                    ],
                  ),
                ),
                Card(
                  child: Column(
                    children: <Widget>[
                      Image.asset('images/dokter 2.jpg', fit: BoxFit.cover, width: 100, height: 150),
                      Text('dr. Fitriana'),
                    ],
                  ),
                ),
                Card(
                  child: Column(
                    children: <Widget>[
                      Image.asset('images/dokter 3.jpg', fit: BoxFit.cover, width: 100, height: 150),
                      Text('dr. Raharjo'),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
                Text('Layanan', style: TextStyle(fontWeight:FontWeight.bold)),
                 Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Card(
                  child: Column(
                    children: <Widget>[
                      Image.asset('images/kategori1.png', fit: BoxFit.cover, width: 100, height: 150),
                      Text('Cek Kesehatan'),
                    ],
                  ),
                ),
                Card(
                  child: Column(
                    children: <Widget>[
                      Image.asset('images/kategori2.png', fit: BoxFit.cover, width: 100, height: 150),
                      Text('Pengobatan'),
                    ],
                  ),
                ),
                Card(
                  child: Column(
                    children: <Widget>[
                      Image.asset('images/kategori3.png', fit: BoxFit.cover, width: 100, height: 150),
                      Text('Konsultasi'),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
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
    );
  }
}
