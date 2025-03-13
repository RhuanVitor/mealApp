import 'package:flutter/material.dart';
import '../models/category.dart';

class CategoryItem extends StatelessWidget{
  final Category category;

  const CategoryItem(this.category);
  
  @override
  Widget build(BuildContext context){
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
          colors: [
            category.color.withAlpha(125),
            category.color
          ]
        )
      ),
      child: Text(
        category.title,
        style: Theme.of(context).textTheme.titleMedium
      ),
    ); 
  }
}