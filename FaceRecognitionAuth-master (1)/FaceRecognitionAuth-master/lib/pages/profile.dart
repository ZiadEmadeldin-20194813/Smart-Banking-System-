import 'dart:convert';
import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../crypto/crypto.dart';
import '../pages/f1.dart';
import '../pages/personaldata.dart';
import '../pages/payments.dart';
import '../pages/currencies.dart';
import '../pages/home.dart';
import '../pages/securitytips.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../pages/faqscode.dart';


class profile extends StatefulWidget {
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
  var pass2;


  profile(
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
        required this.password,required this.pass2,});
  @override
  State<profile> createState() => _profileState(data: data, name: name, dob1: dob1, nationality: nationality, gender: gender, mart: mart, add: add, emailadd: emailadd, homenum: homenum, mobilenum: mobilenum, jobb: jobb, jobbadd: jobbadd, income: income, type: type, id: id, accountnum1: accountnum1, balance1: balance1, money: money, username: username, password: password,pass2:pass2);
}

class _profileState extends State<profile> {
  var _index = 3;

  faqscode() {
    // TODO: implement faqscode
    throw UnimplementedError();
  }


  void showAlertDialog2(BuildContext context){
    var alertDialog = AlertDialog(

      title: Text('Call us'.tr,),
      content: Text('(452)-869-8569',style: TextStyle(fontSize: 20),textAlign: TextAlign.center),
      actions: [
        ElevatedButton(onPressed: () async {

        final Uri url = Uri (
                scheme: 'tel'.tr,
          path: "452 869 8569",
        );
        if(await canLaunchUrl(url))
          {
            await launchUrl(url);
          }
        else
          {
            print('cant launch this url'.tr);
          }


        },style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color(0xff8d0000)),),
            child: Text('Call'.tr)),



      ],
    );

    showDialog(
        context: context,
        builder: (BuildContext context){
          return alertDialog;
        }
    );
  }

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
  var pass2;


  _profileState(
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
        required this.password,required this.pass2,});




  bool _isVisible = false;
  TextEditingController pass = new TextEditingController();


  String bal = '****';

  void show() async {
    if (pass.text != pass2) {
      bal = '****';
    } else {
      final key = "2f7b4e8d71c4a00f2a3f4c175a8a4e6c";
      final aes = Aes(key);
      final encAcc = base64Encode(aes.encrypt(Uint8List.fromList(utf8.encode(accountnum1))));

      // Replace the URL with the actual URL of your PHP script
      String url = 'https://inconspicuous-pairs.000webhostapp.com/getBalance.php?accountnumber=$encAcc';

      // Send an HTTP GET request to the PHP script
      http.Response response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        // Parse the response body as a string
        String responseBody = response.body;

        // Assuming the response body is the balance value
        String balance = responseBody.trim();

        bal = balance;
      } else {
        // Error occurred while fetching the balance
        bal = 'Error';
      }
    }
  }
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

            /* leading: IconButton(
              icon: Icon(Icons.arrow_back_ios_new,color: Colors.white,),
              onPressed: ()=> Navigator.pop(context),

            ),*/
            backgroundColor:Color(0xff8d0000) ,
            centerTitle: true,
            title: Text ('My Profile'.tr),
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

                  Center(
                    child: Text('$name',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Color(0xff8d0000)),
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xff8d0000),
                    ),
                    child: Column(
                      children:<Widget> [

                        SizedBox(height: 10,),
                        Container(
                          child: Text('Account balance'.tr,textAlign: TextAlign.center,style:TextStyle(color: Colors.white,fontSize: 20)),
                        ),
                        SizedBox(height: 5,),
                        Divider(color: Colors.white,indent: 30,endIndent: 30,thickness: 1),
                        SizedBox(height: 5,),
                         Container(

                           child: Text('$money: $bal',textAlign: TextAlign.center,style:TextStyle(color: Colors.white60,fontSize: 20)),
                         ),



                        SizedBox(height: 10,),

                      ],
                    ),
                  ),

                  Column(children: [
                    TextButton(
                      child:Text(
                        'Show/hide'.tr,
                        style: TextStyle(
                            fontSize: 14, color: Colors.black),
                      ),
                      onPressed: () {
                        setState(() {
                          _isVisible = !_isVisible;
                        });

                      },
                    ),
                    Visibility(
                        visible: _isVisible,
                        child: Container(
                          width: 190,
                          child: TextField(
                            controller: pass,
                            obscureText: true,
                            decoration: InputDecoration(
                             /* border: OutlineInputBorder(borderRadius: BorderRadius.circular(7)),
                              enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),*/
                              border: InputBorder.none,
                              labelStyle: TextStyle(color: Colors.black,decoration: TextDecoration.none,),
                              hintText: 'Enter your pass'.tr,

                              suffixIcon: IconButton(
                                icon: Icon(Icons.send),
                                color: Color(0xff8d0000),
                                onPressed: () {

                                  //String text = pass.text;
                                  setState(() {
                                    show();
                                    if(pass.text==pass2)
                                    {
                                      pass.clear();
                                      _isVisible = !_isVisible;
                                    }
                                  });
                                  //
                                },
                              ),
                            ),
                          ) ,)

                    ),

                  ],),


                  SizedBox(height: 20),
                  Container(
                    child: Text('Personal'.tr,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(height: 10,),

                  Container(
                    child: FloatingActionButton.extended(onPressed: (){

                      Navigator.push(context, MaterialPageRoute(builder:
                          (context)=> personaldata(data: data, name: name, dob1: dob1, nationality: nationality, gender: gender, mart: mart, add: add, emailadd: emailadd, homenum: homenum, mobilenum: mobilenum, jobb: jobb, jobbadd: jobbadd, income: income, type: type, id: id, accountnum1: accountnum1, balance1: balance1, money: money, username: username, password: password)),
                      );


                    },
                        icon: Icon(Icons.account_circle_rounded,
                        color: Colors.black,size: 30,),
                        label: Text('Personal data'.tr,style: TextStyle(color: Colors.black,fontSize: 19),
                        ),backgroundColor: Colors.white,
                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),
                         side: BorderSide(style: BorderStyle.solid,width: 1.5,color: Colors.black) ),
                    ),
                  ),

                  SizedBox(height: 20),
                  Container(
                    child: Text('More'.tr,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(height: 10,),

                  Container(
                    child: FloatingActionButton.extended(onPressed: (){

                      Navigator.push(context, MaterialPageRoute(builder:
                          (context)=> securitytips()),
                      );


                    },
                      icon: Icon(Icons.security,
                        color: Colors.black,size: 30,),
                      label: Text('Security tips'.tr,style: TextStyle(color: Colors.black,fontSize: 19),
                      ),backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),
                          side: BorderSide(style: BorderStyle.solid,width: 1.5,color: Colors.black) ),
                    ),
                  ),
                  SizedBox(height: 20,),

                  Container(
                    child: FloatingActionButton.extended(onPressed: (){

                      showAlertDialog(context);

                    },
                      icon: Icon(Icons.question_mark,
                        color: Colors.black,size: 30,),
                      label: Text('FAQs retail'.tr,style: TextStyle(color: Colors.black,fontSize: 19),
                      ),backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),
                          side: BorderSide(style: BorderStyle.solid,width: 1.5,color: Colors.black) ),
                    ),
                  ),
                  SizedBox(height: 20,),

                  Container(
                    child: FloatingActionButton.extended(onPressed: (){

                      showAlertDialog2(context);


                    },
                      icon: Icon(Icons.call,
                        color: Colors.black,size: 30,),
                      label: Text('Contact us'.tr,style: TextStyle(color: Colors.black,fontSize: 19),
                      ),backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),
                          side: BorderSide(style: BorderStyle.solid,width: 1.5,color: Colors.black) ),
                    ),
                  ),
                  SizedBox(height: 20,),

                  Container(
                    child: FloatingActionButton.extended(onPressed: (){

                      Navigator.push(context, MaterialPageRoute(builder:
                          (context)=> f1()),
                      );


                    },
                      icon: Icon(Icons.assignment_return_outlined,
                        color: Colors.black,size: 30,),
                      label: Text('Sign out'.tr,style: TextStyle(color: Colors.black,fontSize: 19),
                      ),backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),
                          side: BorderSide(style: BorderStyle.solid,width: 1.5,color: Colors.black) ),
                    ),
                  ),

