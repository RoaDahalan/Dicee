import 'package:flutter/material.dart';
import 'dart:math'; // <-- لإضافة العشوائية

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 13),
        child: Scaffold(
          backgroundColor: Colors.white60,
          appBar: AppBar(
            backgroundColor: Colors.orange,
            title: const Text(
              "Dicee",
              style: TextStyle(fontSize: 30),
            ),
            centerTitle: true,
          ),
          body: const MyApp2(),
        ),
      ),
    );
  }
}

class MyApp2 extends StatefulWidget {
  const MyApp2({super.key});

  @override
  State<MyApp2> createState() => _MyApp2State();
}

class _MyApp2State extends State<MyApp2> {
  int leftDice = 1;
  int rightDice = 1;

  void rollDice() {
    setState(() {
      leftDice = Random().nextInt(6) + 1;  // من 1 إلى 6
      rightDice = Random().nextInt(6) + 1;
    });
  }

  String getDiceImage(int number) {
    return 'https://upload.wikimedia.org/wikipedia/commons/${_imagePaths[number - 1]}';
  }

  // روابط صور أوجه النرد من ويكيبيديا
  final List<String> _imagePaths = [
    '2/2c/Alea_1.png',
    'b/b8/Alea_2.png',
    '2/2f/Alea_3.png',
    '8/8d/Alea_4.png',
    '5/55/Alea_5.png',
    'f/f4/Alea_6.png',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 26, horizontal: 17),
        child: Column(
          children: [
            Container(
              height: 200,
              width: 390,
              decoration: BoxDecoration(
                color: Colors.deepOrangeAccent,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // Dice 1
                    Container(
                      height: 137,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image: NetworkImage(getDiceImage(leftDice)),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    // Divider
                    SizedBox(
                      height: 180,
                      width: 12,
                      child: Container(
                        color: Colors.black54,
                      ),
                    ),

                    // Dice 2
                    Container(
                      height: 137,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image: NetworkImage(getDiceImage(rightDice)),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: rollDice,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orangeAccent,
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
              child: const Text("رمي النرد", style: TextStyle(fontSize: 20)),
            ),
          ],
        ),
      ),
    );
  }
}
