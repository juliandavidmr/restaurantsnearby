import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Transactions"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Container(
          child: GridView.count(
          // Create a grid with 2 columns. If you change the scrollDirection to
          // horizontal, this produces 2 rows.
          crossAxisCount: 2,
          // Generate 100 widgets that display their index in the List.
          children: List.generate(10, (index) {
            return Container(
              padding: EdgeInsets.all(10),
              child: Card(
                elevation: 5,
                child: Center(
                  child: Text("Transaction #$index")
                ),
              )
            );
          }),
        )
        ),
      )
    );
  }
}
