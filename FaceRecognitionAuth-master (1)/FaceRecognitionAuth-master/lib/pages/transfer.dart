import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../crypto/crypto.dart';
import '../pages/payments.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart'as http;



class transfer extends StatefulWidget {
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


  transfer(
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
  State<transfer> createState() => _transferState(data: data, name: name, dob1: dob1, nationality: nationality, gender: gender, mart: mart, add: add, emailadd: emailadd, homenum: homenum, mobilenum: mobilenum, jobb: jobb, jobbadd: jobbadd, income: income, type: type, id: id, accountnum1: accountnum1, balance1: balance1, money: money, username: username, password: password, pass2:pass2);
}

class _transferState extends State<transfer> {
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

  _transferState(
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


  String bookdate = '';
  DateTime date1 = DateTime.now();
  Future<Null> selectinDate(BuildContext context) async {

    final DateTime? picked =await showDatePicker(
      context:context,
      initialDate: date1,
      firstDate: DateTime(1960),
      lastDate: DateTime(2040),);
    if(picked != null && picked != date1) {
      setState(() {

        date1 = picked;
        print(date1.toString());
      });
    }
  }


  TimeOfDay time1 = TimeOfDay.now();

  Future<Null> selectTime(BuildContext context) async {
    TimePickerEntryMode initialEntryMode = TimePickerEntryMode.dial;
    final TimeOfDay? tpicked = await showTimePicker(
      context: context,
      initialTime: time1,
      initialEntryMode: initialEntryMode,


    );
    setState(() {
      time1 = tpicked!;
      print(time1.toString());
    });

  }

  TextEditingController pass=new TextEditingController();
  TextEditingController acc2=new TextEditingController();
  TextEditingController amount=new TextEditingController();

  var s,r;
  var h,h2;

  Future SendData2(var date, var time) async {
    var url = Uri.parse(
        'https://inconspicuous-pairs.000webhostapp.com/transactions.php');

    final key = "2f7b4e8d71c4a00f2a3f4c175a8a4e6c";
    final aes = Aes(key);

    final encnum = base64Encode(aes.encrypt(Uint8List.fromList(utf8.encode(accountnum1))));
    final encTooo = base64Encode(aes.encrypt(Uint8List.fromList(utf8.encode(acc2.text))));
    final encType = base64Encode(aes.encrypt(Uint8List.fromList(utf8.encode('Bank transfer'))));
    final encAmount = base64Encode(aes.encrypt(Uint8List.fromList(utf8.encode(amount.text))));
    final encRbalance = base64Encode(aes.encrypt(Uint8List.fromList(utf8.encode(h.toString()))));
    final encDate = base64Encode(aes.encrypt(Uint8List.fromList(utf8.encode(date))));
    final encTime = base64Encode(aes.encrypt(Uint8List.fromList(utf8.encode(time))));

    final response = await http.post(url, body: {
      "accountnumber": encnum,
      "tooo": encTooo,
      "type": encType,
      "amount": encAmount,
      "rbalance": encRbalance,
      "date1": encDate,
      "time1": encTime,
    });
    try {
      var data = json.decode(response.body);
      print(data);
      if (data == "Error") {
      } else if (data == "Success") {
      } else {
        print("error");
      }
    } catch (e) {
      print(e);
    }
  }

  Future Updatedata(var accnum1, var c) async {
    var url =
    Uri.parse('https://inconspicuous-pairs.000webhostapp.com/Deposit.php');

    print(accnum1.toString());
    print(c.toString());

    final key = "2f7b4e8d71c4a00f2a3f4c175a8a4e6c";
    final aes = Aes(key);

    final encAcc =
    base64Encode(aes.encrypt(Uint8List.fromList(utf8.encode(accnum1))));


    final response = await http.post(url, body: {
      "accnum": encAcc,
      "balance": c.toString(),
    });
    try {
      var data = json.decode(response.body);
      print(data);
      if (data == "Error") {
        print("ahmed");
      } else if (data == "Success") {
        print("bebo");
      } else {
        print("error");
      }
    } catch (e) {
      print(e);
    }
  }

  var accountnum2;
  var balance2;

  var mob;

  Future getUserData(String accnum) async {
    var url = Uri.parse(
        'https://inconspicuous-pairs.000webhostapp.com/Searchdesktop.php');

    final key = "2f7b4e8d71c4a00f2a3f4c175a8a4e6c";
    final aes = Aes(key);
    final accnum2 =  base64Encode(aes.encrypt(Uint8List.fromList(utf8.encode(accnum))));



    var response = await http.post(url, body: {
      "accountnumber": accnum2,
    });


    // print(json.decode(response.body));
    var data1 = await json.decode(response.body);
    print(data1);
    data = data1;
    return data1;
    // return json.decode(response.body);

  }

  Future<void> getData(String accnum) async {

    final key = "2f7b4e8d71c4a00f2a3f4c175a8a4e6c";
    final aes = Aes(key);

    final decryptedaccnum =
    utf8.decode(aes.decrypt(base64Decode(data[0]["accountnumber"])));


    accountnum2 = decryptedaccnum;
    balance2 = data[0]["balance"];

    print("balance $balance2");

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
    var date="${date1.year} - ${date1.month} - ${date1.day}".toString();
    var time="${time1.hour} - ${time1.minute}".toString();
    print(date);
    print(time);

    Color _getColor(bool isDarkMode) {
      return isDarkMode ? Colors.transparent : Colors.white;
    }
    return MaterialApp(
        theme: _isDarkMode ? ThemeData.dark() : ThemeData.light(),
        debugShowCheckedModeBanner: false,
        home: Scaffold(

          backgroundColor: Color(0xff8d0000),

          appBar: AppBar (

            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios_new,color: Colors.white,),
              onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder:
                  (context)=> payments(data: data, name: name, dob1: dob1, nationality: nationality, gender: gender, mart: mart, add: add, emailadd: emailadd, homenum: homenum, mobilenum: mobilenum, jobb: jobb, jobbadd: jobbadd, income: income, type: type, id: id, accountnum1: accountnum1, balance1: h, money: money, username: username, password: password, pass2: pass2,)),
              ),

            ),
            backgroundColor:Color(0xff8d0000) ,
            centerTitle: true,
            title: Text ('Payments'.tr),

          ),

