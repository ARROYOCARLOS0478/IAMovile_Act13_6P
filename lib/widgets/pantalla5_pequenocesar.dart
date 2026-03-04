import 'package:flutter/material.dart';

class Pizza {
  final String image;
  final String title;
  final String price;
  const Pizza({required this.image, required this.title, required this.price});
}

class LittleCaesarsScreen extends StatefulWidget {
  const LittleCaesarsScreen({super.key});
  @override
  State<LittleCaesarsScreen> createState() => _LittleCaesarsScreenState();
}

class _LittleCaesarsScreenState extends State<LittleCaesarsScreen> {
  String _categoriaSeleccionada = 'PIZZAS';

  final List<Pizza> _pizzas = [
    const Pizza(image: 'https://raw.githubusercontent.com/ARROYOCARLOS0478/imagenes/refs/heads/main/queso.png', title: 'Queso', price: '\$129.00'),
    const Pizza(image: 'https://raw.githubusercontent.com/ARROYOCARLOS0478/imagenes/refs/heads/main/pepperoni.png', title: 'Pepperoni', price: '\$119.00'),
    const Pizza(image: 'https://raw.githubusercontent.com/ARROYOCARLOS0478/imagenes/refs/heads/main/queso-pp.png', title: 'Doble!', price: '\$139.00'),
    const Pizza(image: 'https://raw.githubusercontent.com/ARROYOCARLOS0478/imagenes/refs/heads/main/mexicana.png', title: 'Mexicana!', price: '\$149.00'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 211, 163),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeaderImage(),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text("Little Caesars", style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
            ),
            _buildStatsContainer(),
            const SizedBox(height: 20),
            _buildCategoryTabs(), // Tabs corregidos aquí
            const SizedBox(height: 10),
            _buildProductSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderImage() {
    return Stack(
      children: [
        Container(
          height: 200, width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(fit: BoxFit.cover, image: NetworkImage('https://raw.githubusercontent.com/ARROYOCARLOS0478/imagenes/refs/heads/main/little-ca.PNG')),
          ),
        ),
        Positioned(top: 40, left: 15, child: CircleAvatar(backgroundColor: Colors.white, child: IconButton(icon: const Icon(Icons.close, color: Colors.black), onPressed: () => Navigator.pop(context)))),
      ],
    );
  }

  Widget _buildStatsContainer() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildStatColumn(titulo: "Entrega", valor: "24 min"),
          _buildStatColumn(titulo: "Envío", valor: "Gratis", isGreen: true),
          _buildStatColumn(titulo: "Rating", valor: "4.8", showStar: true),
        ],
      ),
    );
  }

  Widget _buildStatColumn({required String titulo, required String valor, bool isGreen = false, bool showStar = false}) {
    return Column(children: [
      Text(titulo, style: const TextStyle(color: Colors.grey, fontSize: 12)),
      Row(children: [
        Text(valor, style: TextStyle(fontWeight: FontWeight.bold, color: isGreen ? Colors.green : Colors.black)),
        if (showStar) const Icon(Icons.star, size: 14, color: Colors.orange),
      ])
    ]);
  }

  // --- RECONSTRUCCIÓN DE LOS TABS ORIGINALES ---
  Widget _buildCategoryTabs() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey, width: 0.5))),
      child: Row(
        children: [
          _buildTabItem("PIZZAS"),
          const SizedBox(width: 25),
          _buildTabItem("COMBOS"),
        ],
      ),
    );
  }

  Widget _buildTabItem(String title) {
    final bool isSelected = _categoriaSeleccionada == title;
    return InkWell(
      onTap: () => setState(() => _categoriaSeleccionada = title),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        decoration: BoxDecoration(border: isSelected ? const Border(bottom: BorderSide(color: Colors.orange, width: 3)) : null),
        child: Text(title, style: TextStyle(fontSize: 16, fontWeight: isSelected ? FontWeight.bold : FontWeight.normal, color: isSelected ? Colors.black : Colors.grey)),
      ),
    );
  }

  Widget _buildProductSection() {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.8, crossAxisSpacing: 10, mainAxisSpacing: 10),
      itemCount: _pizzas.length,
      itemBuilder: (context, index) => _buildProductCard(_pizzas[index]),
    );
  }

  Widget _buildProductCard(Pizza pizza) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          if (pizza.title == 'Pepperoni') Navigator.pushNamed(context, '/detalle_pizza');
        },
        child: Container(
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
          child: Column(
            children: [
              Expanded(child: Image.network(pizza.image, fit: BoxFit.contain)),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(children: [Text(pizza.price, style: const TextStyle(fontWeight: FontWeight.bold)), Text(pizza.title)]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}