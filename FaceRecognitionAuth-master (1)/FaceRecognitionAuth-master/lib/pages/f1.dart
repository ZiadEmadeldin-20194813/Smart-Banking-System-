import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../FacePages/home.dart';
import '../crypto/crypto.dart';
import '../pages/certificate.dart';
import '../pages/currencyConverter.dart';
import '../pages/loanamount.dart';
import '../pages/location.dart';
import '../pages/create.dart';
import '../pages/queuerequest.dart';
import '../pages/home.dart';
import 'package:get/get.dart';
import 'auth_type.dart';
import 'package:url_launcher/url_launcher.dart';
import '../pages/faqscode.dart';
import 'package:http/http.dart ' as http;
import 'package:fluttertoast/fluttertoast.dart';

import 'exchangerates.dart';
import 'loanrequest.dart';
import 'map.dart';
import 'message.dart';


void main() {


  runApp(const MaterialApp(

    debugShowCheckedModeBanner: false,
  ));

}
class f1 extends StatefulWidget {
  const f1({Key? key}) : super(key: key);
  static String username = "bebo";
  @override
  State<f1> createState() => _f1State();
}

class _f1State extends State<f1> {

  faqscode() {
    // TODO: implement faqscode
    throw UnimplementedError();
  }

  void showAlertDialog2(BuildContext context) {
    var alertDialog = AlertDialog(

      title: Text('Call us'.tr,),
      content: Text('(452)-869-8569', style: TextStyle(fontSize: 20),
          textAlign: TextAlign.center),
      actions: [
        ElevatedButton(onPressed: () async {
          final Uri url = Uri(
            scheme: 'tel'.tr,
            path: "452 869 8569",
          );
          if (await canLaunchUrl(url)) {
            await launchUrl(url);
          }
          else {
            print('cant launch this url'.tr);
          }
        },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Color(0xff8d0000)),),
            child: Text('Call'.tr)),

      ],
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        }
    );
  }



  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  void remove(){
    nameController='' as TextEditingController;
    passwordController='' as TextEditingController;

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



  Future getUserData() async{
   /* var url = Uri.parse(
        'https://inconspicuous-pairs.000webhostapp.com/getData.php');*/
    var response = await http.post(Uri.parse(
        'https://inconspicuous-pairs.000webhostapp.com/getData.php'),


        body: {
      "username": nameController.text,


    });


    // print(json.decode(response.body));
    var data1 = await json.decode(response.body);
    print(data1);
    getData(data1);

    data = data1;

    return data1;


    // return json.decode(response.body);
  }

  getData(var data)  {
    //hena zwdna
    final key = "2f7b4e8d71c4a00f2a3f4c175a8a4e6c";
    final aes = Aes(key);
    final decryptedacc = utf8.decode(aes.decrypt(base64Decode(data[0]["accountnumber"])));

    name = data[0]["name"];
    dob1 = data[0]["dob"];
    nationality = data[0]["nationality"];
    gender = data[0]["gender"];
    mart = data[0]["maritalstatus"];
    add = data[0]["address"];
    emailadd = data[0]["email"];
    homenum = data[0]["homenumber"];
    mobilenum = data[0]["mobilenumber"];
    jobb = data[0]["job"];
    jobbadd = data[0]["jobaddress"];
    income = data[0]["monthlyicome"];
    type = data[0]["accounttype"];
    id = data[0]["nationalid"];

//    accountnum1 = data[0]["accountnumber"];
    accountnum1 = utf8.decode(aes.decrypt(base64Decode(data[0]["accountnumber"])));

    balance1 = data[0]["balance"];
    money = data[0]["money"];
    username = data [0]["username"];
    password = data [0]["password"];
    pass2 = data [0]["pass2"];
  }


  Future Login() async {
    var url = Uri.parse(
        'https://inconspicuous-pairs.000webhostapp.com/LoginMobile.php');
    var response = await http.post(url, body: {
      "nameController": nameController.text,
      "passwordController": passwordController.text,

    });
    var data = json.decode(response.body);
    print(data.toString());

    if (data.toString() == "Success") {
      await getUserData();


/*
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => authtype(data: data, name: name, dob1: dob1, nationality: nationality, gender: gender, mart: mart, add: add, emailadd: emailadd, homenum: homenum, mobilenum: mobilenum, jobb: jobb, jobbadd: jobbadd, income: income, type: type, id: id, accountnum1: accountnum1, balance1: balance1, money: money, username: username, password: password,)));
    */
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => MyHomePage(data: data, name: name, dob1: dob1, nationality: nationality, gender: gender, mart: mart, add: add, emailadd: emailadd, homenum: homenum, mobilenum: mobilenum, jobb: jobb, jobbadd: jobbadd, income: income, type: type, id: id, accountnum1: accountnum1, balance1: balance1, money: money, username: username, password: password,pass2: pass2)
          ));


      Fluttertoast.showToast(
        msg: 'Login Successful'.tr,
        backgroundColor:Color(0xff1e2023),
        textColor: Colors.white,
        toastLength: Toast.LENGTH_SHORT,
      );
    } else if (nameController.text=='' && passwordController.text==''){
      Fluttertoast.showToast(
        msg: 'Please enter your name & password!'.tr,
        backgroundColor:Color(0xff1e2023),
        textColor: Colors.white,
        toastLength: Toast.LENGTH_SHORT,
      );
    }
    else {
      Fluttertoast.showToast(
        msg: 'You entered incorrect username or password, please try again!'.tr,
        backgroundColor:Color(0xff1e2023),
        textColor: Colors.white,
        toastLength: Toast.LENGTH_SHORT,
      );
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
    Size size = MediaQuery
        .of(context)
        .size;

    Color _getColor(bool isDarkMode) {
      return isDarkMode ? Colors.transparent : Colors.white;
    }


    return MaterialApp(
        theme: _isDarkMode ? ThemeData.dark() : ThemeData.light(),
        debugShowCheckedModeBanner: false,
        home: Scaffold(

         // backgroundColor: Color(0xff8d0000),

          appBar: AppBar (


            backgroundColor:Color(0xff8d0000) ,
            centerTitle: true,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/fnb1.png'),scale: 4
                  )
              ),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(25),
              ),
            ),

          ),



          body:
          Container(
            child: Container(

              decoration: BoxDecoration(
            //    color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),


              child: ListView(

                padding: EdgeInsets.only(left: 20, right: 20),
                children: <Widget>[
                  SizedBox(height: 50),

                  Row(

                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 15),

                        child: Text('Username'.tr, style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14)),

                      )

                    ],
                    mainAxisAlignment: MainAxisAlignment.start,
                  ),

                  Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color:  _getColor(_isDarkMode),

                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 6,
                          ),
                        ]),
                    child: TextField(
                      controller: nameController,
                      cursorColor: Colors.black,
                      onChanged: (value) {
                        setState(() {

                        });
                      },


                      decoration: InputDecoration(

                        border: InputBorder.none,
                        labelStyle: TextStyle(color: Colors.black,decoration: TextDecoration.none,),

                      ),



                    ),
                  ),

                  Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 15),

                        child: Text('Password'.tr, style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14)),

                      )

                    ],
                    mainAxisAlignment: MainAxisAlignment.start,
                  ),

                  Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color:  _getColor(_isDarkMode),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 6,
                          ),
                        ]),
                    child: TextField(
                      controller: passwordController,
                      obscureText: true,
                      cursorColor: Colors.black,
                      onChanged: (value) {
                        setState(() {

                        });
                      },


                      decoration: InputDecoration(

                        border: InputBorder.none,
                        labelStyle: TextStyle(color: Colors.black,
                          decoration: TextDecoration.none,),

                      ),
                    ),


                  ),


                  SizedBox(height: 60,),
                  Container(
                      margin: EdgeInsets.symmetric(vertical: 12),
                      width: size.width * 0.9,
                      child: ClipRRect(
                        child: SizedBox(height: 50, child: ElevatedButton(
                          // padding: EdgeInsets.symmetric(vertical: 18,horizontal: 38),
                          // color: Colors.deepOrange,
                          onPressed: () async {
                            Login();
                          },
                          child: Text(
                            'Login'.tr,
                            style:
                            TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  Color(0xff8d0000)),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    side: BorderSide(color: Color(0xff8d0000))
                                ),)
                          ),
                        )),
                      )),

                  SizedBox(height: 0,),
                  Container(
                      margin: EdgeInsets.symmetric(vertical: 12),
                      width: size.width * 0.9,
                      child: ClipRRect(
                        child: SizedBox(height: 50, child: ElevatedButton(
                          // padding: EdgeInsets.symmetric(vertical: 18,horizontal: 38),
                          // color: Colors.deepOrange,
                          onPressed: () async {

                            Navigator.push(context, MaterialPageRoute(builder:
                                (context) => create()),
                            );

                          },
                          child: Text(
                            'Register new user'.tr,
                            style:
                            TextStyle(color: Color(0xff8d0000), fontSize: 18),
                          ),
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  Colors.white),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    side: BorderSide(color: Colors.black)
                                ),)
                          ),
                        )),
                      )),

                  SizedBox(height: 40,),
                  Expanded(child:


                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[

                      Column(
                        children: <Widget>[
                          Container(

                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder:
                                    (context)=> SpeechToTextScreen(), ));
                              },

                              child: Icon(
                                  Icons.question_answer_outlined, color: Colors.black,
                                  size: 40),
                              style: ElevatedButton.styleFrom(
                                fixedSize: Size(60, 60),
                                shape: CircleBorder(
                                    side: BorderSide(
                                        style: BorderStyle.solid, width: 2)
                                ),

                                padding: EdgeInsets.only(left: 0),
                                primary: Colors.white,


                              ),
                            ),

                          ),

                          Container(
                            padding: EdgeInsets.only(top: 10),
                            child: Text('Intelligent\n   QA bot'.tr),
                          ),
                        ],
                      ),

                      Column(
                        children: <Widget>[
                          Container(

                            child: ElevatedButton(
                              onPressed: () async {
                                Navigator.push(
                                  context, MaterialPageRoute(builder:
                                    (context) => exchangerates()),
                                );
                              },

                              child: Icon(
                                  Icons.currency_exchange, color: Colors.black,
                                  size: 45),
                              style: ElevatedButton.styleFrom(
                                fixedSize: Size(60, 60),
                                shape: CircleBorder(
                                    side: BorderSide(
                                        style: BorderStyle.solid, width: 2)
                                ),

                                padding: EdgeInsets.only(left: 0),
                                primary: Colors.white,


                              ),
                            ),

                          ),

                          Container(
                            padding: EdgeInsets.only(top: 10),
                            child: Text('  Foreign\nExchange'.tr),
                          ),
                        ],
                      ),

                      Column(
                        children: <Widget>[
                          Container(

                            child: ElevatedButton(
                             /* onPressed: () async {
                                Navigator.push(
                                  context, MaterialPageRoute(builder:
                                    (context) => location()),
                                );
                              },*/
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder:
                                    (context)=> map(), ));
                              },

                              child: Icon(Icons.location_on_outlined,
                                  color: Colors.black, size: 45),
                              style: ElevatedButton.styleFrom(
                                fixedSize: Size(60, 60),
                                shape: CircleBorder(
                                    side: BorderSide(
                                        style: BorderStyle.solid, width: 2)
                                ),

                                padding: EdgeInsets.only(left: 0),
                                primary: Colors.white,


                              ),
                            ),

                          ),

                          Container(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(' ATM/Branch\n     Locator'.tr),
                          ),
                        ],
                      ),
                      Column(

                        children: <Widget>[
                          Container(

                            child: ElevatedButton(
                              onPressed: () {
                                showAlertDialog2(context);
                              },

                              child: Icon(
                                  Icons.call, color: Colors.black, size: 45),
                              style: ElevatedButton.styleFrom(
                                fixedSize: Size(60, 60),
                                shape: CircleBorder(
                                    side: BorderSide(
                                        style: BorderStyle.solid, width: 2)
                                ),

                                padding: EdgeInsets.only(left: 0),
                                primary: Colors.white,


                              ),
                            ),

                          ),

                          Container(
                            padding: EdgeInsets.only(top: 10),
                            child: Text('Contact\n     us'.tr),
                          ),
                        ],
                      ),
                    ],
                  ),

                  ),


                  SizedBox(height: 30,),
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[

                      TextButton(
                        child: const Text(
                          'English',
                          style: TextStyle(
                              fontSize: 17, color: Colors.black),
                        ),
                        onPressed: () {
                          Get.updateLocale(Locale('en','US'));
                        },
                      ),

                      Text('|'),

                      TextButton(
                        child: const Text(
                          'العربية',
                          style: TextStyle(
                              fontSize: 17, color: Colors.black),
                        ),
                        onPressed: () {
                          Get.updateLocale(Locale('ar','SU'));
                        },
                      )

                    ],
                  ),
                  Center(
                    child: Divider
                      (
                      thickness: 1.5,
                      height: 0,
                      color: Colors.black,
                      indent: 110,
                      endIndent: 110,
                    ),

                  ),
                  SizedBox(height: 5,),
                  Center(
                    child: Text('version 0.0.1',),
                  ),


                ],

              ),
            ),),

        ));
  }


}