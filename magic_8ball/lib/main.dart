import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueAccent,
        appBar: AppBar(
          title: Center(
            child: Text(
              'Ask Me Anything',
              style: TextStyle(
                fontFamily: 'Raleway',
                fontSize: 40.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          backgroundColor: Colors.lightBlue,
        ),
        body: _Ball(),
      ),
    ),
  );
}

class _Ball extends StatefulWidget {
  const _Ball({Key? key}) : super(key: key);

  @override
  _BallState createState() => _BallState();
}

class _BallState extends State<_Ball> {
  int Ballnumber = 3;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(200.0),
              child: FlatButton(
                onPressed: () {
                  setState(() {
                    Ballnumber = Random().nextInt(5) + 1;
                    print(Ballnumber);
                  });
                },
                child: Image.asset('images/ball$Ballnumber.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
