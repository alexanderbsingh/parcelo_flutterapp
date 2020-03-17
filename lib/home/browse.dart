import 'package:flutter/material.dart';
import 'package:parcelo/colorsParcelo.dart';
import 'package:parcelo/home/browseContent.dart';
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
    print('building browse');
    isInCart = false;
    //heightOfHome = 800;
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