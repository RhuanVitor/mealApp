import 'package:flutter/material.dart';
import '../screens/categories_screen.dart';
import '../screens/favorite_screen.dart';

class TabsScreen extends StatelessWidget{


  @override
  Widget build (BuildContext context){
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Vamos cozinhar?")),
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.category),
                text: "Categorias",
              ),
              Tab(
                icon: Icon(Icons.favorite),
                text: "Favoritos",
              ),
            ]
          ),
        ),
        body: TabBarView(
          children: [
            CategoriesScreen(),
            FavoriteScreen()
          ]
        ),
      )
    );
  }
}