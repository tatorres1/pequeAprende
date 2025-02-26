import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class JungleAnimalsScreen extends StatelessWidget {
  const JungleAnimalsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> jungleAnimals = [
      {'name': '', 'image': 'assets/images/serpiente.png', 'sound': 'boaAudio.mp3'},
      {'name': '', 'image': 'assets/images/lemur.png', 'sound': 'lemurAudio.mp3'},
      {'name': '', 'image': 'assets/images/parrot.png', 'sound': 'loroAudio.mp3'},
      {'name': '', 'image': 'assets/images/monkey.png', 'sound': 'monoAudio.mp3'},
      {'name': '', 'image': 'assets/images/tucan.png', 'sound': 'tucanAudio.mp3'},
      {'name': '', 'image': 'assets/images/rana.png', 'sound': 'rana.mp3'},
    ];

    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.9,
              child: GridView.count(
                crossAxisCount: 3,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 1.6,
                children: List.generate(6, (index) {
                  return _buildAnimalTile(
                    jungleAnimals[index]['name']!,
                    jungleAnimals[index]['image']!,
                    jungleAnimals[index]['sound']!,
                    isCenter: index == 2,
                  );
                }),
              ),
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

  Widget _buildAnimalTile(String name, String image, String sound, {bool isCenter = false}) {
    return GestureDetector(
      onTap: () => _playSound(sound),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(12),
          border: isCenter ? Border.all(color: const Color.fromARGB(255, 253, 252, 252), width: 3) : null,
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
