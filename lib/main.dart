import 'package:flutter/material.dart';
//import 'package:tables_app/screens/01_Table.dart';
//import 'package:tables_app/screens/02_Table_Groupped.dart';
import 'package:tables_app/screens/03_AnimatedPieChart.dart';

main() {
  runApp(TablesApp());
}

class TablesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Tables App')),
        //body: SimpleTable(),
        //body: GrouppedTable()),
        body: AnimatedPieChart(),
      ),
    );
  }
}
