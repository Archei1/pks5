import 'package:flutter/material.dart';
import 'package:pks5/components/item.dart';
import 'package:pks5/model/product.dart';

class FavoritesPage extends StatelessWidget {
  final List<Car> favoriteCars;
  final Function(Car) onFavoriteToggle;

  const FavoritesPage({super.key, required this.favoriteCars, required this.onFavoriteToggle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Избранное'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: favoriteCars.isNotEmpty
            ? GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.7,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
          ),
          itemCount: favoriteCars.length,
          itemBuilder: (BuildContext context, int index) {
            final car = favoriteCars[index];
            return ItemNote(
              car: car,
              isFavorite: true,
              onFavoriteToggle: () {
                onFavoriteToggle(car);
              },
            );
          },
        )
            : const Center(child: Text('Нет избранных автомобилей')),
      ),
    );
  }
}
