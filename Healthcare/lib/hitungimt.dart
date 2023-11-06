import 'package:flutter/material.dart';

class hitungIMT extends StatefulWidget {
  @override
  _hitungIMTState createState() => _hitungIMTState();
}

class _hitungIMTState extends State<hitungIMT> {
  double weight = 0.0;
  double height = 0.0;
  double bmi = 0.0;
  String gender = 'Pria'; // Nilai awal pria
  int age = 0;
  bool calculationDone = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perhitungan Index Massa Tubuh'),
      ),
      body: SingleChildScrollView(
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
                    value: 'Pria',
                    groupValue: gender,
                    onChanged: (value) {
                      setState(() {
                        gender = value!;
                      });
                    },
                  ),
                  Text('Pria'),
                  Radio(
                    value: 'Wanita',
                    groupValue: gender,
                    onChanged: (value) {
                      setState(() {
                        gender = value!;
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
                  labelText: 'Usia (tahun)',
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
                  setState(() {
                    // Hitung BMI (berat dalam kg, tinggi dalam cm)
                    bmi = weight / ((height / 100) * (height / 100));
                    calculationDone = true;
                  });
                },
                child: Text('Hitung Index Masa Tubuh'),
              ),
              SizedBox(height: 20),
              if (calculationDone)
                Column(
                  children: [
                    Text(
                      'Jenis Kelamin: $gender',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      'Usia: $age tahun',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Index Masa Tubuh Anda: ${bmi.toStringAsFixed(2)}',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Kategori: ${getCategory(bmi)}',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Kebutuhan Kalori: ${calculateCalories(bmi, gender, age).toStringAsFixed(2)} kkal',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      'Kebutuhan Karbohidrat: ${(calculateCarbohydrates(bmi)).toStringAsFixed(2)} gram',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      'Kebutuhan Lemak: ${(calculateFat(bmi)).toStringAsFixed(2)} gram',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      'Kebutuhan Protein: ${(calculateProtein(bmi)).toStringAsFixed(2)} gram',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
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

  String getCategory(double bmi) {
    if (gender == 'Pria') {
      if (bmi < 18.5) {
        return 'Underweight';
      } else if (bmi >= 18.5 && bmi < 24.9) {
        return 'Normal Weight';
      } else if (bmi >= 25.0 && bmi < 29.9) {
        return 'Overweight';
      } else {
        return 'Obese';
      }
    } else {
      if (bmi < 17.5) {
        return 'Underweight';
      } else if (bmi >= 17.5 && bmi < 23.9) {
        return 'Normal Weight';
      } else if (bmi >= 24.0 && bmi < 28.9) {
        return 'Overweight';
      } else {
        return 'Obese';
      }
    }
  }

  double calculateCalories(double bmi, String gender, int age) {
    if (gender == 'Pria') {
      return (88.362 + (13.397 * weight) + (4.799 * height) - (5.677 * age)) * 1.55;
    } else {
      return (447.593 + (9.247 * weight) + (3.098 * height) - (4.330 * age)) * 1.55;
    }
  }

  double calculateCarbohydrates(double bmi) {
    return (0.5 * calculateCalories(bmi, gender, age) / 4);
  }

  double calculateFat(double bmi) {
    return (0.3 * calculateCalories(bmi, gender, age) / 9);
  }

  double calculateProtein(double bmi) {
    return (0.2 * calculateCalories(bmi, gender, age) / 4);
  }
}

void main() => runApp(MaterialApp(home: hitungIMT(),));
