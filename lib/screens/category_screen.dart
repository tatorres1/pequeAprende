import 'package:flutter/material.dart';
import 'package:peque_aprende/screens/africa_animals_screen.dart';
import 'package:peque_aprende/screens/jungle_animals_screen.dart'; 
import 'package:peque_aprende/screens/farm_animals_screen.dart';
import 'package:peque_aprende/screens/transports_screen.dart'; 

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Selecciona una categoría'),toolbarHeight: 28,centerTitle: true,),
      body: Center( // Centrar el GridView
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 45),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                crossAxisSpacing: 8, 
                mainAxisSpacing: 8, 
                childAspectRatio: 2.2,
                //physics: NeverScrollableScrollPhysics(), 
                children: [
                  _buildCategoryTile(context, '', 'assets/images/farm.png', FarmAnimalsScreen()),
                  _buildCategoryTile(context, '', 'assets/images/jungle.png', JungleAnimalsScreen()),
                  _buildCategoryTile(context, '', 'assets/images/africa.png',  AfricaAnimalsScreen()),
                  _buildCategoryTile(context, '', 'assets/images/transporte.png', TransportsScreen ()),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryTile(BuildContext context, String title, String image, Widget screen) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => screen),
        
        );
      },
      child: Container(
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
          title,
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
}
