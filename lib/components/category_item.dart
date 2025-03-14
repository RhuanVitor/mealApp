import 'package:flutter/material.dart';
import '../models/category.dart';

import '../utils/app_routes.dart';


class CategoryItem extends StatelessWidget{
  final Category category;

  const CategoryItem(this.category);

  void _selectCategory(BuildContext context){
    Navigator.of(context).pushNamed(
      AppRoutes.CATEGORIES_MEAL,
    arguments: category
    );
  }
  
  @override
  Widget build(BuildContext context){
    return InkWell(
      onTap: () => _selectCategory(context),
      borderRadius: BorderRadius.circular(10),
      splashColor: Theme.of(context).primaryColor,
      child: Container(
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
      ),
    ); 
  }
}