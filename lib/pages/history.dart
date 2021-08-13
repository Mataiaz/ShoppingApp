import 'package:flutter/material.dart';
import 'package:shopping_app/custom_Widget/item.dart';
import 'package:shopping_app/api/google_api.dart';
import 'package:shopping_app/api/recipe_api.dart';

class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {

  result () {
    print('Someone clicked the button');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text('History          '),
          ),
        ),
        //body: Item(
        //    <String>["Item_1", "Item_2", "Hala"], <String>["20", "30", "45"]),
        body: RecipeCard(
          title: 'My recipe',
          rating: '4.9',
          cookTime: '30 min',
          thumbnailUrl: 'https://lh3.googleusercontent.com/ei5eF1LRFkkcekhjdR_8XgOqgdjpomf-rda_vvh7jIauCgLlEWORINSKMRR6I6iTcxxZL9riJwFqKMvK0ixS0xwnRHGMY4I5Zw=s360',
          buy: result,
        ));
  }
}
