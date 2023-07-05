import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';


class securitytips extends StatefulWidget {
  const securitytips({Key? key}) : super(key: key);

  @override
  State<securitytips> createState() => _securitytipsState();
}

class _securitytipsState extends State<securitytips> {
  bool _isDarkMode = false;

  @override
  void initState() {
    _loadDarkMode();
    super.initState();
  }

  Future<void> _loadDarkMode() async {
    final prefs = await SharedPreferences.getInstance();
    final bool? isDarkMode = prefs.getBool('isDarkMode') ?? false;
    setState(() {
      _isDarkMode = isDarkMode!;
    });
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return MaterialApp(
        theme: _isDarkMode ? ThemeData.dark() : ThemeData.light(),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar (

            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios_new,color: Colors.white,),
              onPressed: ()=> Navigator.pop(context),

            ),
            backgroundColor:Color(0xff8d0000) ,
            centerTitle: true,
            title: Text ('Security tips'.tr),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(25),
              ),
            ),

          ),

          body:
          Container(
            child: Container(

              child: ListView(

                padding: EdgeInsets.only(left: 20,right: 20),
                children: <Widget>[
                  SizedBox(height:30),

                  Expanded(child:
                  Center(
                    child: Icon(Icons.security,color:Color(0xff8d0000),size: 40),
                  )),

                  Expanded(child:
                  Container(
                    child: Text('Dear customer,\nFor your security, and to ensure you are on the legitimate page of FNB, upon your initial login, you will be asked to enter your username and password then select your preferred authentication type (Face id or OTP). FNB applies strict security rules for Internet Banking Service; however FNB expects you to assume a very important role to protect your information and your money.'.tr
                        ,style: TextStyle(fontSize: 19,height: 1.8,)),
                  )),
                  Divider(
                    height: 25,
                    thickness: 1.5,
                    color: Color(0xff8d0000),
                  ),
                  Expanded(child:
                  Container(
                    child: Text('FNB would like to draw your attention to the following precautions:'.tr
                        ,style: TextStyle(fontSize: 19,height: 1.8,)),
                  )),
                  Expanded(child:
                  Container(
                    child: Text('1 - Select a password that is difficult for others to guess.'
                        '\n2 - Do not associate your password with anything personal such as birthdays, names,phone numbers.'
                        '\n3 - Change your password regularly.'
                        '\n4 - Access FNB mobile app from trusted device.'
                        '\n5 - Please remember that FNB will never ask you to provide user ID, password, card details, personal information via email, phone or SMS.\n'.tr
                        ,style: TextStyle(fontSize: 18,height: 1.8,)),
                  )),





                ],),),),



        ));
  }
}
