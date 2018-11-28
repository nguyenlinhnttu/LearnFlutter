import 'package:flutter/material.dart';
import 'package:hello_rectangle/category.dart';
import 'package:hello_rectangle/unit.dart';

final _backgroundColor = Colors.green[100];

class CategoryRoute extends StatefulWidget {
  const CategoryRoute();

  @override
  _CategoryRouteState createState() => _CategoryRouteState();
}

class _CategoryRouteState extends State<CategoryRoute> {
  final categories = <Category>[];
  static const _categoryNames = <String>[
    'Length',
    'Area',
    'Volume',
    'Mass',
    'Time',
    'Digital Storage',
    'Energy',
    'Currency',
  ];
  static const _baseColors = <Color>[
    Colors.teal,
    Colors.orange,
    Colors.pinkAccent,
    Colors.blueAccent,
    Colors.yellow,
    Colors.greenAccent,
    Colors.purpleAccent,
    Colors.red,
  ];

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < _categoryNames.length; i++) {
      categories.add(Category(
          name: _categoryNames[i],
          color: _baseColors[i],
          iconLocation: Icons.cake,
          units: _retrieveUnitList(_categoryNames[i])));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Unit Converter',
          style: TextStyle(
            color: Colors.black,
            fontSize: 30.0,
          ),
        ),
        backgroundColor: _backgroundColor,
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: _buildCategoryWidget(),
      ),
    );
  }

  Widget _buildCategoryWidget() {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) => categories[index],
      itemCount: _categoryNames.length,
    );
  }

  // Returns a list of mock [Unit]s.
  List<Unit> _retrieveUnitList(String categoryName) {
    return List.generate(10, (int i) {
      i += 1;
      return Unit(
        name: '$categoryName Unit $i',
        conversion: i.toDouble(),
      );
    });
  }
}
