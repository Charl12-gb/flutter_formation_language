import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FavoriteWidget extends StatefulWidget{
  final bool isFavorited;
  final int favoritedCount;

  const FavoriteWidget({Key? key, required this.isFavorited, required this.favoritedCount}) : super(key: key);

  _FavoriteWidgetState createState() => _FavoriteWidgetState(this.isFavorited, this.favoritedCount);
}

class _FavoriteWidgetState extends State<FavoriteWidget>{
  bool _isFavorited;
  int _favoritedCount;

  _FavoriteWidgetState(this._isFavorited, this._favoritedCount);

  void _toggleFavorite(){
    setState(() {
      if(_isFavorited){
        _isFavorited = false;
        _favoritedCount -= 1;
      }else{
        _isFavorited = true;
        _favoritedCount += 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon : _isFavorited ? Icon(Icons.favorite) : Icon(Icons.favorite_border),
          color: Colors.red,
          onPressed: _toggleFavorite,
        ),
        Text('$_favoritedCount')
      ],
    );
  }
}