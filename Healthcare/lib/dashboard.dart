import 'package:flutter/material.dart';
import 'package:form_login/hitungbassal.dart';
import 'package:form_login/hitungimt.dart';
import 'package:form_login/hitungexpenditure.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, 
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
               // Tambahkan logika untuk kembali ke halaman utama
              Navigator.pop(context);
            },
          ),
          title: Text('Dashboard'),
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
        body: DashboardContent(),
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

class DashboardContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Hallo, Dimas Febri Kuncoro',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, ),
          ),
          Text(
            'Selamat Datang di Health Care Pedia',
            style: TextStyle(fontSize: 16,),
          ),
          SizedBox(height: 20.0),
          TextField(
            decoration: InputDecoration(
              hintText: 'Cari Informasi Gizi',
              border: OutlineInputBorder(),
              filled: true,
              fillColor: Colors.grey[200],
              focusedBorder: InputBorder.none, // Menghilangkan garis biru saat diberi fokus
              enabledBorder: InputBorder.none,
              suffixIcon: Icon(Icons.search),
            ),
          ),
          SizedBox(height: 20.0),
          Container(
                child: Card(
                   color: Color.fromARGB(255, 192, 114, 248),
                  elevation: 4,
                  child: ListTile(
                    title: Text(
                      'Index Masa Tubuh',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      'Ketahui status gizimu melalui perbandingan berat dan tinggi badan'),
                      trailing: ElevatedButton(
        onPressed: () {
         Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => hitungIMT()), // Ganti dengan nama layar perhitungan BMI yang sesuai
          );
        },
        child: Text('Cek Sekarang'),
      ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                child: Card(
                  color: Color.fromARGB(255, 236, 111, 170),
                  elevation: 4,
                  child: ListTile(
                    title: Text(
                      'Energi Basal',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      'Ketahui kebutuhan energi yang dibutuhkan tubuhmu untuk menjalankan fungsi fisiologis tubuh'),
                      trailing: ElevatedButton(
        onPressed: () {
           Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => hitungbassalScreen()), // Ganti dengan nama layar perhitungan BMI yang sesuai
          );// Tambahkan logika ketika tombol ditekan di sini
        },
        child: Text('Cek Sekarang'),
      ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                child: Card(
                  color: Color.fromARGB(255, 236, 218, 113),
                  elevation: 4,
                  child: ListTile(
                    title: Text(
                      'Energi Expenditure',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      'Ketahui kebutuhan energi yang dibutuhkan tubuhmu untuk mempertahankan kehidupan'),
                      trailing: ElevatedButton(
        onPressed: () {Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => EnergyExpenditureCalculator()), // Ganti dengan nama layar perhitungan BMI yang sesuai
          );          
        },
        child: Text('Cek Sekarang'),
      ),
                  ),
                ),
              ),
        ],
      ),
    );
  }
}
