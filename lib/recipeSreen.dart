import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import 'favoriteWidget.dart';
import 'recipe.dart';

class RecipeScreen extends StatelessWidget {

  final Recipe recipe;

  const RecipeScreen({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child:Text(recipe.title,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                    ),
                  ),
                ),
                Text(recipe.user, style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 16
                ),)
              ],
            ),
          ),
          FavoriteWidget(isFavorited: recipe.isFavorite, favoritedCount: recipe.favoriteCount)
        ],
      ),
    );

    Widget buttonSection = Container(
        padding: const EdgeInsets.all(8),
        child:Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildButtonColumn(Colors.blue, Icons.comment,"COMMENTE"),
            _buildButtonColumn(Colors.blue, Icons.share,"SHARE")
          ],
        )
    );

    Widget descriptionSection = Container(
        padding: const EdgeInsets.all(32),
        child:Text(recipe.description,
          softWrap: true,
        )
    );

    return Scaffold(
        appBar: AppBar(
          title: Text("Les Langages"),
        ),
        body: ListView(
          children: [
            Stack(
              children: [
                Container(
                  width: 600,
                  height: 240,
                  child: Center(child: CircularProgressIndicator()),
                ),
                Hero(
                  tag: "imageRecipe" + recipe.title,
                  child: FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: recipe.imageUrl,
                    width: 600,
                    height: 240,
                    fit: BoxFit.cover,
                  ),
                )
              ],
            ),
            titleSection,
            buttonSection,
            descriptionSection
          ],)
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.only(bottom: 8),
          child: Icon(icon, color: color),
        ),
        Text(label,
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: color
          ),)
      ],
    );
  }
}