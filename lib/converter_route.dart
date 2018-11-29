import 'package:flutter/material.dart';
import 'package:hello_rectangle/unit.dart';

class ConverterRoute extends StatelessWidget {
  final List<Unit> units;
  final String name;
  final Color color;

  const ConverterRoute({
    @required this.name,
    @required this.color,
    @required this.units,
  })  : assert(name != null),
        assert(color != null),
        assert(units != null);

  @override
  Widget build(BuildContext context) {
    final unitWidgets = units.map((Unit unit) {
      return Container(
        color: color,
        margin: EdgeInsets.all(8.0),
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Text(
              unit.name,
              style: Theme.of(context).textTheme.subhead,
            ),
            Text(
              'Conversion: ${unit.conversion}',
              style: Theme.of(context).textTheme.subhead,
            ),
          ],
        ),
      );
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Unit Converter',
          style: TextStyle(
            color: Colors.black,
            fontSize: 30.0,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: unitWidgets,
      ),
    );

  }
}
