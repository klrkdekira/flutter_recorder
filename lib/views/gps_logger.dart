import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';

class GPSLogger extends StatefulWidget {
  @override
  _GPSLoggerState createState() => _GPSLoggerState();
}

class _GPSLoggerState extends State<GPSLogger> {
  List<LocationData> _history = [];

  void _addItem(LocationData item) {
    setState(() {
      print('pressed');
      _history.add(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    var location = Provider.of<LocationData>(context);

    String display = '';
    if (location != null) {
      display = '${location.latitude},${location.longitude}';
    }

    return Column(
      children: <Widget>[
        Text("Your current position"),
        Text(display),
        Text('${_history.length}'),
        FloatingActionButton(
          onPressed: () {
            _addItem(location);
          },
          child: Icon(Icons.add),
        ),
        Container(
            height: 200,
            child: ListView.builder(
              itemCount: _history.length,
              itemBuilder: (context, index) {
                final item = _history[index];

                return ListTile(
                  title: Text('${item.latitude},${item.longitude}'),
                );
              },
            )),
      ],
    );
  }
}
