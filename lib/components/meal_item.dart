import 'package:flutter/material.dart';
import '../utils/app_routes.dart';
import '../models/meal.dart';

class MealItem extends StatelessWidget{

  final Meal meal;

  MealItem(this.meal);

  _selectMeal(BuildContext context){
    Navigator.of(context).pushNamed(
      AppRoutes.MEAL_DETAIL,
      arguments: meal
    );
  }

  @override
  Widget build (BuildContext context){
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: () => _selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)
        ),
        elevation: 2,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)
                  ),
                  child: Image.network(
                    meal.imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black54
                    ),
                    width: 300,
                    padding: EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 20
                    ),
                    child: Text(
                      meal.title,
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.bold
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(width: 6),
                      Text('${meal.duration} min')
                    ],
                  ),
                  SizedBox(width: 30,),
                  Row(
                    children: [
                      Icon(Icons.work),
                      SizedBox(width: 6),
                      Text(meal.complexityText)
                    ],
                  ),

                  SizedBox(width: 30,),
                  Row(
                    children: [
                      Icon(Icons.attach_money),
                      SizedBox(width: 3),
                      Text(meal.costText)
                    ],
                  ),
                ],
              ),
              
            )
          ],
        ),
      ),
    );
  }
}