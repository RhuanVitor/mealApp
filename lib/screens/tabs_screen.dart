import 'package:flutter/material.dart';
import './categories_screen.dart';
import './favorite_screen.dart';
import '../components/main_drawer.dart';
import '../models/meal.dart';

class TabsScreen extends StatefulWidget{
   final List<Meal> favoriteMeals;

   TabsScreen(this.favoriteMeals,{Key? key}) : super(key: key);


  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedScreenIndex = 0;

  late List<Map<String, Object>> _screens;

  @override
  void initState(){
    super.initState();
    _screens = [
      {'title': 'Lista de Categorias', 'screen': CategoriesScreen()},
      {'title': 'Meus Favoritos', 'screen': FavoriteScreen(widget.favoriteMeals)}
    ];
  }

  _selectScreen(int index){
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(_screens[_selectedScreenIndex]['title'] as String),
      ),
      drawer: MainDrawer(),
      body: _screens[_selectedScreenIndex]['screen'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.amber,
        currentIndex: _selectedScreenIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            label: "Categorias"
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.favorite),
            label: "Favoritos"
          )
        ]
      ),
    );
  }
}