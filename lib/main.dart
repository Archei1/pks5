import 'package:flutter/material.dart';
import 'package:pks5/pages/home_page.dart';
import 'package:pks5/pages/favorites_page.dart';
import 'package:pks5/pages/profile_page.dart';
import 'model/product.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  // Добавим список избранных автомобилей
  List<Car> _favoriteCars = [];

  // Список страниц
  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      HomePage(
        onFavoriteToggle: _toggleFavorite,
        favoriteCars: _favoriteCars,
      ),
      FavoritesPage(favoriteCars: _favoriteCars),
      const ProfilePage(),
    ];
  }

  void _toggleFavorite(Car car) {
    setState(() {
      if (_favoriteCars.contains(car)) {
        _favoriteCars.remove(car);
      } else {
        _favoriteCars.add(car);
      }
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blueGrey,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Главная',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Избранное',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Профиль',
          ),
        ],
      ),
    );
  }
}
