import 'package:flutter/material.dart';
import '../data/dummy_data.dart';
import '../components/category_item.dart';

class CategoriesScreen extends StatelessWidget{

  @override
  Widget build (BuildContext context){
    return GridView(
        padding: EdgeInsets.all(20),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          ...dummyCategories.map((c) => CategoryItem(c))
        ],
      );
  }
}