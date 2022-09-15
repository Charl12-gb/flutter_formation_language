import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/recipeListScreen.dart';
import 'package:flutter_app/recipeSreen.dart';

import 'recipe.dart';
// import 'package:cached_network_image/cached_network_image.dart'; pour gérer les caches

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      onGenerateRoute: (settings) => RouteGenerator.generateRoute(settings),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

class RouteGenerator{
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case '/':
        return MaterialPageRoute(builder: (context)=> RecipeListScreen());
      case '/recipe' :
        return PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation)=> RecipeScreen(recipe: settings.arguments as Recipe),
              transitionsBuilder: (context, animation, secondaryAnimation, child){
                animation = CurvedAnimation(parent: animation, curve: Curves.ease);
                return FadeTransition(opacity: animation, child: child,);
              }
          );
      default :
        return MaterialPageRoute(
          builder: (context)=>Scaffold(
            appBar: AppBar(title: Text("Error"),centerTitle: true),
            body: Center(child: Text("Page Not Found")),
          )
        );
    }
  }
}