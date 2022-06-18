import 'dart:ui';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hungry/models/core/recipe.dart';
import 'package:hungry/models/helper/recipe_helper.dart';
import 'package:hungry/views/screens/search_page.dart';
import 'package:hungry/views/utils/AppColor.dart';
import 'package:hungry/views/widgets/category_card.dart';
import 'package:hungry/views/widgets/popular_recipe_card.dart';
import 'package:hungry/views/widgets/recommendation_recipe_card.dart';
// Agregado
import 'package:hungry/views/widgets/modals/options_modal.dart';
// Para la cámara
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:camera/camera.dart';
import 'package:hungry/views/widgets/camara_app.dart';
// Plugin cámara
import 'package:image_picker/image_picker.dart';
import 'package:flutter/services.dart';

class ExplorePage extends StatefulWidget {
  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  // Other method
  File imageFile;
  //
  /**Plugin Camara**/
  // Create a new object
  File _image;
  // Create and instanciate our ImagePicker object
  final imagePicker = ImagePicker();
  // Function to get the image from the camera
  Future getImage(ImageSource source) async {
    try {
      final image = await imagePicker.pickImage(source: source);
      setState(() {
        // Asign the image path to our image File
        if (_image != null) {
          _image = File(image.path);
        } else {
          print('No selecciono foto');
        }
      });
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  /****/
  final Recipe popularRecipe = RecipeHelper.popularRecipe;

  final List<Recipe> sweetFoodRecommendationRecipe =
      RecipeHelper.sweetFoodRecommendationRecipe;

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
      body: ListView(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        children: [
          // Section 1 - Plants Category
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            width: MediaQuery.of(context).size.width,
            height: 245,
            color: AppColor.primary,
            child: Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                CategoryCard(
                    title: 'Pimienta',
                    image: AssetImage('assets/images/pimienta.jpg')),
                CategoryCard(
                    title: 'Papa', image: AssetImage('assets/images/papa.jpg')),
                CategoryCard(
                    title: 'Tomate',
                    image: AssetImage('assets/images/tomate.jpg')),
              ],
            ),
          ),
          // Section 2
          Container(
            margin: EdgeInsets.only(top: 32, bottom: 6, left: 16, right: 16),
            width: MediaQuery.of(context).size.width,
            height: 60,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: OptionsModal(
                        icon: Icons.camera_alt,
                        color: AppColor.primary,
                        text: 'Cámara',
                        onPressed: () {
                          //CameraApp();
                          getImage(ImageSource.camera);
                        },
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: OptionsModal(
                        icon: Icons.photo,
                        color: AppColor.primary,
                        text: 'Galería',
                        onPressed: () {
                          getImage(ImageSource.gallery);
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),

          // Section Resultados
          imageFile != null
              ? Container(
                  height: 280,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    // Aquí se muestra la imagen
                    image: DecorationImage(image: FileImage(imageFile)),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  /*
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Resultados',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'inter'),
                    ),
                    _image != null
                        ? Image.file(
                            _image,
                            width: 160,
                            height: 160,
                            fit: BoxFit.cover,
                          )
                        : FlutterLogo(
                            size: 160,
                          ),
                    const SizedBox(height: 24),
                    Text('Image Picker', style: TextStyle(fontSize: 48)),
                  ]),*/
                )
              : Container(
                  height: 280,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    // Imagen por defecto
                    image: DecorationImage(
                        image: AssetImage('assets/images/select-image.png')),
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
          // Section 2 - Take a photo
          Container(
            margin: EdgeInsets.only(top: 32, bottom: 6, left: 16, right: 16),
            width: MediaQuery.of(context).size.width,
            height: 60,
            child: ElevatedButton(
              //onPressed: () {
              //DisplayDialog();
              //Navigator.of(context).pop();
              //Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => OptionsModal()));
              //},
              child: Text(
                'Diagnosticar',
                style: TextStyle(
                    color: AppColor.secondary,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'inter'),
              ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                primary: AppColor.primarySoft,
              ),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return SimpleDialog(
                        title: Text('Elige una opción:',
                            style: TextStyle(fontSize: 16)),
                        children: [
                          OptionsModal(
                            icon: Icons.camera_alt,
                            color: AppColor.primary,
                            text: 'Cámara',
                            onPressed: () {
                              //CameraApp();
                              //getImage(ImageSource.camera);
                              getImages(source: ImageSource.camera);
                            },
                          ),
                          OptionsModal(
                            icon: Icons.photo,
                            color: AppColor.primary,
                            text: 'Galería',
                            onPressed: () {
                              getImage(ImageSource.gallery);
                            },
                          ),
                        ],
                      );
                      /*
                      AlertDialog(
                        content: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 150,
                          color: Colors.white,
                          //child: Text('Elige una opción:'),
                        ),
                        actions: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  OptionsModal(
                                    icon: Icons.camera_alt,
                                    color: AppColor.primary,
                                    text: 'Cámara',
                                    onPressed: () {},
                                  ),

                                  /*
                                  Container(
                                    width: 120,
                                    child: TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('cancel'),
                                      style: TextButton.styleFrom(
                                        primary: Colors.grey[600],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      child: FloatingActionButton(
                                        onPressed: () {},
                                        backgroundColor: AppColor.primary,
                                        child: Icon(Icons.camera_alt),
                                        //style: ElevatedButton.styleFrom(
                                        //  primary: AppColor.primary,
                                        //),
                                      ),
                                    ),
                                  ),
                                  */
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  OptionsModal(
                                    icon: Icons.photo,
                                    color: AppColor.primary,
                                    text: 'Galería',
                                    onPressed: () {},
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ); */
                    });
              },
            ),
          ),

          // Section 3 - Popular Card
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: PopularRecipeCard(
              data: popularRecipe,
            ),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Container(
                  margin: EdgeInsets.only(bottom: 16),
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Todays sweet food to make your day happy ......',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                // Content
                Container(
                  height: 174,
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: sweetFoodRecommendationRecipe.length,
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    separatorBuilder: (context, index) {
                      return SizedBox(width: 16);
                    },
                    itemBuilder: (context, index) {
                      return RecommendationRecipeCard(
                          data: sweetFoodRecommendationRecipe[index]);
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Other method
  void getImages({ImageSource source}) async {
    final file = await ImagePicker().pickImage(source: source);
    if (file.path != null) {
      setState(() {
        imageFile = File(file.path);
      });
    }
  }
}
