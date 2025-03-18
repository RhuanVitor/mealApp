import 'package:flutter/material.dart';
import '../components/main_drawer.dart';

class SettingsScreen extends StatelessWidget{

  @override
  Widget build (BuildContext){
    return Scaffold(
      appBar: AppBar(
        title: Text("Configurações"),
      ),
      drawer: MainDrawer(),
      body: Center(child: Text("Configurações")),
    ); 
  }
}