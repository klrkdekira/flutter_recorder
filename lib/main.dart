import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';
import 'package:recorder/services/location.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          StreamProvider(create: (context) => LocationService().locationStream),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: MyHomePage(title: "GPS Logger"),
        ));
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({this.title = ''});

  final String title;

  @override
  Widget build(BuildContext context) {
    var location = Provider.of<LocationData>(context);

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '$location.toString()',
            ),
          ],
        ),
      ),
    );
  }
}
