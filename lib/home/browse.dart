import 'package:flutter/material.dart';
import 'package:parcelo/colorsParcelo.dart';
import 'package:parcelo/home/browseContent.dart';
import 'package:parcelo/whichService.dart';
import '../argParcelo.dart';
import '../cellHeight.dart';

class Browse extends StatefulWidget {
  @override
  _BrowseState createState() => _BrowseState();
}

class _BrowseState extends State<Browse> {
  var typeHeader = ['', 'Recent', 'Only on Parcelo'];
  var typeList = ['top', 'product', 'store'];

  @override
  Widget build(BuildContext context) {

    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, pos) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            if(typeHeader[pos].isNotEmpty) Padding(
              padding: const EdgeInsets.only(left: 15, top: 10),
              child: Text(
                typeHeader[pos],
                style: TextStyle(
                  color: ColorsParcelo.PrimaryTextColor,
                  fontWeight: FontWeight.w600,
                  fontSize: ArgParcelo.subHeader
                ),
              ),
            ),

            Container(
              height: cellHeight(typeList[pos]),
              child: FutureBuilder(
                future: whichService(typeList[pos]),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return browseContent(context, snapshot.data, typeList[pos]);
                    
                  } else if (snapshot.connectionState == ConnectionState.none) {
                    return null;
                  }
                },
              )
              
              
            ),
          ],
        );
      },
      itemCount: typeList.length,
    );
  }
}