import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class TransportsScreen extends StatelessWidget {
  const TransportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> transports = [
      {'name': '','image': 'assets/images/tren.png', 'sound': 'trenAudio.mp3'},
      {'name': '','image': 'assets/images/avion.png', 'sound': 'avionAudio.mp3'},
      {'name': '','image': 'assets/images/barco.png', 'sound': 'barcoAudio.mp3'},
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
              itemCount: transports.length,
              itemBuilder: (context, index) {
                final transport = transports[index];
                return _buildAnimalTile(transport['name']!, transport['image']!, transport['sound']!);
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
