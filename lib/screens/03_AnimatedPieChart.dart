import 'package:flutter/material.dart';
import 'package:tables_app/models/Sales_PieChart.dart';

import 'package:charts_flutter/flutter.dart' as charts;

class AnimatedPieChart extends StatefulWidget {
  @override
  _AnimatedPieChartState createState() => _AnimatedPieChartState();
}

class _AnimatedPieChartState extends State<AnimatedPieChart> {
  List<SalesPieChart> _data;
  List<charts.Series<SalesPieChart, int>> _chartData;

  void _createData() {
    _chartData = List<charts.Series<SalesPieChart, int>>();
    _data = <SalesPieChart>[
      SalesPieChart(2010, 100, charts.MaterialPalette.red.shadeDefault),
      SalesPieChart(2011, 75, charts.MaterialPalette.blue.shadeDefault),
      SalesPieChart(2012, 25, charts.MaterialPalette.green.shadeDefault),
      SalesPieChart(2013, 10, charts.MaterialPalette.yellow.shadeDefault),
    ];

    _chartData.add(charts.Series(
      id: 'Sales',
      data: _data,
      colorFn: (SalesPieChart sales, __) => sales.color,
      domainFn: (SalesPieChart sales, _) => sales.year,
      measureFn: (SalesPieChart sales, _) => sales.sales,
    ));
  }

  @override
  void initState() {
    super.initState();
    _createData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pie Chart'),
      ),
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: [
              Text('Sales Data'),
              Expanded(
                child: charts.PieChart(
                  _chartData,
                  animate: true,
                  animationDuration: Duration(seconds: 5),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
