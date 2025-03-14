import 'package:flutter/material.dart';
import '../models/category.dart';

class CategoriesMealScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    final Category category = ModalRoute.of(context)?.settings.arguments as Category;

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),

      body: Center(
        child: Text("Receitas por categoria ${category.id}")
      ),
    );
  }
}