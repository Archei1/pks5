import 'package:flutter/material.dart';
import 'package:pks5/model/product.dart';
import 'package:pks5/pages/information.dart';

class ItemNote extends StatelessWidget {
  final Car car;
  final bool isFavorite;
  final VoidCallback onFavoriteToggle;

  const ItemNote({
    super.key,
    required this.car,
    required this.isFavorite,
    required this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CatalogPage(car: car)),
      ),
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(16.0)),
                  child: Image.network(
                    car.imageUrl,
                    height: 120,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: IconButton(
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: Colors.red,
                    ),
                    onPressed: onFavoriteToggle,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                car.title,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                'Цена: ${car.cost}',
                style: const TextStyle(fontSize: 16, color: Colors.blueGrey),
              ),
            ),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                side: const BorderSide(color: Colors.white12, width: 2),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CatalogPage(car: car)),
                );
              },
              child: const Text(
                'Подробнее',
                style: TextStyle(fontSize: 12, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
