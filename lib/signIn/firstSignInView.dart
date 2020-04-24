import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parcelo/colorsParcelo.dart';
import 'package:parcelo/customAnimation/EnterExitRoute.dart';
import 'package:parcelo/signIn/signUpView.dart';

import '../argParcelo.dart';

class FirstSignInView extends StatefulWidget {
  @override
  _FirstSignInViewState createState() => _FirstSignInViewState();
}

class _FirstSignInViewState extends State<FirstSignInView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment(-1.8, 0.9),
              child: Container(
                height: 210,
                width: 210,
                decoration: new BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  border: new Border.all(
                    color: ColorsParcelo.AccentColor,
                    width: 28,
                  ),
                ),
              ),
            ),

            Align(
              alignment: Alignment(1.35, 0.4),
              child: Opacity(
                opacity: 0.2,
                child: Container(
                  height: 150,
                  width: 150,
                  decoration: new BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: new Border.all(
                      color: ColorsParcelo.PrimaryColor,
                      width: 24,
                    ),
                  ),
                ),
              ),
            ),

            Align(
              alignment: Alignment(-0.7, -0.6),
              child: Opacity(
                opacity: 0.2,
                child: Container(
                  height: 120,
                  width: 120,
                  decoration: new BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: new Border.all(
                      color: ColorsParcelo.PrimaryColor,
                      width: 19,
                    ),
                  ),
                ),
              ),
            ),


            Align(
              alignment: Alignment(1.6, -0.4),
              child: Padding(
                padding: EdgeInsets.only(left: ArgParcelo.margin, top: MediaQuery.of(context).padding.top),
                child: Opacity(
                  opacity: 0.2,
                  child: Image(
                    image: AssetImage("assets/parcelo_bike.png"), 
                    height: 140,
                  ),
                ),
              ),
            ),

            Align(
              alignment: Alignment(-1, -0.1),
              child: Padding(
                padding: EdgeInsets.only(left: ArgParcelo.margin, top: MediaQuery.of(context).padding.top),
                child: Wrap(
                  children: <Widget>[

                    Text(
                      'Parcelo,',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: ColorsParcelo.PrimaryColor,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                          fontSize: ArgParcelo.productTitleLarge
                      )
                    ),

                    Text(
                      'Ditt pizzabud för produkter',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: ColorsParcelo.PrimaryColor,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal,
                          fontSize: ArgParcelo.largeHeader
                      )
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(right: ArgParcelo.margin, bottom: MediaQuery.of(context).padding.bottom),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[

                  FlatButton(
                    onPressed: () async{
                      print('pressed next');
                      Navigator.push(context, EnterExitRoute(enterPage: SignUpView(), exitPage: FirstSignInView()));

                      },
                    
                    color: Colors.black,
                    shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(22.0)),
                    child: Container(
                      alignment: Alignment.center,
                      height: 44,
                      width: 120,
                      child: Text(
                        'Fortsätt',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 16
                        )
                      ),
                    ),
                  ),

                  GestureDetector(
                    onTap: () async{
                      print('pressed already have an account');
                    
                      }, 
                    child: Container(
                      padding: EdgeInsets.only(top: 5),
                      alignment: Alignment.bottomRight,
                      child: Text(
                        'Redan en användare? Logga in här',
                        textAlign: TextAlign.end,
                        style: TextStyle(
                            color: ColorsParcelo.PrimaryColor,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.italic,
                            fontSize: 14
                        )
                      ),
                    ),)
                ],
              ),
            )
            ,
          ],
        ),
      ),
    );
  }
}