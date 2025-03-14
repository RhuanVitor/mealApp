import 'package:flutter/material.dart';

import './utils/app_routes.dart';

import './screens/categories_screen.dart';
import './screens/categories_meal_screen.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  
  @override
  Widget build (BuildContext context){
    return MaterialApp(
      title: "Vamos cozinhar?",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.pink,
        ).copyWith(secondary: Colors.amber),

        canvasColor: Color.fromRGBO(255, 254, 229, 1),

        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          titleMedium: TextStyle(
            fontSize: 20,
            fontFamily: 'RobotoCondensed'
          )
        )
      ),
      routes: {
        AppRoutes.HOME: (ctx) => CategoriesScreen(),
        AppRoutes.CATEGORIES_MEAL: (ctx) => CategoriesMealScreen(),
      },
    );
  }
}