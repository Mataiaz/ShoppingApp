import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/api/recipe_api.dart';
import 'package:shopping_app/api/recipe_json.dart';
import 'package:shopping_app/custom_Widget/recipe_card.dart';
//import 'package:shopping_app/api/google_api.dart';
import 'package:shopping_app/api/recipe_api.dart';

class Checkout extends StatefulWidget {
  const Checkout({Key key}) : super(key: key);

  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  List<Recipe> _recipes = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getRecipesFromFB();
  }

  Future<List<Recipe>> getRecipesFromFB() async {
    List<Recipe> tmp = [];
    var data = await FirebaseFirestore.instance
        .collection('public')
        .get()
        .then((snapshot) => {
              snapshot.docs.forEach((element) {
                //print(element.data());
                Recipe x = Recipe(
                    name: element.data()["title"],
                    images: element.data()["thumbnailUrl"],
                    rating: 2,
                    totalTime: element.data()["cookTime"]);
                tmp.add(x);
                _recipes.add(x);
                print(element.data()["title"]);
              })
            })
        .catchError((onError) {
      print('Caught $onError');
    }).whenComplete(() => {
              print("HEY"),
              //print(tmp[0]),
              print(tmp),
              setState(() {
                _isLoading = false;
              })
            });

    print("hei            sadffffffffffffffffffffffffffffff: ");

    return tmp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text('Checkout'),
          ),
        ),
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
