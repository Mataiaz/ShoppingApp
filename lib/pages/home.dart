import 'package:flutter/material.dart';
import 'package:shopping_app/pages/NavigationDrawerWidget.dart';
import 'package:shopping_app/pages/settings.dart';
import 'package:shopping_app/custom_Widget/recipe_card.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Color bnColor = Settings().isNightMode ? Colors.deepPurple[900] : Colors.red;
  Color bgColor = Settings().isNightMode ? Colors.blueGrey[900] : Colors.white;
  Color txColor = Settings().isNightMode ? Colors.black : Colors.red;

  result() {
    print('Someone clicked the button');
  }

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
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.height,
              /*child: Image.asset('assets/558174.jpg',
            fit: BoxFit.fill,
            ),*/
            ),
            Column(
              children: [
                RecipeCard(
                  title: 'Chicken wings',
                  rating: '5.0',
                  cookTime: '5 min',
                  buy: result,
                  thumbnailUrl:
                      'http://www.todayifoundout.com/wp-content/uploads/2013/02/buffalo-wings.jpg',
                ),
              ],
            ),
            RecipeCard(
              title: 'Chicken wings?',
              rating: '3.2',
              cookTime: '45 min',
              buy: result,
              thumbnailUrl:
                  'http://www.todayifoundout.com/wp-content/uploads/2013/02/buffalo-wings.jpg',
            ),
            RecipeCard(
              title: 'Wings of the chickens',
              rating: '4.2',
              cookTime: '20 min',
              buy: result,
              thumbnailUrl:
                  'http://www.todayifoundout.com/wp-content/uploads/2013/02/buffalo-wings.jpg',
            ),
            RecipeCard(
              title: 'Vegan chicken wings',
              rating: '4.0',
              cookTime: '30 min',
              buy: result,
              thumbnailUrl:
                  'http://www.todayifoundout.com/wp-content/uploads/2013/02/buffalo-wings.jpg',
            ),
          ],
        ),
      ),
    );
  }
}
