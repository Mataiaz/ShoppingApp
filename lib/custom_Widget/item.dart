import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  final List<String> itemName;
  final List<String> itemPrice;

  Item(this.itemName, this.itemPrice);

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        // Around container space: spacing around children/container
        margin: const EdgeInsets.all(10),

        color: Colors.amber,

        child: Column(
          children: <Widget>[
            for (var i = 0; i < itemName.length; i++)
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    itemName[i],
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w800,
                      fontFamily: 'Roboto',
                      letterSpacing: 0.5,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    " " + itemPrice[i],
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w800,
                      fontFamily: 'Roboto',
                      letterSpacing: 0.5,
                      fontSize: 20,
                    ),
                  )
                ],
              ),
          ],
        ),
      ),
    );
  }
}
