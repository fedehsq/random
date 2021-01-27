import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Filler(),
    );
  }
}

class Filler extends StatelessWidget {
  final List<double> doubles = [];
  
  /// add double values between 'from' and 'to' in 'doubles'
  void addToList(double from, double to) {
    for (double i = from; i <= to; i += 0.01) {
      doubles.add(i);
    }
  }
  
  @override
  Widget build(BuildContext context) {
    addToList(1.01, 1.28);
    addToList(2.01, 2.12);
    addToList(3.01, 3.14);
    addToList(4.01, 4.25);
    return Randomizer(doubles: doubles);
  }
}


class Randomizer extends StatefulWidget {
  final List<double> doubles;
  const Randomizer({Key key, this.doubles}) : super(key: key);

  @override
  _RandomizerState createState() => _RandomizerState();
}

class _RandomizerState extends State<Randomizer> {

  String shown = 'Press generate to start';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Randomizer"),
      ),
      body:

      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Remaining questions: ${widget.doubles.length}',
              style: TextStyle(fontSize: 16),
            ),
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Text(
                shown,
                style: TextStyle(fontSize: 24),
              ),
            ),
            FlatButton(onPressed: () =>
                setState(() {
                  if (widget.doubles.isEmpty) {
                    shown = 'Empty list';
                  } else {
                    int i = new Random().nextInt(widget.doubles.length);
                    shown = widget.doubles[i].toStringAsFixed(2);
                    shown = (shown[2] == '0') ? shown.replaceRange(2, 3, '') : shown;
                    widget.doubles.removeAt(i);
                  }
                }),
                child: Text('Generate', style: TextStyle(color: Colors.white),),
            color: Colors.blue,)
          ],
        ),
      ),
    );
  }
}
