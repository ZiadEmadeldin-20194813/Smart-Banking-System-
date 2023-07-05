import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  final int splashAnimationDuration;
  final Widget navigateAfterSeconds;

  SplashScreen({this.splashAnimationDuration=2, required this.navigateAfterSeconds});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late Animation _mapHeartAnimation;
  late AnimationController _mapHeartController;

  @override
  void initState() {

    Timer(Duration(seconds: widget.splashAnimationDuration), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => widget.navigateAfterSeconds),
              (Route route) => false);
    });

    _mapHeartController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1200));
    _mapHeartAnimation = Tween(begin: 150.0, end: 170.0).animate(
        CurvedAnimation(curve: Curves.bounceOut, parent: _mapHeartController));

    _mapHeartController.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        _mapHeartController.repeat();
      }
    });
    _mapHeartController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: new LinearGradient(
              colors: [Color(0xff8d0000), Color(0xffff4646)],
              begin: FractionalOffset(0.0, 0.0),
              end: FractionalOffset(1.0, 0.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                child: iconItemWidget(),
              ),
               CircularProgressIndicator(

                  strokeWidth: 2.5,
                 color: Colors.white,

              )

            ],
          ),
        ),
      ),
    );
  }

  Widget iconItemWidget() {
    return AnimatedBuilder(
      animation: _mapHeartController,
      builder: (BuildContext context, Widget? child) {
        return Image(image: AssetImage('images/fnb2.png'),height: 250,width: 250,);
      },
    );
  }

  @override
  void dispose() {
    _mapHeartController.dispose();
    super.dispose();
  }
}
