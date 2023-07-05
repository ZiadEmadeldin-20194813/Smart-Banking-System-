import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../crypto/crypto.dart';
import '../pages/payments.dart';
import '../pages/profile.dart';
import '../pages/receipt.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart'as http;




class telecom extends StatefulWidget {
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


  telecom(
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
  State<telecom> createState() => _telecomState(data: data, name: name, dob1: dob1, nationality: nationality, gender: gender, mart: mart, add: add, emailadd: emailadd, homenum: homenum, mobilenum: mobilenum, jobb: jobb, jobbadd: jobbadd, income: income, type: type, id: id, accountnum1: accountnum1, balance1: balance1, money: money, username: username, password: password, pass2: pass2);
}

class _telecomState extends State<telecom> {





  String dropdown = 'My Etisalat';
  var items = ['My Etisalat','My We','Vodafone cash'];

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


  _telecomState(
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

  TextEditingController number = new TextEditingController();
  TextEditingController amount = new TextEditingController();
  TextEditingController pass = new TextEditingController();

  var c;

  Future Updatedata() async {
    var url = Uri.parse(
        'https://inconspicuous-pairs.000webhostapp.com/Deposit.php');


    final key = "2f7b4e8d71c4a00f2a3f4c175a8a4e6c";
    final aes = Aes(key);
    final encryptAcc =  base64Encode(aes.encrypt(Uint8List.fromList(utf8.encode(accountnum1))));

    print(c.toString());
    final response = await http.post(url, body: {
      "accnum":encryptAcc,
      "balance": balance1.toString(),
    });
    try {
      var data = json.decode(response.body);
      print(data);
      if (data == "Error") {
        print("mansour");
      } else if (data == "Success") {
        print("bebo");
      }

      else {
        print("error".tr);
      }
    } catch (e) {
      print(e);
    }
  }

  Future SendData() async {

    var url = Uri.parse('https://inconspicuous-pairs.000webhostapp.com/telecom.php') ;

    final key = "2f7b4e8d71c4a00f2a3f4c175a8a4e6c";
    final aes = Aes(key);

    final encTooo = base64Encode(aes.encrypt(Uint8List.fromList(utf8.encode(dropdown))));
    final encNumber = base64Encode(aes.encrypt(Uint8List.fromList(utf8.encode(number.text))));
    final encAmount = base64Encode(aes.encrypt(Uint8List.fromList(utf8.encode(amount.text))));

    final response = await http.post(url, body:{


      "type":encTooo,
      "number":encNumber,
      "amount":encAmount,
      "accountnumber":accountnum1,

    });
    try {
      var data = json.decode(response.body);
      print(data);
      if (data == "Error") {
      }
      else if (data == "Success") {
        setState(() {

          Fluttertoast.showToast(
            msg: 'Acceptable process!'.tr,
            backgroundColor:Color(0xff1e2023),
            textColor: Colors.white,
            toastLength: Toast.LENGTH_SHORT,
          );

          number.text='';
          amount.text='';


        });
      }
      else {
        print("error".tr);
      }
    }
    catch (e) {
      print(e);
    }
  }
  Future SendData2(var date,var time) async {

    var url = Uri.parse('https://inconspicuous-pairs.000webhostapp.com/transactions.php') ;

    final key = "2f7b4e8d71c4a00f2a3f4c175a8a4e6c";
    final aes = Aes(key);

    final encAccountnum1 = base64Encode(aes.encrypt(Uint8List.fromList(utf8.encode(accountnum1))));
    final encTooo = base64Encode(aes.encrypt(Uint8List.fromList(utf8.encode(number.text))));
    final encType = base64Encode(aes.encrypt(Uint8List.fromList(utf8.encode(dropdown))));
    final encAmount = base64Encode(aes.encrypt(Uint8List.fromList(utf8.encode(amount.text))));
    final encRbalance = base64Encode(aes.encrypt(Uint8List.fromList(utf8.encode(balance1.toString()))));
    final encDate = base64Encode(aes.encrypt(Uint8List.fromList(utf8.encode(date))));
    final encTime = base64Encode(aes.encrypt(Uint8List.fromList(utf8.encode(time))));

    final response = await http.post(url, body:{

      "accountnumber":encAccountnum1,
      "tooo":encTooo,
      "type":encType,
      "amount":encAmount,
      "rbalance": encRbalance,
      "date1":encDate,
      "time1":encTime,

    });
    try {
      var data = json.decode(response.body);
      print(data);
      if (data == "Error") {
      }
      else if (data == "Success") {
          await Updatedata();
          await SendData();



      }
      else {
        print("error".tr);
      }
    }
    catch (e) {
      print(e);
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

    var date="${date1.year} - ${date1.month} - ${date1.day}".toString();
    var time="${time1.hour} - ${time1.minute}".toString();
    print(date);
    print(time);
    print("ziaaaaad ${balance1.runtimeType}");

    Color _getColor(bool isDarkMode) {
      return isDarkMode ? Colors.transparent : Colors.white;
    }

    return

      MaterialApp(
          theme: _isDarkMode ? ThemeData.dark() : ThemeData.light(),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar (
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios_new,color: Colors.white,),
              onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder:
                            (context)=> payments(data: data, name: name, dob1: dob1, nationality: nationality, gender: gender, mart: mart, add: add, emailadd: emailadd, homenum: homenum, mobilenum: mobilenum, jobb: jobb, jobbadd: jobbadd, income: income, type: type, id: id, accountnum1: accountnum1, balance1: balance1, money: money, username: username, password: password, pass2:pass2)),
                        ),

            ),

            backgroundColor:Color(0xff8d0000) ,
            centerTitle: true,
            title: Text ('Payments'.tr),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(25),
              ),
            ),

          ),

          body:

          ListView(

            padding: EdgeInsets.only(left: 0,right: 0),
            children: <Widget>[

              Column(
                children: <Widget>[
                  SizedBox(height: 40),
                  Center(child: Text('Telecom'.tr,style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),)),
                  SizedBox(height: 40),
                  Row(

                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:<Widget> [
                      Container(
                        padding: EdgeInsets.only(left: 50),
                        child: Text('Telecom type'.tr,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                      ),

                      Container(
                        padding: EdgeInsets.only(right: 30),
                        child: DropdownButton(
                          value: dropdown,
                          borderRadius: BorderRadius.circular(15),
                          icon: const Icon(Icons.arrow_drop_down_sharp),
                          items: items.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          onChanged: (String? newvalue){
                            setState(() {
                              dropdown = newvalue!;
                            });
                          },

                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 15,),
                  Divider
                    (
                    thickness: 1,
                    height: 0,
                    color: Colors.black,
                    indent: 20,
                    endIndent:20,
                  ),
                  SizedBox(height: 15,),
Row(children: [
  Container(
    padding: EdgeInsets.only(left: 50),
    child: Text('Mobile number (To)'.tr,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
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
                      controller: number,
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
                  SizedBox(height: 15,),
                  Divider
                    (
                    thickness: 1,
                    height: 0,
                    color: Colors.black,
                    indent: 20,
                    endIndent:20,
                  ),
                  SizedBox(height: 15,),
                  Row(children: [
                    Container(
                      padding: EdgeInsets.only(left: 50),
                      child: Text('Amount'.tr,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
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
                  SizedBox(height: 15,),
                  Divider
                    (
                    thickness: 1,
                    height: 0,
                    color: Colors.black,
                    indent: 20,
                    endIndent:20,
                  ),
                  SizedBox(height: 15,),
                  Row(children: [
                    Container(
                      padding: EdgeInsets.only(left: 50),
                      child: Text('Enter your password (4 digits)'.tr,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
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



                  SizedBox(height: 150),
                  Container(
                      margin: EdgeInsets.symmetric(vertical: 12),
                      width: size.width * 0.9,
                      child: ClipRRect(
                        child: SizedBox(height: 50, child:  ElevatedButton(
                          // padding: EdgeInsets.symmetric(vertical: 18,horizontal: 38),
                          // color: Colors.deepOrange,
                          onPressed: () async {
                              setState(() {
                                if(number.text!=''&&amount.text!=''&&pass.text!='')
                                {
                                  if(pass.text==pass2) {
                                   if(balance1.runtimeType==int) {
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
                                               "Are you sure you want to transfer on your own responsibility?"
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
                                                 onPressed: () {
                                                   balance1 = balance1 -
                                                       int.parse(amount.text);
                                                   // balance1 = c;
                                                   print(
                                                       'new balance is $balance1');

                                                   Updatedata();
                                                   SendData();
                                                   SendData2(date, time);

                                                   Fluttertoast.showToast(
                                                     msg: 'Acceptable process!'
                                                         .tr,
                                                     backgroundColor: Color(
                                                         0xff1e2023),
                                                     textColor: Colors.white,
                                                     toastLength: Toast
                                                         .LENGTH_SHORT,
                                                   );

                                                   amount.text = '';
                                                   number.text = '';
                                                   pass.text = '';
                                                   Navigator.of(context).pop();
                                                 },
                                               ),
                                             ],
                                           );
                                         },
                                       );
                                     }
                                     else {
                                       Fluttertoast.showToast(
                                         msg: 'Not enough balance in your account!'.tr,
                                         backgroundColor: Color(0xff1e2023),
                                         textColor: Colors.white,
                                         toastLength: Toast.LENGTH_SHORT,
                                       );
                                     }
                                   }
                                else if(balance1.runtimeType==String){
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
                                               "Are you sure you want to transfer on your own responsibility?"
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
                                                 onPressed: () {
                                                   if(balance1.runtimeType==int)
                                                     {
                                                       balance1 = balance1 -
                                                           int.parse(amount.text);
                                                       // balance1 = c;
                                                       print(
                                                           'new balance is $balance1');

                                                       Updatedata();
                                                       SendData();
                                                       SendData2(date, time);

                                                       Fluttertoast.showToast(
                                                         msg: 'Acceptable process!'
                                                             .tr,
                                                         backgroundColor: Color(
                                                             0xff1e2023),
                                                         textColor: Colors.white,
                                                         toastLength: Toast
                                                             .LENGTH_SHORT,
                                                       );

                                                       amount.text = '';
                                                       number.text = '';
                                                       pass.text = '';
                                                       Navigator.of(context).pop();
                                                     }
                                                   else if(balance1.runtimeType==String)
                                                     {
                                                       balance1 = int.parse(balance1) -
                                                           int.parse(amount.text);
                                                       // balance1 = c;
                                                       print(
                                                           'new balance is $balance1');

                                                       Updatedata();
                                                       SendData();
                                                       SendData2(date, time);

                                                       Fluttertoast.showToast(
                                                         msg: 'Acceptable process!'
                                                             .tr,
                                                         backgroundColor: Color(
                                                             0xff1e2023),
                                                         textColor: Colors.white,
                                                         toastLength: Toast
                                                             .LENGTH_SHORT,
                                                       );

                                                       amount.text = '';
                                                       number.text = '';
                                                       pass.text = '';
                                                       Navigator.of(context).pop();

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
                                         msg: 'Not enough balance in your account!'.tr,
                                         backgroundColor: Color(0xff1e2023),
                                         textColor: Colors.white,
                                         toastLength: Toast.LENGTH_SHORT,
                                       );
                                     }
                                   }

                                  }
                                  else
                                    {
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

            ],),









        ));
  }

}
