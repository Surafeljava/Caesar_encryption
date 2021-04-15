import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController textEditingController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('Caesar Encryption', style: TextStyle(color: Colors.grey[800], fontSize: 25.0, fontWeight: FontWeight.w600, letterSpacing: 1.0),),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
              child: TextFormField(
                controller: textEditingController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: 'Type here'
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
