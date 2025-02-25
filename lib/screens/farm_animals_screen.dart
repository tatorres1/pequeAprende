import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class FarmAnimalsScreen extends StatelessWidget {
  const FarmAnimalsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> farmAnimals = [
      {'name': '', 'image': 'assets/images/cow.png', 'sound': 'vacaAudio.mp3'},
      {'name': '', 'image': 'assets/images/chicken.png', 'sound': 'gallinaAudio.mp3'},
      {'name': '', 'image': 'assets/images/sheep.png', 'sound': 'ovejaAudio.mp3'},
      {'name': '', 'image': 'assets/images/horse.png', 'sound': 'caballoAudio.mp3'},
    ];

    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 2.8,
              ),
              itemCount: farmAnimals.length,
              itemBuilder: (context, index) {
                final animal = farmAnimals[index];
                return _buildAnimalTile(animal['name']!, animal['image']!, animal['sound']!);
              },
            ),
          ),

          
          Positioned(
            top: 20,  
            left: 10, 
            child: Container(
              decoration: BoxDecoration(
                color: Colors.purple[200], 
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 4,
                    offset: Offset(2, 2),
                  ),
                ],
              ),
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAnimalTile(String name, String image, String sound) {
    return GestureDetector(
      onTap: () => _playSound(sound),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        alignment: Alignment.bottomCenter,
        padding: const EdgeInsets.all(8),
        child: Text(
          name,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            backgroundColor: Colors.black.withOpacity(0.5),
          ),
        ),
      ),
    );
  }

  void _playSound(String sound) async {
    final player = AudioPlayer();
    await player.play(AssetSource('sounds/$sound'));
  }
}
