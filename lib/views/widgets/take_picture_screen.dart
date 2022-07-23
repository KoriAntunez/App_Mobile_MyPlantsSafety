import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:camera/camera.dart';
import 'package:torch_compat/torch_compat.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hungry/views/utils/AppColor.dart';
import 'package:hungry/plant/ui/screens/search_page.dart';

class TakePictureScreen extends StatefulWidget {
  //final CameraDescription camera;
  var cameras;
  TakePictureScreen(this.cameras);
  /*
  const TakePictureScreen({
    Key key,
    @required this.cameras,
  }) : super(key: key);
*/
  @override
  _TakePictureScreenState createState() => _TakePictureScreenState();
}

class _TakePictureScreenState extends State<TakePictureScreen> {
  CameraController _controller;
  Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    // 1. Crear un CameraController
    _controller = CameraController(
      // Obtiene una camera específica de la lista de cámaras disponibles
      widget.cameras[0],
      // Definir resolución de la cámara
      ResolutionPreset.high,
    );
    // 2. Inicializar el controlador, que devuelve un futuro
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // Deseche el controlador cuando se deseche el widget
    _controller.dispose();
    TorchCompat.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Espera a que el controlador se inicialice antes de mostrar la vista previa de la cámara
      // Usamos FutureBuilder para mostrar una rueda de carga, hasta el controlador termine de inicializarse
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          // Si termina de cargar el controlador, muestra la vista previa
          if (snapshot.connectionState == ConnectionState.done) {
            return CameraPreview(_controller);
          }
          // Sino, muestra un indicador de carga
          else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),

      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Center(
            child: Container(
              height: 80,
              width: 80,
              child: FittedBox(
                child: FloatingActionButton(
                  child: Icon(Icons.camera_alt),
                  onPressed: () async {
                    // El bloque try/catch toma la foto, si sale mal, captura el error
                    try {
                      // Enciende el flash
                      TorchCompat.turnOn();

                      // Asegura que la cámara este inicializada
                      await _initializeControllerFuture;

                      // Ruta donde se guarda las imágenes
                      final path = join(
                        (await getTemporaryDirectory())
                            .path, // Almacena la imagen en un directorio temporal (dd/mm/yyyy-hh:mm:ss.png)
                        '${DateTime.now()}.png',
                      );

                      // Captura una foto y registra donde se guardó
                      XFile picture = await _controller.takePicture();
                      picture.saveTo(
                          path); // si no funciona, cambiar dependencies camera: 0.5.8+17

                      // Apaga el flash
                      TorchCompat.turnOff();

                      // Si se tomó la foto, la muestra en una nueva pantalla
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  DisplayPictureScreen(path)));
                    } catch (e) {
                      // Si ocurre un error, lo imprime en consola
                      print(e);
                    }
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

// Este widget muestra la foto tomada por el usuario
class DisplayPictureScreen extends StatefulWidget {
  final String imagePath;
  DisplayPictureScreen(this.imagePath);
  @override
  _DisplayPictureScreenState createState() => _DisplayPictureScreenState();
}

class _DisplayPictureScreenState extends State<DisplayPictureScreen> {
  List op;
  Image img;

  @override
  void initState() {
    super.initState();
    // Aquí debería cargar el modelo
    img = Image.file(File(widget.imagePath));
    // Aquí deberia clasificar la imagen
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primary,
        brightness: Brightness.dark,
        elevation: 0,
        centerTitle: false,
        title: Text('Explore Recipe',
            style: TextStyle(
                fontFamily: 'inter',
                fontWeight: FontWeight.w400,
                fontSize: 16)),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => SearchPage()));
            },
            icon: SvgPicture.asset('assets/icons/search.svg',
                color: Colors.white),
          ),
        ],
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(child: Center(child: img)),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
