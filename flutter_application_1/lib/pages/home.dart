import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_application_1/widgets/icon.dart';
import 'package:permission_handler/permission_handler.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Create a new object
  File? _image;
  // Create and instanciate our ImagePicker object
  final imagePicker = ImagePicker();
  // Function to get the image from the camera
  Future getImage(ImageSource source) async {
    try {
      final image = await imagePicker.pickImage(source: source);
      setState(() {
        // Asign the image path to our image File
        if (_image != null) {
          _image = File(image!.path);
        } else {
          print('No selecciono foto');
        }
      });
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('HomePage')),
        body: SafeArea(
          child: Center(
              child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      buildCard(),
                    ],
                  ))),
        ));
  }

  Widget buildCard() {
    return Card(
      // Efecto sombreado
      elevation: 5,
      // Border
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.43)),
      child: Container(
        // Padding
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            // Title
            Text(
              'Ayuda a tu planta',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            // Espacio
            SizedBox(
              height: 20,
            ),
            // Row
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Container group image + text
                ContainerGroup(
                  image: 'assets/imgs/scan-plant.png',
                  text: 'Toma una foto',
                ),
                Icon(Icons.arrow_forward),
                ContainerGroup(
                  image: 'assets/imgs/mobile.png',
                  text: 'Obtén los resultados',
                ),
                Icon(Icons.arrow_forward),
                ContainerGroup(
                  image: 'assets/imgs/results.png',
                  text: 'Obtén el diagnóstico',
                ),
              ],
            ),
            // Espacio
            SizedBox(
              height: 20,
            ),
            // Aquí se muestra la imagen
            _image == null
                ? Text('No image selected')
                : Image.file(_image!, width: 50, height: 50),
            buildCapturePhotoButton(),
          ],
        ),
      ),
    );
  }

  // Button capture photo
  Widget buildCapturePhotoButton() {
    return FloatingActionButton.extended(
        foregroundColor: Colors.white,
        backgroundColor: Color.fromARGB(255, 18, 141, 100),
        icon: Icon(Icons.camera),
        label: Text('Capturar foto'),
        onPressed:
            openChoose //getImage, // Presiona el botón y obtiene la imagen de la camera
        );
  }

  // Icon Button Camera
  Widget buildCameraButton() {
    return FloatingActionButton(
      backgroundColor: Color.fromARGB(255, 18, 141, 100),
      child: const Icon(Icons.camera_alt),
      onPressed: () {
        getImage(ImageSource.camera);
      }, // Presiona el botón y obtiene la imagen de la camera
    );
  }

  void requestCameraPermission() async {
    var status = await Permission.camera.status;
    if (status.isGranted) {
      print("Permission is granted");
    } else if (status.isDenied) {
      if (await Permission.camera.request().isGranted) {
        print("Permission was granted");
      }
    }
  }

  // Icon Button Gallery
  Widget buildButtonGallery() {
    return FloatingActionButton(
      backgroundColor: Color.fromARGB(255, 18, 141, 100),
      child: const Icon(Icons.photo),
      onPressed: () {
        getImage(ImageSource.gallery);
      }, // Presiona el botón y obtiene la imagen de la camera
    );
  }

  // Dialog
  Future openChoose() {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('Elegir'),
              content: Container(
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      // Camera Option
                      Container(
                          child: Column(
                        children: [
                          buildCameraButton(),
                          SizedBox(
                            height: 10,
                          ),
                          Text('Cámara'),
                        ],
                      )),
                      SizedBox(
                        width: 100,
                      ),
                      // Gallery Option
                      Container(
                          child: Column(
                        children: [
                          buildButtonGallery(),
                          SizedBox(
                            height: 10,
                          ),
                          Text('Galería'),
                        ],
                      )),
                    ],
                  )),
            ));
  }
}

class ContainerGroup extends StatelessWidget {
  final String image, text;

  ContainerGroup({
    required this.image,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      child: Center(
        child: Column(
          children: <Widget>[
            Image.asset(
              height: 70,
              image,
            ),
            SizedBox(height: 20),
            Center(
              child: Text(text,
                  style: TextStyle(
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center),
            )
          ],
        ),
      ),
    );
  }
}

class BoardResult extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('ResultsPage')),
        body: SafeArea(
            child: Center(
                child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        //_image != null ? Image.file(_image!,width: 160,height: 160),
                      ],
                    )))));
  }
}
