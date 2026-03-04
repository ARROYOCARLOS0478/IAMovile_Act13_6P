import 'package:flutter/material.dart';

class PantallaDetallePizza extends StatefulWidget {
  const PantallaDetallePizza({super.key});

  @override
  State<PantallaDetallePizza> createState() => _PantallaDetallePizzaState();
}

class _PantallaDetallePizzaState extends State<PantallaDetallePizza> {
  int _cantidad = 1;
  final double _precioUnitario = 139.00;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(icon: const Icon(Icons.close, size: 30), onPressed: () => Navigator.pop(context)),
                    Center(child: Image.network('https://raw.githubusercontent.com/ARROYOCARLOS0478/imagenes/refs/heads/main/pepperoni.png', height: 220)),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('\$${_precioUnitario.toStringAsFixed(2)}', style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black)),
                          const Text('Pizza de Pepperoni', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 10),
                          const Text('Deliciosa pizza clásica con pepperoni crujiente y queso derretido.', style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            // BOTONES DE ABAJO CON MISMO ANCHO
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(color: Colors.white, border: Border(top: BorderSide(color: Colors.grey.shade200))),
              child: Row(
                children: [
                  // Selector de cantidad (Ancho 1/2)
                  Expanded(
                    child: Container(
                      height: 55,
                      decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(30)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(icon: const Icon(Icons.remove, color: Colors.green), onPressed: () => setState(() => _cantidad > 1 ? _cantidad-- : null)),
                          Text('$_cantidad', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          IconButton(icon: const Icon(Icons.add, color: Colors.green), onPressed: () => setState(() => _cantidad++)),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  // Botón Agregar (Ancho 1/2)
                  Expanded(
                    child: SizedBox(
                      height: 55,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF00BA56),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                        ),
                        onPressed: () {},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Agregar', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                            Text('\$${(_precioUnitario * _cantidad).toStringAsFixed(2)}', style: const TextStyle(color: Colors.white70, fontSize: 12)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}