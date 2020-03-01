import 'package:flutter/material.dart';
import 'package:parcelo/colorsParcelo.dart';
import 'package:parcelo/home/browseContent.dart';
import 'package:parcelo/home/home.dart';
import 'package:parcelo/whichService.dart';
import '../argParcelo.dart';
import '../cellHeight.dart';
import 'package:parcelo/globalVar.dart';



class Browse extends StatefulWidget {

  @override
  _BrowseState createState() => _BrowseState();
}

class _BrowseState extends State<Browse> {
  var typeHeader = ['', 'Nyligen visat', 'Bara hos Parcelo'];
  var typeList = ['top', 'product', 'store'];  

  @override
  Widget build(BuildContext context) {
    isInCart = false;
    return ListView.builder(
    physics: NeverScrollableScrollPhysics(),
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
                  oldSnapshotBrowse = snapshot.data;
                  return browseContent(context, snapshot.data, typeList[pos]);
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                /*else if (snapshot.connectionState == ConnectionState.none) {
                  return Container(height: 10, width: 10, color: Colors.white,);
                } else if (snapshot.connectionState == ConnectionState.active) {
                  return Container(height: 10, width: 10, color: Colors.white,);
                } else if (snapshot.connectionState == ConnectionState.waiting){
                  return Container(height: 10, width: 10, color: Colors.white,);
                }*/
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