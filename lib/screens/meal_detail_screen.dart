import 'package:flutter/material.dart';
import '../models/meal.dart';

class MealDetailScreen extends StatelessWidget{

  @override
  Widget build (BuildContext context){
    final Meal meal = ModalRoute.of(context)?.settings.arguments as Meal;
    
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),

      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 300,
            child: Image.network(
              meal.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              "Ingredientes",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Container(
            width: 300,
            height: 250,
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 252, 220),
              border: Border.all(color: const Color.fromARGB(255, 196, 196, 196)),
              borderRadius: BorderRadius.circular(10)
            ),
            child: ListView.builder(
              itemCount: meal.ingredients.length,
              itemBuilder: (ctx, index) {
                return Card(
                  
                  color: Colors.amber,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(meal.ingredients[index]),
                  ),
                );
              },
            ),
          )
        ],
      )
    );
  }
}