import 'package:flutter/material.dart';

class IconFont extends StatelessWidget {
  Color? color;
  Future? getMethod;

  IconFont({
    this.color = null,
    this.getMethod,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: this.color, //Color.fromARGB(255, 18, 141, 100),
      child: const Icon(Icons.camera),
      onPressed: () {
        this.getMethod;
      }, // Presiona el botón y obtiene la imagen de la camera
    );
  }
}
