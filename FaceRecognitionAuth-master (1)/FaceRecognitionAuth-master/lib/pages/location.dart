import 'package:flutter/material.dart';
import 'package:get/get.dart';

class location extends StatefulWidget {
  const location({Key? key}) : super(key: key);

  @override
  State<location> createState() => _locationState();
}

class _locationState extends State<location> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar (

          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new,color: Colors.white,),
            onPressed: ()=> Navigator.pop(context),

          ),
          backgroundColor:Color(0xff8d0000) ,
          centerTitle: true,
          title: Text ('ATM/Branch locators'.tr),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(25),
            ),
          ),

        ),
        body:
        Column(
          children: <Widget>[
            SizedBox(height: 40),


          ],
        ),

      ),
    );
  }
}
