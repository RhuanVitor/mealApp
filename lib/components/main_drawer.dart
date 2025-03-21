import 'package:flutter/material.dart';
import '../utils/app_routes.dart';

class MainDrawer extends StatelessWidget{

  Widget _createItem(IconData icon, String label, Function onTap){
    return ListTile(
      leading: Icon(
        icon,
        size: 24,
      ),
      title: Text(
        label,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 18,
          fontWeight: FontWeight.bold
        ),
      ),
        onTap: (){onTap();},
    );
  }

  @override
  Widget build (BuildContext context){
    return Drawer(
      child: Column(
        children: [
          Container(
            alignment: Alignment.bottomCenter,
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Theme.of(context).primaryColor,
            child: Text(
              "Vamos cozinhar?",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Colors.white
              ),
            ),
          ),
          SizedBox(height: 20,),
          _createItem(
            Icons.restaurant, 
            'Refeições',
            () => Navigator.of(context).pushReplacementNamed(AppRoutes.HOME)
          ),
          _createItem(
            Icons.settings, 
            'Configurações',
            () => Navigator.of(context).pushReplacementNamed(AppRoutes.SETTINGS)
          ),
        ],
      ),
    );
  }
}