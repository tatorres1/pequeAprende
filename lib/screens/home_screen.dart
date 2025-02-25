import 'package:flutter/material.dart';
import 'package:peque_aprende/screens/category_screen.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/home_background.jpg'), 
                fit: BoxFit.cover     ,
              ),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CategoryScreen()),
                );
              },
              child: Text('Iniciar', style: TextStyle(fontSize: 24)),
            ),
          ),
        ],
      ),
    );
  }
}
