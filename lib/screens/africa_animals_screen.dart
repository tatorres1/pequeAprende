import 'package:flutter/material.dart';

class AfricaAnimalsScreen extends StatelessWidget {
  const AfricaAnimalsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> africaAnimals = [
      {'name': '', 'image': 'assets/images/hiena.png'},
      {'name': '', 'image': 'assets/images/elefante.png'},
      {'name': '', 'image': 'assets/images/leon.png'},
      {'name': '', 'image': 'assets/images/zebra.png'},
      {'name': '', 'image': 'assets/images/hipo.png'},
    ];

    return Scaffold(
      appBar: AppBar(title: Text('Animales de Africa'),toolbarHeight: 28),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 45),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1.2,
          ),
          itemCount: africaAnimals.length,
          itemBuilder: (context, index) {
            final animal = africaAnimals[index];
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
