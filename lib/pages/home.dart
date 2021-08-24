import 'package:flutter/material.dart';
import 'package:shopping_app/pages/NavigationDrawerWidget.dart';
import 'package:shopping_app/pages/settings.dart';

import 'package:shopping_app/custom_Widget/recipe_card.dart';
import 'package:shopping_app/api/recipe_api.dart';
import 'package:shopping_app/api/recipe_json.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
    //print(_recipes);
  }

  result({String title = "empty"}) {
    Map<String, dynamic> data = {
      "title": 'Chicken wings',
      "rating": '5.0',
      "cookTime": '5 min',
      "thumbnailUrl":
          'http://www.todayifoundout.com/wp-content/uploads/2013/02/buffalo-wings.jpg'
    };
    FirebaseFirestore.instance
        .collection('public')
        //.add({'timeStamp': Timestamp.fromDate(DateTime.now())});
        .add(data);
    print('Someone clicked the button');
  }

  Color bnColor =
      SettingsPhone().isNightMode ? Colors.deepPurple[900] : Colors.red;
  Color bgColor =
      SettingsPhone().isNightMode ? Colors.blueGrey[900] : Colors.white;
  Color txColor = SettingsPhone().isNightMode ? Colors.black : Colors.red;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          backgroundColor: bgColor,
          title: Center(
            child: Text(
              'Shop!            ',
              style: TextStyle(
                color: txColor,
              ),
            ),
          ),
          iconTheme: IconThemeData(
            color: bnColor,
          ),
        ),
        //   body: SafeArea(
        //     child: ListView(
        //       children: <Widget>[
        //         Container(
        //           width: MediaQuery.of(context).size.height,
        //           /*child: Image.asset('assets/558174.jpg',
        //         fit: BoxFit.fill,
        //         ),*/
        //         ),
        //         Column(
        //           children: [
        //             RecipeCard(
        //               title: 'Chicken wings',
        //               rating: '5.0',
        //               cookTime: '5 min',
        //               buy: result,
        //               thumbnailUrl:
        //                   'http://www.todayifoundout.com/wp-content/uploads/2013/02/buffalo-wings.jpg',
        //             ),
        //           ],
        //         ),
        //         RecipeCard(
        //           title: 'Chicken wings?',
        //           rating: '3.2',
        //           cookTime: '45 min',
        //           buy: result,
        //           thumbnailUrl:
        //               'http://www.todayifoundout.com/wp-content/uploads/2013/02/buffalo-wings.jpg',
        //         ),
        //         RecipeCard(
        //           title: 'Wings of the chickens',
        //           rating: '4.2',
        //           cookTime: '20 min',
        //           buy: result,
        //           thumbnailUrl:
        //               'http://www.todayifoundout.com/wp-content/uploads/2013/02/buffalo-wings.jpg',
        //         ),
        //         RecipeCard(
        //           title: 'Vegan chicken wings',
        //           rating: '4.0',
        //           cookTime: '30 min',
        //           buy: result,
        //           thumbnailUrl:
        //               'http://www.todayifoundout.com/wp-content/uploads/2013/02/buffalo-wings.jpg',
        //         ),
        //       ],
        //     ),
        //   ),
        // );
        body: _isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: _recipes.length,
                itemBuilder: (context, index) {
                  return RecipeCard(
                      //buy: result,
                      title: _recipes[index].name,
                      cookTime: _recipes[index].totalTime,
                      rating: _recipes[index].rating.toString(),
                      thumbnailUrl: _recipes[index].images);
                },
              ));
  }
}
