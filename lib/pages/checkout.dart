import 'package:flutter/material.dart';import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shopping_app/api/recipe_json.dart';
import 'package:shopping_app/custom_Widget/recipe_card.dart';

class Checkout extends StatefulWidget {
  const Checkout({Key key}) : super(key: key);

  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  List<Recipe> _recipes;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    //getRecipesFromFB();
  }

  Future<void> getRecipesFromFB() async {
    var _instance = FirebaseFirestore.instance;
    CollectionReference recepies = _instance.collection("public");
    DocumentSnapshot snapshot = await recepies.doc("History").get();
    //var data = snapshot.data() as Map;
    //const yourData = await _instance.forEach((element) {
    //  Recipe x =
    //      Recipe(name: element(), images: "sdf", rating: 1, totalTime: "dsf");
    //  _recipes.add(x);
    //});
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

  getDataFromFB() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text('Checkout          '),
          ),
        ),
          body: StreamBuilder(
            stream: FirebaseFirestore.instance.collection("public").snapshots(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Text("No value");
              }
              return ListView(
                children: snapshot.data.docs.map((document) {
                  return Text(document['title']);
                }).toList(),
              );
            },
          ),
        );
        // body: _isLoading
        //     ? Center(child: CircularProgressIndicator())
        //     : ListView.builder(
        //   itemCount: _recipes.length,
        //   itemBuilder: (context, index) {
        //     return RecipeCard(
        //         title: _recipes[index].name,
        //         cookTime: _recipes[index].totalTime,
        //         rating: _recipes[index].rating.toString(),
        //         thumbnailUrl: _recipes[index].images);
        //   },
        // ));
  }
}
