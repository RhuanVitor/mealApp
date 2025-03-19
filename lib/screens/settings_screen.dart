import 'package:flutter/material.dart';
import '../components/main_drawer.dart';
import '../models/settings.dart';

class SettingsScreen extends StatefulWidget{
  final Settings settings;

  final Function(Settings) onSettingsChange;
  SettingsScreen(this.settings, this.onSettingsChange);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  var settings;

  @override
  void initState(){
    super.initState();
    settings = widget.settings;
  }

  Widget _createSwitch(
    String title, 
    String subtitle, 
    bool value, 
    Function onChanged
  ){
    return SwitchListTile.adaptive(
      inactiveThumbColor: Colors.grey,
      inactiveTrackColor: Colors.black12,
      title: Text(title),
      subtitle: Text(subtitle),
      value: value, 
      onChanged: (value) {
        onChanged(value);
        widget.onSettingsChange(settings);
      }
    );
  }

  @override
  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Configurações"),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "filtros",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _createSwitch(
                  'Sem glutén', 
                  "Só exibe refeições sem glutén!", 
                  settings.isGlutenFree, 
                  (value) => setState(() {
                    settings.isGlutenFree = value;
                  })),
                _createSwitch(
                  'Sem lactose', 
                  "Só exibe refeições sem lactose!", 
                  settings.isLactoseFree, 
                  (value) => setState(() {
                    settings.isLactoseFree = value;
                  })),
                _createSwitch(
                  'Vegana', 
                  "Só exibe refeições veganas!", 
                  settings.isVegan, 
                  (value) => setState(() {
                    settings.isVegan = value;
                  })),
                _createSwitch(
                  'Vegetariana', 
                  "Só exibe refeições sem vegetarianas!", 
                  settings.isVegetarian, 
                  (value) => setState(() {
                    settings.isVegetarian = value;
                  })),
              ],
            )
          )
        ],
      ),
    ); 
  }
}