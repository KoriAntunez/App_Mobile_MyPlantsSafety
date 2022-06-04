import 'package:flutter/material.dart';
import 'package:loginplant/editarPerfil.dart'; //cambia la ruta con el nombre de tu aplicacion, en mi caso se llama 'prueba' , sino no va a funcionar


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Editar Perfil ',
        theme: ThemeData(
            primaryColor: Colors.blue
        ),
        home: editarPerfil(),
    );
  }
}