import 'package:flutter/material.dart';

class JungleAnimalsScreen extends StatelessWidget {
  const JungleAnimalsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> jungleAnimals = [
      {'name': '', 'image': 'assets/images/boa.png'},
      {'name': '', 'image': 'assets/images/lemur.png'},
      {'name': '', 'image': 'assets/images/parrot.png'},
      {'name': '', 'image': 'assets/images/monkey.png'},
      {'name': '', 'image': 'assets/images/tucan.png'},
    ];

    return Scaffold(
      appBar: AppBar(title: Text('Animales de Jungla'),toolbarHeight: 28),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 45),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1.2,
          ),
          itemCount: jungleAnimals.length,
          itemBuilder: (context, index) {
            final animal = jungleAnimals[index];
            return _buildAnimalTile(animal['name']!, animal['image']!);
          },
        ),
      ),
    );
  }

  Widget _buildAnimalTile(String name, String image) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.all(8),
      child: Text(
        name,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          backgroundColor: Colors.black.withOpacity(0.5),
        ),
      ),
    );
  }
}