SizedBox(height: 10,),
                ],),),),






          bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(label: "Home".tr,icon: Icon(Icons.home),),
                BottomNavigationBarItem(label: "Currencies".tr, icon: Icon(Icons.currency_exchange),),
                BottomNavigationBarItem(label: "Payments".tr, icon: Icon(Icons.payment),),
                BottomNavigationBarItem(label: "Profile".tr, icon: Icon(Icons.account_circle_rounded),),

              ],


              currentIndex: _index,
              unselectedItemColor: Colors.black,
              selectedItemColor: Color(0xff8d0000),
              backgroundColor: Colors.white,

              onTap: (index) {



                setState(() {

                  _index = index;
                  if (_index == 0)  Navigator.push(context, MaterialPageRoute(builder:
                      (context)=> homePage(data: data, name: name, dob1: dob1, nationality: nationality, gender: gender, mart: mart, add: add, emailadd: emailadd, homenum: homenum, mobilenum: mobilenum, jobb: jobb, jobbadd: jobbadd, income: income, type: type, id: id, accountnum1: accountnum1, balance1: balance1, money: money, username: username, password: password,pass2: pass2)),
                  );
                  if (_index == 1)  Navigator.push(context, MaterialPageRoute(builder:
                      (context)=> currencies(data: data, name: name, dob1: dob1, nationality: nationality, gender: gender, mart: mart, add: add, emailadd: emailadd, homenum: homenum, mobilenum: mobilenum, jobb: jobb, jobbadd: jobbadd, income: income, type: type, id: id, accountnum1: accountnum1, balance1: balance1, money: money, username: username, password: password,pass2: pass2)),
                  );
                  if (_index == 2)    Navigator.push(context, MaterialPageRoute(builder:
                      (context)=> payments(data: data, name: name, dob1: dob1, nationality: nationality, gender: gender, mart: mart, add: add, emailadd: emailadd, homenum: homenum, mobilenum: mobilenum, jobb: jobb, jobbadd: jobbadd, income: income, type: type, id: id, accountnum1: accountnum1, balance1: balance1, money: money, username: username, password: password,pass2: pass2)),
                  );

                  if (_index == 3)  Navigator.push(context, MaterialPageRoute(builder:
                      (context)=> profile(data: data, name: name, dob1: dob1, nationality: nationality, gender: gender, mart: mart, add: add, emailadd: emailadd, homenum: homenum, mobilenum: mobilenum, jobb: jobb, jobbadd: jobbadd, income: income, type: type, id: id, accountnum1: accountnum1, balance1: balance1, money: money, username: username, password: password,pass2: pass2)),
                  );


                });

              }
          ),




        ));
  }
}
