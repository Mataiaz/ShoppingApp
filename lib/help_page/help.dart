import 'package:flutter/material.dart';
import 'support_card.dart';
import 'support.dart';
import 'package:shopping_app/pages/settings.dart';

class Help extends StatefulWidget {

  @override
  _HelpState createState() => _HelpState();
}

class _HelpState extends State<Help> {
  List<Support> supporting = [
    Support(tried: 'How do i know if my payment went through?', support: 'You will have gotten an email from us!'),
    Support(tried: 'I want to work for you/with you', support: 'Just contact us at realBusiness@live.com'),
    Support(tried:'My product got damaged/did not arrive', support: 'Send us the details and your order number at realBusiness@live.com or call the helpline'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('SUPPORT           ')),
        backgroundColor: Colors.red,
      ),
    body: SafeArea(
      child: Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: 10),
            Text('Helpline',
              style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.red
              ),
            ),
            SizedBox(height: 5),
            Text('+47 800 67 201'),
            SizedBox(height: 10),
            Text('We recommend you read the advices below before calling',
              style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.red
              ),
            ),
            Column(
              children: supporting.map((support) => SupportCard(
                  support: support,
              )).toList(),
            ),
          ],
        ),
      ),
    ),
    );
  }
}
