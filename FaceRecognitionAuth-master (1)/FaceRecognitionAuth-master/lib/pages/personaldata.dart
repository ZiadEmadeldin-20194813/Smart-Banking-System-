import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../pages/payments.dart';
import '../pages/currencies.dart';
import '../pages/home.dart';
import 'package:get/get.dart';

class personaldata extends StatefulWidget {

  var data;
  var name;
  var dob1;
  var nationality;
  var gender;
  var mart;
  var add;
  var emailadd;
  var homenum;
  var mobilenum;
  var jobb;
  var jobbadd;
  var income;
  var type;
  var id;
  var accountnum1;
  var balance1;
  var money;
  var username;
  var password;


  personaldata(
      {
        required this.data,
        required this.name,
        required this.dob1,
        required this.nationality,
        required this.gender,
        required this.mart,
        required this.add,
        required this.emailadd,
        required this.homenum,
        required this.mobilenum,
        required this.jobb,
        required this.jobbadd,
        required this.income,
        required this.type,
        required this.id,
        required this.accountnum1,
        required this.balance1,
        required this.money,
        required this.username,
        required this.password,});
  @override
  State<personaldata> createState() => _personaldataState(data: data, name: name, dob1: dob1, nationality: nationality, gender: gender, mart: mart, add: add, emailadd: emailadd, homenum: homenum, mobilenum: mobilenum, jobb: jobb, jobbadd: jobbadd, income: income, type: type, id: id, accountnum1: accountnum1, balance1: balance1, money: money, username: username, password: password);
}

class _personaldataState extends State<personaldata> {


  var data;
  var name;
  var dob1;
  var nationality;
  var gender;
  var mart;
  var add;
  var emailadd;
  var homenum;
  var mobilenum;
  var jobb;
  var jobbadd;
  var income;
  var type;
  var id;
  var accountnum1;
  var balance1;
  var money;
  var username;
  var password;


  _personaldataState(
      {
        required this.data,
        required this.name,
        required this.dob1,
        required this.nationality,
        required this.gender,
        required this.mart,
        required this.add,
        required this.emailadd,
        required this.homenum,
        required this.mobilenum,
        required this.jobb,
        required this.jobbadd,
        required this.income,
        required this.type,
        required this.id,
        required this.accountnum1,
        required this.balance1,
        required this.money,
        required this.username,
        required this.password,});

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
            title: Text ('My Personal data'.tr),
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

          Container(
            child: Text('Full name'.tr,style: TextStyle(fontSize: 18,)),
          ),
            Container(
              child: Text('$name',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
            ),

            SizedBox(height: 20,),
            Container(
              child: Text('Mobile number'.tr,style: TextStyle(fontSize: 18,)),
            ),
            Container(
              child: Text('$mobilenum',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 20,),
            Container(
              child: Text('Email'.tr,style: TextStyle(fontSize: 18,)),
            ),
            Container(
              child: Text('$emailadd',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,decoration: TextDecoration.underline)),
            ),


            SizedBox(height: 20,),
            Container(
              child: Text('National id'.tr,style: TextStyle(fontSize: 18,)),
            ),
            Container(
              child: Text('$id',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 20,),
            Container(
              child: Text('Account type'.tr,style: TextStyle(fontSize: 18,)),
            ),
            Container(
              child: Text('$type',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
            ),

            SizedBox(height: 20,),
            Container(
              child: Text('Address'.tr,style: TextStyle(fontSize: 18,)),
            ),
            Container(
              child: Text('$add',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 20,),
            Container(
              child: Text('Job'.tr,style: TextStyle(fontSize: 18,)),
            ),
            Container(
              child: Text('$jobb',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 20,),
            Container(
              child: Text('Nationality'.tr,style: TextStyle(fontSize: 18,)),
            ),
            Container(
              child: Text('$nationality',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 20,),
            Container(
              child: Text('Marital status'.tr,style: TextStyle(fontSize: 18,)),
            ),
            Container(
              child: Text('$mart',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 20,),
            Container(
              child: Text('Date of birth'.tr,style: TextStyle(fontSize: 18,)),
            ),
            Container(
              child: Text('$dob1',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
            ),


            SizedBox(height: 50,),
            Expanded(child:
            Container(
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.black),
                borderRadius: BorderRadius.circular(10),
                color: Colors.black12,
              ),
              child: Column(
                children:<Widget> [
                  Container(
                    child: Icon(Icons.notification_important,size: 40),
                  ),
                  Container(

                    child: Text(' Please note, you cannot change your personal data from here, you have to visit your nearest branch\n'.tr,textAlign: TextAlign.center),
                  ),

                ],
              ),
            ),

            ),

            SizedBox(height: 20,),


          ],),),),



        ));
  }
}
