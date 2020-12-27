import 'package:flutter/material.dart';
import 'dart:math';
import 'package:charts_flutter/flutter.dart' as charts;

import 'package:tables_app/models/Sales.dart';

class GrouppedTable extends StatefulWidget {
  @override
  _GrouppedTableState createState() => _GrouppedTableState();
}

class _GrouppedTableState extends State<GrouppedTable> {
  List<Sales> _laptops;
  List<Sales> _desktops;
  List<charts.Series<Sales, String>> _chartData;
  @override
  void initState() {
    super.initState();
    _createData();
  }

  void _createData() {
    _laptops = List<Sales>();
    _desktops = List<Sales>();
    _chartData = List<charts.Series<Sales, String>>();
    final rnd = Random();
    for (var i = 2016; i < 2019; i++) {
      _laptops.add(Sales(i.toString(), rnd.nextInt(1000)));
      _desktops.add(Sales(i.toString(), rnd.nextInt(1000)));
    }
    _chartData.add(
      charts.Series(
          id: 'Sales',
          colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
          data: _laptops,
          domainFn: (Sales sales, _) => sales.year,
          measureFn: (Sales sales, _) => sales.sales),
    );
    _chartData.add(
      charts.Series(
          id: 'Sales',
          colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
          data: _desktops,
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
              child: charts.BarChart(
                _chartData,
                vertical: false,
              ),
            )
          ],
        ),
      ),
    );
  }
}
