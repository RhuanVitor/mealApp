import 'package:flutter/material.dart';
import '../models/meal.dart';

class MealDetailScreen extends StatelessWidget{

  final Function(Meal) onToggleFavorite;
  final Function(Meal) isFavorite;

  const MealDetailScreen(this.onToggleFavorite, this.isFavorite);

  Widget _createSectionTitle(BuildContext context, String title){
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }

  Widget _createSectionContainer(Widget child,){
    return Card(
      elevation: 3,
      child: Container(
        width: 320,
        height: 220,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 252, 220),
          border: Border.all(color: const Color.fromARGB(255, 196, 196, 196)),
          borderRadius: BorderRadius.circular(10)
        ),
        child: child
      ),
    );
  }

  @override
  Widget build (BuildContext context){
    final Meal meal = ModalRoute.of(context)?.settings.arguments as Meal;
    
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 300,
              child: Image.network(
                meal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            _createSectionTitle(context, "Ingredientes:"),
            _createSectionContainer(
              ListView.builder(
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
            ),
            _createSectionTitle(context, "Passos:"),
            _createSectionContainer(
              ListView.builder(
                itemCount: meal.steps.length,
                itemBuilder: (ctx, index){
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text(
                            (index + 1).toString()
                          ),
                        ),
                        title: Text(meal.steps[index]),
                        
                      ),
                      Divider(color: const Color.fromARGB(255, 255, 220, 174),),
                    ],
                  );
                },
              )
            ),
            Container(
              height: 80,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(isFavorite(meal) ? Icons.star : Icons.star_border),
        onPressed: (){
          onToggleFavorite(meal);
        }
      ),
    );
  }
}