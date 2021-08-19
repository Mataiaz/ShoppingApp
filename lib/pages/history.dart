import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/api/recipe_api.dart';
import 'package:shopping_app/api/recipe_json.dart';
import 'package:shopping_app/custom_Widget/recipe_card.dart';
//import 'package:shopping_app/api/google_api.dart';
import 'package:shopping_app/api/recipe_api.dart';

class History extends StatefulWidget {
  const History({Key key}) : super(key: key);

  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  List<Recipe> _recipes;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getRecipes();
  }

  Future<void> getRecipes() async {
    _recipes = await RecipeApi.getRecipe();
    setState(() {
      _isLoading = false;
    });
    print(_recipes);
  }

  result() {
    Map<String, dynamic> data = {"field1": "hei"};

    print('Someone clicked the button');
    FirebaseFirestore.instance
        .collection('testing')
        //.add({'timeStamp': Timestamp.fromDate(DateTime.now())});
        .add(data);
    //print();
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
        //   body: RecipeCard(
        //     title: 'My recipe',
        //     rating: '4.9',
        //     cookTime: '30 min',
        //     thumbnailUrl:
        //         'https://lh3.googleusercontent.com/ei5eF1LRFkkcekhjdR_8XgOqgdjpomf-rda_vvh7jIauCgLlEWORINSKMRR6I6iTcxxZL9riJwFqKMvK0ixS0xwnRHGMY4I5Zw=s360',
        //     buy: result,
        //   ),
        //   floatingActionButton: FloatingActionButton(
        //     onPressed: () => result(),
        //     child: Icon(Icons.add),
        //   ),
        // );

        body: _isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: _recipes.length,
                itemBuilder: (context, index) {
                  return RecipeCard(
                      title: _recipes[index].name,
                      cookTime: _recipes[index].totalTime,
                      rating: _recipes[index].rating.toString(),
                      thumbnailUrl: _recipes[index].images);
                },
              ));
  }
}
