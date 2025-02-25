import 'package:flutter/material.dart';

class MarineAnimalsScreen extends StatelessWidget {
  const MarineAnimalsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> marineAnimals = [
      {'image': 'assets/images/ballena.png'},
      {'image': 'assets/images/delfin.png'},
      {'image': 'assets/images/foca.png'},
    ];

    return Scaffold(
      appBar: AppBar(title: Text('Animales Marinos'),toolbarHeight: 28),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 45),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1.2,
          ),
          itemCount: marineAnimals.length,
          itemBuilder: (context, index) {
            final animal = marineAnimals[index];
            return _buildAnimalTile(animal['image']!);
          },
        ),
      ),
    );
  }

  Widget _buildAnimalTile( String image) {
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
    );
  }
}
