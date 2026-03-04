import 'package:flutter/material.dart';
import 'widgets/pantalla1.dart';
import 'widgets/pantalla2.dart';
import 'widgets/pantalla3_inicio.dart';
import 'widgets/pantalla4_restaurantes.dart';
import 'widgets/pantalla5_pequenocesar.dart';
import 'widgets/pantalla6_pizza.dart';


void main() {
  runApp(const RappiApp());
}

class RappiApp extends StatelessWidget {
  const RappiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rappi Carlos 6I',
      // Definimos la pantalla de inicio
      home: const PantallaCuentas(),
      // Rutas para navegar entre las 6 pantallas que crearemos
      routes: {
        '/direccion': (context) => const PantallaDireccion(),
        '/home': (context) => const HomePage(),
        '/restaurantes': (context) => const RestaurantesScreen(),
        '/pequenocesar': (context) => const LittleCaesarsScreen(),
        '/detalle_pizza': (context) => const PantallaDetallePizza(),
      },
    );
  }
}