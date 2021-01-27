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
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
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
                  // remove item from list
                }),
                child: Text('Generate', style: TextStyle(color: Colors.white),),
            color: Colors.blue,)
          ],
        ),
      ),
    );
  }
}
