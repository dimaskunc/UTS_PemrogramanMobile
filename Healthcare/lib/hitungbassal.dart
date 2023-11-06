import 'package:flutter/material.dart';

enum Gender { male, female }

class hitungbassalScreen extends StatefulWidget {
  @override
  _hitungbassalScreenState createState() => _hitungbassalScreenState();
}

class _hitungbassalScreenState extends State<hitungbassalScreen> {
  double weight = 0.0;
  double height = 0.0;
  int age = 0;
  Gender selectedGender = Gender.male;
  double bmr = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perhitungan Energi Bassal'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Masukkan Informasi Anda',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Radio(
                    value: Gender.male,
                    groupValue: selectedGender,
                    onChanged: (value) {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                  ),
                  Text('Pria'),
                  Radio(
                    value: Gender.female,
                    groupValue: selectedGender,
                    onChanged: (value) {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                  ),
                  Text('Wanita'),
                ],
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Berat Badan (kg)',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    weight = double.parse(value);
                  });
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Tinggi Badan (cm)',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    height = double.parse(value);
                  });
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Usia',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    age = int.parse(value);
                  });
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  calculateBMR();
                },
                child: Text('Hitung BMR'),
              ),
              SizedBox(height: 20),
              Text(
                'Besar BMR adalah : ${bmr.toStringAsFixed(2)} kalori/hari',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
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

  void calculateBMR() {
    if (selectedGender == Gender.male) {
      // Rumus Harris-Benedict untuk pria
      bmr = 88.362 + (13.397 * weight) + (4.799 * height) - (5.677 * age);
    } else {
      // Rumus Harris-Benedict untuk wanita
      bmr = 447.593 + (9.247 * weight) + (3.098 * height) - (4.330 * age);
    }
     setState(() {});
  }
}
