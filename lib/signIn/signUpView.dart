import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parcelo/checkPassword.dart';
import 'package:parcelo/checkValidEmail.dart';
import 'package:parcelo/colorsParcelo.dart';
import 'package:parcelo/customAnimation/EnterExitRoute.dart';
import 'package:parcelo/customWidget/circleProgress.dart';
import 'package:parcelo/customWidget/customExpanded.dart';

import '../argParcelo.dart';
import 'firstSignInView.dart';

class SignUpView extends StatefulWidget {
  @override
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> with TickerProviderStateMixin{
  double progress = 0.0;
  double newProgress = 0.09;
  int posProgress = 0;
  String title = 'Låt oss börja';
  String subTitle = 'Vad har du för mejladress?';
  String hint = 'E-postaddress';
  String errorTxt = 'Not a valid email address';
  bool isError = false;
  bool isError2 = false;


//progress indicator
  AnimationController _progressController;
  Animation _progressAnimation;

//mid widgets
  AnimationController _midAnimationController;
  Animation<Offset> _slideOutAnimation;

  AnimationController _passwordAnimationController;
  Animation<Offset> _slideDownAnimation;
  bool is2PasswordVisible = false;

  final inputController = TextEditingController(); 
  final passwordInputController = TextEditingController();  
 

  @override
  void initState() {
    super.initState();
    _progressController = AnimationController(vsync: this, duration: Duration(milliseconds: 1000));
    _progressAnimation = Tween<double>(begin: 0.0, end: 100.0).animate(_progressController)..addListener((){
      setState(() {
      });
    });

    _midAnimationController = AnimationController(duration: const Duration(milliseconds: 3000), vsync: this);
    _slideOutAnimation = Tween<Offset>(begin: Offset.zero, end: const Offset(-2, 0.0))
    .animate(CurvedAnimation(parent: _midAnimationController, curve: Curves.elasticInOut))..addListener((){
      setState(() {
      });
    });

    _passwordAnimationController = AnimationController(duration: const Duration(milliseconds: 2000), vsync: this);
    _slideDownAnimation = Tween<Offset>(begin: Offset.zero, end: const Offset(0, 1),)
    .animate(CurvedAnimation(parent: _passwordAnimationController,curve: Curves.elasticOut));
  }

   bool isNext(String text) {
    if (posProgress == 0 && isEmail(text)) {
      return true;
    } else if (posProgress == 1 && text.isNotEmpty) {
      return true;
    } else if (posProgress == 2 && text.isNotEmpty) {
      return true;
    } else if (posProgress == 3 && isPassword(text)) {
      return true;
    } else if (posProgress == 4 && isPassword(text)) {
      return true;
    } else {
      isError = true;
      setState(() {
        
      });
      return false;
    }
  }

  void changeInfo() {
    print(posProgress);
    isError = false;
    inputController.clear();

    if (posProgress == 0) {
      title = 'Låt oss börja,';
      subTitle = 'Vad har du för mejladress?';
      hint = 'E-postadress';
      errorTxt = 'Inte en korrekt e-post';

    } else if (posProgress == 1) {
      title = 'Hmm vart ska vi leverera?';
      subTitle = 'Var bor du?';
      hint = 'Adress';
      errorTxt = 'Ej en adress';

    } else if (posProgress == 2) {
      title = 'Vad ska vi kalla dig?';
      subTitle = 'Vad heter du?';
      hint = 'Namn';
      errorTxt = 'Du kan inte lämna fältet tomt';

    } else if (posProgress == 3) {
      title = 'Nästan färdiga,';
      subTitle = 'Vad vill du ha för lösenord?';
      hint = 'Lösenord';
      errorTxt = 'Lösenords error'; //needs fix

    } 
  }

  void forward(){
    if (posProgress < 3 && isNext(inputController.text)) {
      posProgress++;
      _midAnimationController.forward();
      Future.delayed(const Duration(milliseconds: 2000), () {
        changeInfo();
        _midAnimationController.reverse();
        _progressController.forward();
        Future.delayed(const Duration(milliseconds: 200), () {
          _progressController.stop();
        });
      });
    } else if (posProgress == 3 && isNext(inputController.text)) {
      posProgress++;
      setState(() {
        isError = false;
        is2PasswordVisible = true;
      });
    } else if (posProgress == 4 && isNext(inputController.text) && inputController.text == passwordInputController.text) {
      print('done with sign up');
      setState(() {
        isError = false;
        isError2 = false;
      });
    } else if (posProgress == 4 && inputController.text != passwordInputController.text) {
      setState(() {
        isError = false;
        isError2 = true;
      });
    }
  }

  void back(){
    if (posProgress == 0){
      print(posProgress);
      Navigator.pop(context);
    } else if (posProgress > 0 && posProgress < 4
    ) {
      posProgress--;
      _midAnimationController.forward();
      Future.delayed(const Duration(milliseconds: 2000), () {
        changeInfo();
        _midAnimationController.reverse();
        _progressController.reverse();
        Future.delayed(const Duration(milliseconds: 200), () {
          _progressController.stop();
        });
      });
    } else if (posProgress == 4) {
      posProgress--;
      setState(() {
        is2PasswordVisible = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
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
              alignment: Alignment(-1.5,-1.15),
              child: Transform.rotate(
                angle: 0.3 *pi,
                child: CustomPaint(
                  foregroundPainter: CircleProgress(_progressAnimation.value, ColorsParcelo.PrimaryColor, ColorsParcelo.PrimaryColorLight, 30), // this will add custom painter after child
                  child: Container(
                    width: 200,
                    height: 200,
                  ),
                ),
              )
            ),

            Scaffold(
              backgroundColor: Colors.transparent,
              body: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment(1, 1),
                    child: Container(
                      alignment: Alignment.bottomLeft,
                      height: MediaQuery.of(context).padding.bottom + 70,
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(topRight: Radius.circular(ArgParcelo.bigCornerRadius), topLeft: Radius.circular(ArgParcelo.bigCornerRadius)), boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 17.0,
                        ),
                      ]),
                      child: Padding(
                        padding: EdgeInsets.only(right: ArgParcelo.margin, bottom: MediaQuery.of(context).padding.bottom + ArgParcelo.smallMargin),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[

                            Padding(
                              padding: EdgeInsets.only(left: ArgParcelo.margin),
                              child: FlatButton(
                                  onPressed: () async{
                                    print('pressed back');
                                    back();
                                  },
                                  color: Colors.transparent,
                                  shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(22.0)),
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 44,
                                    width: 70,
                                    child: Text(
                                      'Bakåt',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w800,
                                          fontSize: 16
                                      )
                                    ),
                                  ),
                                ),
                            ),

                              customExpanded(),

                              FlatButton(
                                onPressed: () async{
                                  print('pressed next');
                                  forward();
                                  },
                                color: ColorsParcelo.PrimaryColorLight,
                                shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(22.0)),
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 44,
                                  width: 120,
                                  child: Text(
                                    'Nästa',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16
                                    )
                                  ),
                                ),
                              ),

                          ],
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment(1, 1),
                    child: Padding(
                      padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom + 60 + ArgParcelo.margin, right: ArgParcelo.margin),
                      child: Text(
                        posProgress.toString() + '/4',
                        style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontSize: ArgParcelo.header,
                          fontWeight: FontWeight.w700
                        ),
                      ),
                    )
                  ),

                  Align(
                    alignment: Alignment(0, 0),
                    child: SlideTransition(
                      position: _slideOutAnimation,
                      child: Container(
                        color: Colors.transparent,
                        height: 261,
                        width: 300,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              title,
                              style: TextStyle(
                                fontSize: ArgParcelo.largeHeader,
                                fontWeight: FontWeight.bold
                              ),
                            ),

                            Text(
                              subTitle,
                              style: TextStyle(
                                fontSize: ArgParcelo.header,
                                fontWeight: FontWeight.w600
                              ),
                            ),

                            Padding(
                              padding: EdgeInsets.only(top: ArgParcelo.smallMargin),
                              child: Theme(
                                data: ThemeData(
                                  primaryColor: ColorsParcelo.PrimaryTextColor,
                                  accentColor: ColorsParcelo.AccentColor,
                                  hintColor: ColorsParcelo.SecondaryTextColor,
                                  cursorColor: ColorsParcelo.PrimaryColor,
                                  cupertinoOverrideTheme: CupertinoThemeData(
                                    primaryColor: ColorsParcelo.PrimaryColor,
                                  ),
                                ),
                                child: TextField(
                                  controller: inputController,
                                  textInputAction: TextInputAction.search,onSubmitted: (value){
                                    print("pressed enter");
                                    forward();
                                  },
                                  decoration: InputDecoration(
                                    errorText: isError ? errorTxt : null,
                                    filled: true,
                                    fillColor: ColorsParcelo.LightGreyColor,
                                    labelText: hint, 
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: ColorsParcelo.PrimaryColor),
                                    ),  
                                    
                                  ),
                                ),
                              ),
                            ),

                             Padding(
                               padding: EdgeInsets.only(top: ArgParcelo.margin),
                               child: SlideTransition(
                                position: _slideDownAnimation,
                                child:AnimatedOpacity(
                                  opacity: is2PasswordVisible ? 1.0 : 0.0,
                                  duration: Duration(milliseconds: 500),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'Upprepa lösenord'
                                      ),  

                                      Padding(
                                        padding: EdgeInsets.only(top: 5),
                                        child: Theme(
                                          data: ThemeData(
                                            primaryColor: ColorsParcelo.PrimaryTextColor,
                                            accentColor: ColorsParcelo.AccentColor,
                                            hintColor: ColorsParcelo.SecondaryTextColor,
                                            cursorColor: ColorsParcelo.PrimaryColor,
                                            cupertinoOverrideTheme: CupertinoThemeData(
                                              primaryColor: ColorsParcelo.PrimaryColor,
                                            ),
                                          ),
                                          child: TextField(
                                            controller: passwordInputController,
                                            textInputAction: TextInputAction.search,onSubmitted: (value){
                                              print("pressed enter");
                                              forward();
                                            },
                                            decoration: InputDecoration(
                                              errorText: isError2 ? 'Lösenorden matchar ej' : null,
                                              filled: true,
                                              fillColor: ColorsParcelo.LightGreyColor,
                                              labelText: 'Lösenord', 
                                              focusedBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(color: ColorsParcelo.PrimaryColor),
                                              ),  
                                              
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                            ),
                             )
                          ]
                        ),
                      ),
                    ),
                  )
                ]
              )
            ),
            
          ],
        ),
      ),
    );
  }
}

