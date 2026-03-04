import 'package:flutter/material.dart';

class RestaurantesScreen extends StatelessWidget {
  const RestaurantesScreen({super.key});

  final Color elegantBlueBg = const Color(0xFF0D1B2A);
  final Color lightText = Colors.white;
  final Color cardBg = Colors.white;
  final Color darkText = const Color(0xFF2D3436);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: elegantBlueBg,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(context),
              _buildSearchBar(),
              const SizedBox(height: 20),
              _buildCategories(),
              const SizedBox(height: 25),
              _buildNacionalesTitle(),
              const SizedBox(height: 15),
              _buildFavoritosNacionales(context),
              const SizedBox(height: 25),
              _buildVerticalListTitle(),
              const SizedBox(height: 15),
              _buildVerticalList(),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back, color: lightText),
            onPressed: () => Navigator.pop(context),
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Text(
                      'Avenida nueva 1234',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: lightText),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Icon(Icons.keyboard_arrow_down, color: lightText),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 48),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: const TextField(
          style: TextStyle(color: Colors.black),
          decoration: InputDecoration(
            hintText: 'Buscar platos o restaurantes',
            hintStyle: TextStyle(color: Colors.grey),
            prefixIcon: Icon(Icons.search, color: Colors.black54),
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(vertical: 14),
          ),
        ),
      ),
    );
  }

  Widget _buildCategories() {
    return SizedBox(
      height: 115,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          _buildCategoryItem(
              'Pizza', 'https://images.unsplash.com/photo-1513104890138-7c749659a591?w=200', Colors.orange.shade100),
          _buildCategoryItem(
              'Carnes', 'https://images.unsplash.com/photo-1558030006-450675393462?w=200', Colors.red.shade100),
          _buildCategoryItem(
              'Hamburguesa', 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=200', Colors.amber.shade100),
          _buildCategoryItem(
              'Comida Rápida', 'https://images.unsplash.com/photo-1615719413546-198b25453f85?w=200', Colors.green.shade100),
        ],
      ),
    );
  }

  Widget _buildCategoryItem(String title, String imageUrl, Color bgColor) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {},
        child: Container(
          width: 95,
          margin: const EdgeInsets.only(right: 10),
          child: Column(
            children: [
              Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  color: bgColor,
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: NetworkImage(imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                title,
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: lightText),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNacionalesTitle() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        'Favoritos Nacionales',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: lightText),
      ),
    );
  }

  Widget _buildFavoritosNacionales(BuildContext context) {
    return SizedBox(
      height: 180,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          _buildFavoriteCard(
            context,
            'Little Caesars',
            '4.8',
            '24 min',
            'https://raw.githubusercontent.com/ARROYOCARLOS0478/imagenes/refs/heads/main/little-ca.PNG',
            onTap: () => Navigator.pushNamed(context, '/pequenocesar'),
          ),
          _buildFavoriteCard(
            context,
            'Subway',
            '4.6',
            '30 min',
            'https://raw.githubusercontent.com/ARROYOCARLOS0478/imagenes/refs/heads/main/subway.jfif',
          ),
          _buildFavoriteCard(
            context,
            "McDonald's",
            '4.5',
            '20 min',
            'https://images.unsplash.com/photo-1623156346149-d5cec8b29818?w=300',
          ),
          _buildFavoriteCard(
            context,
            'Starbucks',
            '4.9',
            '15 min',
            'https://raw.githubusercontent.com/ARROYOCARLOS0478/imagenes/refs/heads/main/starbucks.jfif',
          ),
        ],
      ),
    );
  }

  Widget _buildFavoriteCard(BuildContext context, String name, String rating, String time, String imageUrl, {VoidCallback? onTap}) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 150,
          margin: const EdgeInsets.only(right: 15),
          decoration: BoxDecoration(
            color: cardBg,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                spreadRadius: 1,
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                child: Image.network(
                  imageUrl,
                  height: 105,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: darkText),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        const Icon(Icons.star_rounded, size: 16, color: Colors.orangeAccent),
                        const SizedBox(width: 2),
                        Text(rating, style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: darkText)),
                        const SizedBox(width: 10),
                        const Icon(Icons.access_time_rounded, size: 16, color: Colors.grey),
                        const SizedBox(width: 2),
                        Text(time, style: TextStyle(fontSize: 12, color: Colors.grey.shade700)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildVerticalListTitle() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        '+20 restaurantes cerca',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: lightText),
      ),
    );
  }

  Widget _buildVerticalList() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          _buildFullWidthRestaurantCard(
            name: 'Cobre 29',
            imageUrl: 'https://raw.githubusercontent.com/ARROYOCARLOS0478/imagenes/refs/heads/main/cobre29.jfif',
            time: '35-45 min',
            deliveryFee: '\$25 envío',
            distance: '2.5 km',
            rating: '4.7',
          ),
          const SizedBox(height: 15),
          _buildFullWidthRestaurantCard(
            name: 'Trueke Comida y Amigos',
            imageUrl: 'https://raw.githubusercontent.com/ARROYOCARLOS0478/imagenes/refs/heads/main/trueke.jfif',
            time: '40-55 min',
            deliveryFee: '\$30 envío',
            distance: '3.8 km',
            rating: '4.9',
          ),
          const SizedBox(height: 15),
          _buildFullWidthRestaurantCard(
            name: 'KFC',
            imageUrl: 'https://raw.githubusercontent.com/ARROYOCARLOS0478/imagenes/refs/heads/main/kfc.jpg',
            time: '20-30 min',
            deliveryFee: 'Envío Gratis',
            distance: '1.2 km',
            rating: '4.4',
          ),
        ],
      ),
    );
  }

  Widget _buildFullWidthRestaurantCard({
    required String name,
    required String imageUrl,
    required String time,
    required String deliveryFee,
    required String distance,
    required String rating,
  }) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {},
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: cardBg,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                spreadRadius: 1,
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                child: Image.network(
                  imageUrl,
                  height: 170,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          name,
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: darkText),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.orange.shade50,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.star_rounded, size: 18, color: Colors.orangeAccent),
                              const SizedBox(width: 4),
                              Text(rating, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.deepOrange)),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.access_time_rounded, size: 16, color: Colors.grey.shade500),
                        const SizedBox(width: 4),
                        Text(time, style: TextStyle(color: Colors.grey.shade700)),
                        const SizedBox(width: 15),
                        const Icon(Icons.motorcycle_rounded, size: 16, color: Colors.green),
                        const SizedBox(width: 4),
                        Text(deliveryFee, style: TextStyle(color: darkText, fontWeight: FontWeight.w500)),
                        const SizedBox(width: 15),
                        Icon(Icons.location_on_rounded, size: 16, color: Colors.grey.shade500),
                        const SizedBox(width: 4),
                        Text(distance, style: TextStyle(color: Colors.grey.shade700)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}