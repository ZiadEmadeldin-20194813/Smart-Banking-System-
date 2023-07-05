import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart'as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../crypto/crypto.dart';

class changepass extends StatefulWidget {

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


  changepass(
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
  State<changepass> createState() => _changepassState(data: data, name: name, dob1: dob1, nationality: nationality, gender: gender, mart: mart, add: add, emailadd: emailadd, homenum: homenum, mobilenum: mobilenum, jobb: jobb, jobbadd: jobbadd, income: income, type: type, id: id, accountnum1: accountnum1, balance1: balance1, money: money, username: username, password: password);
}

class _changepassState extends State<changepass> {

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


  _changepassState(
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
        required this.password,
      });

  TextEditingController current1 = new TextEditingController();
  TextEditingController new1 = new TextEditingController();
  TextEditingController confirm = new TextEditingController();
  
  Future SendData() async {
    var url = Uri.parse('https://inconspicuous-pairs.000webhostapp.com/changepass.php') ;

    final key = "2f7b4e8d71c4a00f2a3f4c175a8a4e6c";
    final aes = Aes(key);
    final encAcc = base64Encode(aes.encrypt(Uint8List.fromList(utf8.encode(accountnum1))));


    final response = await http.post(url, body:{

      "accountnumber": encAcc,
      "password":new1.text,

    });
    try {
      var data = json.decode(response.body);
      print(data);
      if (data == "Error") {
      }
      else if (data == "Success") {
        setState(() {

          current1.text='';
          new1.text='';
          confirm.text='';


        });
      }
      if (data == "Already Exists") {


      }
      else {
        print("error".tr);
      }
    }
    catch (e) {
      print(e);
    }
  }

  bool ver =false;

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
    print('myyy pass $password');
    Color _getColor(bool isDarkMode) {
      return isDarkMode ? Colors.transparent : Colors.white;
    }
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
            title: Text ('Change password'.tr),
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

                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: ListView(

                padding: EdgeInsets.only(left: 20,right: 20),
                children: <Widget>[


                  SizedBox(height: 40,),
                  Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 15),

                        child: Text('Current password'.tr,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14)),

                      )

                    ],
                    mainAxisAlignment: MainAxisAlignment.start,
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: _getColor(_isDarkMode),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 6,
                          ),
                        ]),
                    child: TextField(
                      controller: current1,
                     // obscureText: true,
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
                  SizedBox(height:5,),
                  Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 15),

                        child: Text('New password'.tr,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14)),

                      )

                    ],
                    mainAxisAlignment: MainAxisAlignment.start,
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: _getColor(_isDarkMode),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 6,
                          ),
                        ]),
                    child: TextField(
                      controller: new1,
                      obscureText: true,
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

                  Container(
                    padding: EdgeInsets.only(left: 15,right: 15),
                    child:FlutterPwValidator(
                      controller: new1,
                      minLength: 8,
                      failureColor:  Color(0xff8d0000),
                      uppercaseCharCount: 1,
                      numericCharCount: 1,
                      specialCharCount: 1,
                      width: 280,
                      height: 80,
                      defaultColor:  Color(0xff8d0000),
                      successColor: Colors.green,
                      onSuccess: (){
                        ver=true;
                      },
                      onFail: (){
                        ver=false;
                      },

                    ),
                  ),

                  SizedBox(height:20,),
                  Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 15),

                        child: Text('Confirm password'.tr,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14)),

                      )

                    ],
                    mainAxisAlignment: MainAxisAlignment.start,
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: _getColor(_isDarkMode),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 6,
                          ),
                        ]),
                    child: TextField(
                      controller: confirm,
                      obscureText: true,
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



                  SizedBox(height:200,),
                  Container(
                      margin: EdgeInsets.symmetric(vertical: 12),
                      width: size.width * 0.9,
                      child: ClipRRect(
                        child: SizedBox(height: 50, child:  ElevatedButton(
                          // padding: EdgeInsets.symmetric(vertical: 18,horizontal: 38),
                          // color: Colors.deepOrange,
                          onPressed: () async {

                            if(current1.text==password && new1.text==confirm.text && new1.text!='' &&confirm.text!='' &&ver==true)
                            {
                              SendData();
                              Fluttertoast.showToast(
                                msg: 'Password changed successfully'.tr,
                                backgroundColor:Color(0xff1e2023),
                                textColor: Colors.white,
                                toastLength: Toast.LENGTH_SHORT,
                              );
                            }
                            else if(current1.text=='' || new1.text=='' || confirm.text=='')
                            {
                              Fluttertoast.showToast(
                                msg: 'Please fill in the form!'.tr,
                                backgroundColor:Color(0xff1e2023),
                                textColor: Colors.white,
                                toastLength: Toast.LENGTH_SHORT,
                              );
                            }
                            else if(current1.text!=password){
                              Fluttertoast.showToast(
                                msg: 'The old password is not correct'.tr,
                                backgroundColor:Color(0xff1e2023),
                                textColor: Colors.white,
                                toastLength: Toast.LENGTH_SHORT,
                              );
                            }
                            else
                              {
                                Fluttertoast.showToast(
                                  msg: 'Please check that you entered data correctly!'.tr,
                                  backgroundColor:Color(0xff1e2023),
                                  textColor: Colors.white,
                                  toastLength: Toast.LENGTH_SHORT,
                                );
                              }

                          },
                          child: Text(
                            'Save changes'.tr,
                            style:
                            TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Color(0xff8d0000)),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius:BorderRadius.circular(25),
                                    side: BorderSide(color: Color(0xff8d0000))
                                ),)
                          ),
                        )),
                      )),




                ],

              ),
            ),),

        ));
  }
}