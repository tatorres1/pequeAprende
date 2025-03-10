import 'package:flutter/material.dart';
import 'package:peque_aprende/screens/home_screen.dart'; // Importa la pantalla de inicio
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized(); // Asegura la inicialización de los widgets antes de ejecutar la aplicación

  // Configura la orientación de la pantalla para que solo funcione en modo horizontal
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]).then((_) {
    runApp(MyApp()); // Inicia la aplicación
  });
}

// Define la clase principal de la aplicación
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Oculta la bandera de depuración en la esquina superior derecha
      title: 'PequeAprende', // Título de la aplicación
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple), // Configura el esquema de colores basado en un color semilla
        useMaterial3: true, // Habilita Material 3 para una apariencia moderna
      ),
      home: HomeScreen(), // Define la pantalla de inicio de la aplicación
    );
  }
}
