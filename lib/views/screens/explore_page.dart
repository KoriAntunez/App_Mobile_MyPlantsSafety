import 'dart:ui';

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

class ExplorePage extends StatelessWidget {
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
          // Section 1 - Category
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
          // Section 2 - Button Option take a photo
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
                'Toma una foto',
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
                            onPressed: () {},
                          ),
                          OptionsModal(
                            icon: Icons.photo,
                            color: AppColor.primary,
                            text: 'Galería',
                            onPressed: () {},
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
}
