import 'dart:io';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
// Página de visualización (contiene la llamada a la cámara + visualización)
import 'package:hungry/views/widgets/take_picture_screen.dart';

/// CameraApp is the Main Application.
class CameraApp extends StatelessWidget {
  /// Default Constructor
  const CameraApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TakePictureScreen(cameras),
    );
  }
}

List<CameraDescription> cameras;

Future<void> main() async {
  // Fetch the available cameras before initializing the app.
  try {
    WidgetsFlutterBinding.ensureInitialized();
    cameras = await availableCameras();
  } on CameraException catch (e) {
    print(e.code);
    print(e.description);
  }
  runApp(const CameraApp());
}
