import 'package:flutter/material.dart';

class PantallaCuentas extends StatelessWidget {
  const PantallaCuentas({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 50),
            // Logo de Rappi en el centro superior
            Center(
              child: Image.network(
                'https://raw.githubusercontent.com/ARROYOCARLOS0478/imagenes/refs/heads/main/icon_rappi.png',
                height: 50,
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'Elige una cuenta',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 20),
            // Fila de la cuenta existente
            ListTile(
              leading: const CircleAvatar(
                backgroundColor: Color.fromARGB(255, 216, 17, 216),
                child: Icon(Icons.person, color: Color.fromARGB(255, 255, 255, 255)),
              ),
              title: const Text('Carlos Arroyo'),
              subtitle: const Text('carlos.arroyo@gmail.com'),
              onTap: () {
                // Navega a la pantalla de dirección
                Navigator.pushNamed(context, '/direccion');
              },
            ),
            const Divider(),
            // Opción de agregar otra cuenta
            ListTile(
              leading: const Icon(Icons.person_add_alt_1_outlined),
              title: const Text('Agregar otra cuenta'),
              onTap: () {
                // Aquí podrías poner otra lógica
              },
            ),
          ],
        ),
      ),
    );
  }
}