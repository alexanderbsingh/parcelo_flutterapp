import 'package:flutter/material.dart';

import '../colorsParcelo.dart';

class FilterHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        brightness: Brightness.light,
        elevation: 0,
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: <Widget>[
                GestureDetector(
                    onTap: () {
                      print('pressed, exit');
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.clear,
                      size: 24,
                      color: ColorsParcelo.PrimaryTextColor,
                    )
                ),
              ],
            ),
          ),

          Expanded(
            child: Container(
              alignment: Alignment.center,
              color: Colors.white10,
              child: Text(
                'Filter Home',
              ),
            ),
          ),
        ],
      ),
    );
  }
}