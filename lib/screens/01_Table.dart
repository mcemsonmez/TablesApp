import 'package:flutter/material.dart';
import 'dart:math';
import 'package:charts_flutter/flutter.dart' as charts;

import 'package:tables_app/models/Sales.dart';

class SimpleTable extends StatefulWidget {
  @override
  _SimpleTableState createState() => _SimpleTableState();
}

class _SimpleTableState extends State<SimpleTable> {
  List<Sales> _data;
  List<charts.Series<Sales, String>> _chartData;
  @override
  void initState() {
    super.initState();
    _createData();
  }

  void _createData() {
    _data = List<Sales>();
    _chartData = List<charts.Series<Sales, String>>();
    final rnd = Random();
    for (var i = 2010; i < 2019; i++) {
      _data.add(Sales(i.toString(), rnd.nextInt(1000)));
    }
    _chartData.add(
      charts.Series(
          id: 'Sales',
          colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
          data: _data,
          domainFn: (Sales sales, _) => sales.year,
          measureFn: (Sales sales, _) => sales.sales),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(32.0),
      child: Center(
        child: Column(
          children: [
            Text('Sales Data'),
            Expanded(
              child: charts.BarChart(_chartData),
            )
          ],
        ),
      ),
    );
  }
}
