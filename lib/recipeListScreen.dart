import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import 'recipe.dart';
import 'recipeSreen.dart';

class RecipeListScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return RecipeListScreenState();
  }
}

class RecipeListScreenState extends State<RecipeListScreen>{
  final List<Recipe> recipes = [
    Recipe(
        "Langage C",
        "Dennis Ritchie",
        "images/logoC.jpg",
        "Description élément 1",
        false,
        40
    ),
    Recipe(
        "Langage PHP",
        "Tony Paker Ritchie",
        "images/php.png",
        "Description élément 2",
        false,
        40
    ),
    Recipe(
        "Langage Arduino",
        "Tony Paker Ritchie",
        "images/logoC.jpg",
        "Description élément 2",
        false,
        40
    ),
    Recipe(
        "Langage Java",
        "Tony Paker Ritchie",
        "images/php.png",
        "Description élément 2",
        false,
        40
    ),
    Recipe(
        "Langage Dart",
        "Tony Paker Ritchie",
        "images/logoC.jpg",
        "Description élément 2",
        false,
        40
    ),
    Recipe(
        "Langage HTML",
        "Tony Paker Ritchie",
        "images/php.png",
        "Description élément 2",
        false,
        40
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Les langages"),
      ),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index){
          final recipe  = recipes[index];
          return Dismissible(key: Key(recipe.title),
              onDismissed: (direction){
                setState(() {
                  recipes.removeAt(index);
                });
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("${recipe.title} supprimé"))
                );
              },
              background: Container(color: Colors.redAccent),
              child: RecipeItemWidget(recipe: recipe));
        },
      )
    );
  }
}

class RecipeItemWidget extends StatelessWidget{
  final Recipe recipe;
  const RecipeItemWidget({Key? key, required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
       Navigator.pushNamed(context, '/recipe', arguments: recipe);
      },
      child: Card(
        margin: EdgeInsets.all(8),
        elevation: 8,
        child: Row(
          children: [
            Hero(
              tag: "imageRecipe" + recipe.title,
              child: FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: recipe.imageUrl,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 8),
                    child:
                    Text(recipe.title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20
                      ),
                    )),
                  Text(recipe.user,
                  style: TextStyle(color: Colors.grey[500], fontSize: 16))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

/*
//Animation
var begin = Offset(0.0, 1.0);
var end = Offset.zero;
var curve = Curves.ease;
var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
return SlideTransition(
position: animation.drive(tween),
child: child,
);
 */