          body:
          Container(
            child: Container(

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: ListView(

                padding: EdgeInsets.only(left: 20,right: 20),
                children: <Widget>[


                  SizedBox(height: 40),

                  Center(
                    child: Text('Transfer money'.tr,
                      style: TextStyle(fontWeight:FontWeight.bold,fontSize: 17),
                    ),


                  ),

                  SizedBox(height: 40,),
                  Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 15),

                        child: Text('Enter the account number'.tr,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),

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
                      controller: acc2,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
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

                        child: Text('Enter the amount'.tr,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),

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
                      controller: amount,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
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

                  SizedBox(height: 20,),
                  Row(children: [
                    Container(
                      margin: EdgeInsets.only(left: 15),
                      child:Text('Enter your password (4-digits)'.tr,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),
                    ),
                  ],),
                  Container(
                    width: 310,
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
                      controller: pass,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
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

                  SizedBox(height:100,),
                  Container(
                      margin: EdgeInsets.symmetric(vertical: 12),
                      width: size.width * 0.9,
                      child: ClipRRect(
                        child: SizedBox(height: 50, child:  ElevatedButton(
                          // padding: EdgeInsets.symmetric(vertical: 18,horizontal: 38),
                          // color: Colors.deepOrange,


                          onPressed: () async {
                            setState(() {

                                if(acc2.text!=''&&amount.text!=''&&pass.text!='') {
                                  if (acc2.text.length == 16) {
                                    if (pass.text == pass2) {
                                      if (balance1.runtimeType == int) {
                                        if (balance1 >=
                                            int.parse(amount.text)) {
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              // return object of type Dialog
                                              return AlertDialog(
                                                //  title: new Text("Important!",textAlign: TextAlign.center,style: TextStyle(color: Color(0xff8d0000))),
                                                titlePadding: EdgeInsets.zero,
                                                title: Column(
                                                  crossAxisAlignment: CrossAxisAlignment
                                                      .center,
                                                  children: [
                                                    Container(
                                                      alignment: FractionalOffset
                                                          .topRight,
                                                      child: IconButton(
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        icon: const Icon(
                                                            Icons.clear),
                                                      ),
                                                    ),
                                                    const Text("Important!",
                                                        textAlign: TextAlign
                                                            .center,
                                                        style: TextStyle(
                                                            color: Color(
                                                                0xff8d0000))),
                                                  ],
                                                ),

                                                content: new Text(
                                                  "Are you sure you want to transfer to on your own responsibility?\n(Please tap to confirm)"
                                                      .tr,
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(fontSize: 15,
                                                      fontWeight: FontWeight
                                                          .bold),),
                                                actions: <Widget>[

                                                  new ElevatedButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                        primary: Color(
                                                            0xff8d0000)),
                                                    child: new Text("Yes".tr),
                                                    onPressed: () async {
                                                      if (balance1
                                                          .runtimeType == int) {
                                                        h = balance1 -
                                                            int.parse(
                                                                amount.text);

                                                        print("ziad $h");

                                                        await Updatedata(
                                                            accountnum1, h);
                                                        // accnum 2
                                                        await getUserData(acc2
                                                            .text);
                                                        await getData(acc2
                                                            .text);

                                                        h2 = int.parse(
                                                            balance2) +
                                                            int.parse(
                                                                amount.text);
                                                        print("bebo $h2");
                                                        await Updatedata(acc2
                                                            .text, h2);
                                                        await SendData2(date,
                                                            time);


                                                        Fluttertoast.showToast(
                                                          msg: 'Acceptable process!'
                                                              .tr,
                                                          backgroundColor: Color(
                                                              0xff1e2023),
                                                          textColor: Colors
                                                              .white,
                                                          toastLength: Toast
                                                              .LENGTH_SHORT,
                                                        );

                                                        amount.text = '';
                                                        acc2.text = '';
                                                        pass.text = '';
                                                        Navigator.of(context)
                                                            .pop();
                                                      }
                                                      else if (balance1
                                                          .runtimeType ==
                                                          String) {
                                                        h = int.parse(
                                                            balance1) -
                                                            int.parse(
                                                                amount.text);

                                                        print("ziad $h");

                                                        await Updatedata(
                                                            accountnum1, h);
                                                        // accnum 2
                                                        await getUserData(
                                                            acc2.text);
                                                        await getData(
                                                            acc2.text);

                                                        h2 = int.parse(
                                                            balance2) +
                                                            int.parse(
                                                                amount.text);
                                                        print("bebo $h2");
                                                        await Updatedata(
                                                            acc2.text, h2);
                                                        await SendData2(
                                                            date, time);


                                                        Fluttertoast.showToast(
                                                          msg: 'Acceptable process!'
                                                              .tr,
                                                          backgroundColor: Color(
                                                              0xff1e2023),
                                                          textColor: Colors
                                                              .white,
                                                          toastLength: Toast
                                                              .LENGTH_SHORT,
                                                        );

                                                        amount.text = '';
                                                        acc2.text = '';
                                                        pass.text = '';
                                                        Navigator.of(context)
                                                            .pop();
                                                      }
                                                    },
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        }
                                        else {
                                          Fluttertoast.showToast(
                                            msg: 'Not enough balance in your account!'
                                                .tr,
                                            backgroundColor: Color(0xff1e2023),
                                            textColor: Colors.white,
                                            toastLength: Toast.LENGTH_SHORT,
                                          );
                                        }
                                      }
                                      else if (balance1.runtimeType == String) {
                                        if (int.parse(balance1) >=
                                            int.parse(amount.text)) {
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              // return object of type Dialog
                                              return AlertDialog(
                                                //  title: new Text("Important!",textAlign: TextAlign.center,style: TextStyle(color: Color(0xff8d0000))),
                                                titlePadding: EdgeInsets.zero,
                                                title: Column(
                                                  crossAxisAlignment: CrossAxisAlignment
                                                      .center,
                                                  children: [
                                                    Container(
                                                      alignment: FractionalOffset
                                                          .topRight,
                                                      child: IconButton(
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        icon: const Icon(
                                                            Icons.clear),
                                                      ),
                                                    ),
                                                    const Text("Important!",
                                                        textAlign: TextAlign
                                                            .center,
                                                        style: TextStyle(
                                                            color: Color(
                                                                0xff8d0000))),
                                                  ],
                                                ),

                                                content: new Text(
                                                  "Are you sure you want to transfer to on your own responsibility?\n(Please tap to confirm)"
                                                      .tr,
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(fontSize: 15,
                                                      fontWeight: FontWeight
                                                          .bold),),
                                                actions: <Widget>[

                                                  new ElevatedButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                        primary: Color(
                                                            0xff8d0000)),
                                                    child: new Text("Yes".tr),
                                                    onPressed: () async {
                                                      if (balance1
                                                          .runtimeType == int) {
                                                        h = balance1 -
                                                            int.parse(
                                                                amount.text);

                                                        print("ziad $h");

                                                        await Updatedata(
                                                            accountnum1, h);
                                                        // accnum 2
                                                        await getUserData(
                                                            acc2.text);
                                                        await getData(
                                                            acc2.text);

                                                        h2 = balance2 +
                                                            int.parse(
                                                                amount.text);
                                                        print("bebo $h2");
                                                        await Updatedata(
                                                            acc2.text, h2);
                                                        await SendData2(
                                                            date, time);


                                                        Fluttertoast.showToast(
                                                          msg: 'Acceptable process!'
                                                              .tr,
                                                          backgroundColor: Color(
                                                              0xff1e2023),
                                                          textColor: Colors
                                                              .white,
                                                          toastLength: Toast
                                                              .LENGTH_SHORT,
                                                        );

                                                        amount.text = '';
                                                        acc2.text = '';
                                                        pass.text = '';
                                                        Navigator.of(context)
                                                            .pop();
                                                      }
                                                      else if (balance1
                                                          .runtimeType ==
                                                          String) {
                                                        h = int.parse(
                                                            balance1) -
                                                            int.parse(
                                                                amount.text);

                                                        print("ziad $h");

                                                        await Updatedata(
                                                            accountnum1, h);
                                                        // accnum 2
                                                        await getUserData(
                                                            acc2.text);
                                                        await getData(
                                                            acc2.text);

                                                        h2 = int.parse(
                                                            balance2) +
                                                            int.parse(
                                                                amount.text);
                                                        print("bebo $h2");
                                                        await Updatedata(
                                                            acc2.text, h2);
                                                        await SendData2(
                                                            date, time);


                                                        Fluttertoast.showToast(
                                                          msg: 'Acceptable process!'
                                                              .tr,
                                                          backgroundColor: Color(
                                                              0xff1e2023),
                                                          textColor: Colors
                                                              .white,
                                                          toastLength: Toast
                                                              .LENGTH_SHORT,
                                                        );

                                                        amount.text = '';
                                                        acc2.text = '';
                                                        pass.text = '';
                                                        Navigator.of(context)
                                                            .pop();
                                                      }
                                                    },
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        }
                                        else {
                                          Fluttertoast.showToast(
                                            msg: 'No enough balance in your account!'
                                                .tr,
                                            backgroundColor: Color(0xff1e2023),
                                            textColor: Colors.white,
                                            toastLength: Toast.LENGTH_SHORT,
                                          );
                                        }
                                      }
                                    }
                                    else {
                                      Fluttertoast.showToast(
                                        msg: 'Incorrect password'.tr,
                                        backgroundColor: Color(0xff1e2023),
                                        textColor: Colors.white,
                                        toastLength: Toast.LENGTH_SHORT,
                                      );
                                    }
                                  }
                                  else{
                                    Fluttertoast.showToast(
                                      msg: 'Invalid account number'.tr,
                                      backgroundColor:Color(0xff1e2023),
                                      textColor: Colors.white,
                                      toastLength: Toast.LENGTH_SHORT,
                                    );
                                  }
                                }
                                else{
                                  Fluttertoast.showToast(
                                    msg: 'Please fill-in the form!'.tr,
                                    backgroundColor:Color(0xff1e2023),
                                    textColor: Colors.white,
                                    toastLength: Toast.LENGTH_SHORT,
                                  );
                                }




                            });

                          },
                          child: Text(
                            'Transfer'.tr,
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