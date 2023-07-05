import 'dart:typed_data';

import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../crypto/crypto.dart';
import '../pages/certificate.dart';
import '../pages/depcalculator.dart';
import '../pages/loaninst.dart';
import '../pages/loanrequest.dart';
import '../pages/mycertificates.dart';
import '../pages/payments.dart';
import '../pages/currencies.dart';
import '../pages/profile.dart';
import '../pages/telecom.dart';
import '../view/newsroom.dart';
import '../pages/location.dart';
import '../pages/queuerequest.dart';
import '../pages/settings.dart';
import '../pages/loanamount.dart';
import '../pages/notification.dart';
import 'package:get/get.dart';
import 'package:badges/badges.dart' as badges;
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'feedback.dart';
import 'map.dart';
import 'message.dart';



class homePage extends StatefulWidget {


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


  homePage(
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
        required this.password, required this.pass2,});

  @override
  State<homePage> createState() => _homePageState(data: data, name: name, dob1: dob1, nationality: nationality, gender: gender, mart: mart, add: add, emailadd: emailadd, homenum: homenum, mobilenum: mobilenum, jobb: jobb, jobbadd: jobbadd, income: income, type: type, id: id, accountnum1: accountnum1, balance1: balance1, money: money, username: username, password: password, pass2:pass2);

}

class _homePageState extends State<homePage> {

  var _index = 0;


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


  _homePageState(
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


  var acc='****************';
  var bal='****';

  void show() async {
    if (pass.text != pass2) {
      acc='****************';
      bal='****';
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
        acc=accountnum1;
      } else {
        // Error occurred while fetching the balance
        bal = 'Error';
      }
    }
  }



  int _notificationCount = 0;

  void _updateNotificationCount(int count) {
    setState(() {
      _notificationCount = count;
    });
  }





  Future<List<dynamic>> fetchTransactions(accountnum1) async {
    final key = "2f7b4e8d71c4a00f2a3f4c175a8a4e6c";
    final aes = Aes(key);
    final encacc = base64Encode(aes.encrypt(Uint8List.fromList(utf8.encode(accountnum1))));
    final response = await http.get(Uri.parse('https://inconspicuous-pairs.000webhostapp.com/getCardData.php?accountnumber=$encacc'));

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON.
      return jsonDecode(response.body);
    } else {
      // If the server returns an error response, throw an exception.
      throw Exception('Failed to load transactions');
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
  print("zoz ${balance1}");
    return MaterialApp(


      theme: _isDarkMode ? ThemeData.dark() : ThemeData.light(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff8d0000),
          centerTitle: true,
          title: Text ('FNB'),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(25),
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.question_answer_outlined),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder:
                    (context)=> SpeechToTextScreen(), ));
              },
            ),
            IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder:
                (context)=> notification(data: data, name: name, dob1: dob1, nationality: nationality, gender: gender, mart: mart, add: add, emailadd: emailadd, homenum: homenum, mobilenum: mobilenum, jobb: jobb, jobbadd: jobbadd, income: income, type: type, id: id, accountnum1: accountnum1, balance1: balance1, money: money, username: username, password: password)),
                );

              },
            ),
          ],
        ) ,

        drawer: Drawer(

          width: 235,
          backgroundColor: Color(0xff8d0000),
          child: ListView(
            children:<Widget> [

              DrawerHeader(

                child:
                    Container(

                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('images/fnb2.png'),


                          )
                      ),
                    )
                 ),

              ListTile(

                onTap: () {

                  Navigator.push(context, MaterialPageRoute(builder:
                      (context)=> queue(data: data, name: name, dob1: dob1, nationality: nationality, gender: gender, mart: mart, add: add, emailadd: emailadd, homenum: homenum, mobilenum: mobilenum, jobb: jobb, jobbadd: jobbadd, income: income, type: type, id: id, accountnum1: accountnum1, balance1: balance1, money: money, username: username, password: password)),
                  );

                },

                title: Text("Queuing request".tr, style: TextStyle(color: Colors.white,fontSize: 20),),
                trailing: Icon(Icons.arrow_forward_ios,color: Colors.white),
              ),
              Divider
                (
                thickness: 1.5,
                height: 0,
                color: Colors.white30,
                indent: 15,
                endIndent:15,
              ),
              ListTile(

                onTap: () {

                  Navigator.push(context, MaterialPageRoute(builder:
                      (context)=> payments(data: data, name: name, dob1: dob1, nationality: nationality, gender: gender, mart: mart, add: add, emailadd: emailadd, homenum: homenum, mobilenum: mobilenum, jobb: jobb, jobbadd: jobbadd, income: income, type: type, id: id, accountnum1: accountnum1, balance1: balance1, money: money, username: username, password: password,pass2: pass2)),
                  );
                },

                title: Text("Payments".tr, style: TextStyle(color: Colors.white,fontSize: 20),),
                trailing: Icon(Icons.arrow_forward_ios,color: Colors.white),
              ),
              Divider
                (
                thickness: 1.5,
                height: 0,
                color: Colors.white30,
                indent: 15,
                endIndent:15,
              ),
              ListTile(

                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder:
                      (context)=> depcalculator()),
                  );

                },

                title: Text("Deposit calculator".tr, style: TextStyle(color: Colors.white,fontSize: 20),),
                trailing: Icon(Icons.arrow_forward_ios,color: Colors.white),
              ),

              Divider
                (
                thickness: 1.5,
                height: 0,
                color: Colors.white30,
                indent: 15,
                endIndent:15,
              ),
              ListTile(

                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder:
                      (context)=> newsroom(data: data, name: name, dob1: dob1, nationality: nationality, gender: gender, mart: mart, add: add, emailadd: emailadd, homenum: homenum, mobilenum: mobilenum, jobb: jobb, jobbadd: jobbadd, income: income, type: type, id: id, accountnum1: accountnum1, balance1: balance1, money: money, username: username, password: password, pass2: pass2)),
                  );

                },

                title: Text("Newsroom".tr, style: TextStyle(color: Colors.white,fontSize: 20),),
                trailing: Icon(Icons.arrow_forward_ios,color: Colors.white),
              ),
              Divider
                (
                thickness: 1.5,
                height: 0,
                color: Colors.white30,
                indent: 15,
                endIndent:15,
              ),
              ListTile(

                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder:
                      (context)=> map(), ));

                },

                title: Text("Locations".tr, style: TextStyle(color: Colors.white,fontSize: 20),),
                trailing: Icon(Icons.arrow_forward_ios,color: Colors.white),
              ),
              Divider
                (
                thickness: 1.5,
                height: 0,
                color: Colors.white30,
                indent: 15,
                endIndent:15,
              ),
              ListTile(

                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder:
                      (context)=> feedback(data: data, name: name, dob1: dob1, nationality: nationality, gender: gender, mart: mart, add: add, emailadd: emailadd, homenum: homenum, mobilenum: mobilenum, jobb: jobb, jobbadd: jobbadd, income: income, type: type, id: id, accountnum1: accountnum1, balance1: balance1, money: money, username: username, password: password)),
                  );

                },

                title: Text("Feedback".tr, style: TextStyle(color: Colors.white,fontSize: 20),),
                trailing: Icon(Icons.arrow_forward_ios,color: Colors.white),
              ),
              Divider
                (
                thickness: 1.5,
                height: 0,
                color: Colors.white30,
                indent: 15,
                endIndent:15,
              ),
              ListTile(

                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder:
                      (context)=> settings(data: data, name: name, dob1: dob1, nationality: nationality, gender: gender, mart: mart, add: add, emailadd: emailadd, homenum: homenum, mobilenum: mobilenum, jobb: jobb, jobbadd: jobbadd, income: income, type: type, id: id, accountnum1: accountnum1, balance1: balance1, money: money, username: username, password: password)),
                  );

                },

                title: Text("Settings".tr, style: TextStyle(color: Colors.white,fontSize: 20),),
                trailing: Icon(Icons.arrow_forward_ios,color: Colors.white),
              ),
              Divider
                (
                thickness: 1.5,
                height: 0,
                color: Colors.white30,
                indent: 15,
                endIndent:15,
              ),

            ],

          ),
        ),



        body:

    DefaultTabController(
    length: 4,
    child: Column(
    children: <Widget> [

    TabBar(

    padding: EdgeInsets.fromLTRB(4, 10, 4, 0),
    unselectedLabelColor: Color(0xff8d0000),
    indicator: BoxDecoration(border: Border(top: BorderSide(width: 1.0, color: Color(0xff8d0000),),)),
    labelColor: Color(0xff8d0000),
    labelPadding: EdgeInsets.only(right: 10,left: 10),





    tabs: [
    Tab(text: "Accounts".tr,),
    Tab(text: "Cards".tr,),
    Tab(text: "Loans".tr,),
      Tab(text: "Certificates".tr,),
    ],
    ),

    Expanded(
    child: TabBarView(
    children: [

          Column(
            
          children:<Widget> [
            SizedBox(height: 20,),
            Container(
              width: 350,
              height: 110,
              decoration: BoxDecoration(

                border: Border.all(width: 1, color: Colors.black26),
                borderRadius: BorderRadius.circular(10),
               // color: Colors.white,
              ),
              child: Row(
                children:<Widget> [

                  ClipRRect(
                    borderRadius:BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(10)),
                    child: Image(image: AssetImage('images/fnb3.png'),),
                  ),

                  Column(
                  children:<Widget> [
                    SizedBox(height: 10,),
                    Container(
                      padding: EdgeInsets.only(left: 50),
                      child: Text('$type Account',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),),


                    Container(
                      padding: EdgeInsets.only(left: 50),
                      child: Text('$acc',style: TextStyle(fontSize: 17,)),
                    ),

                    Divider(
                      height:5,
                      thickness: 5,
                      endIndent: 0,
                      indent: 0,
                      color: Colors.black,
                    ),

                    SizedBox(height: 30,),
                    Container(
                      padding: EdgeInsets.only(right: 80),
                      child: Text('$bal $money',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),),


                  ],
                  ),

                ],
              ),
            ),
            TextButton(
              child: Text(
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
          child:TextField(
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


          ],
          ),

      ListView(
        children: [

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                SizedBox(height:  MediaQuery.of(context).size.height - 200, //450
                  child:
                  FutureBuilder<List<dynamic>>(
                    future: fetchTransactions(accountnum1),


                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                      List<dynamic>? data = snapshot.data;
                      if (data != null && data.isNotEmpty) {
                        return ListView.builder(

                          itemCount: data.length,
                          itemBuilder: (context, index)
                          {
                          dynamic card = snapshot.data?[index];
                            if(card['cardtype']=='Credit')
                              {
                                return Column(children: [
                                  SizedBox(height: 10,),
                                  Row(children:<Widget> [
                                    Container(
                                      padding: EdgeInsets.only(left: 25),
                                      child: Text('My card'.tr,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                                    )
                                  ],),

                                  SizedBox(height: 20,),
                                  Container(
                                  height: 180,
                                  width: 310,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(15)),
                                    gradient: LinearGradient(
                                      begin:Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        Color(0xff000417),
                                        Color(0xff1e2023),
                                      ],
                                    ),
                                  ),
                                  child:
                                  Column(children: [
                                    SizedBox(height: 10,),
                                    Row(children:<Widget> [
                                      SizedBox(width: 40),
                                      Container(child: Text('${snapshot.data?[index]['cardtype']}',style:TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.white),)),
                                      SizedBox(width: 130),
                                      Container(
                                        child:Image(image: AssetImage('images/fnb1.png'),height: 55,width: 75),
                                      ),
                                    ],
                                    ),
                                    Row(children:<Widget> [
                                      Container(
                                        margin: EdgeInsets.only(left: 40),
                                        child:Image(image: AssetImage('images/chip.png'),),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 15),
                                        child:Text('****  *****  *****  ****',style: TextStyle(fontSize: 19,color: Colors.white)),
                                      ),
                                    ],
                                    ),
                                    Row(children:<Widget> [
                                      Container(
                                        margin: EdgeInsets.only(left: 214),
                                        child:Text('EXP ${snapshot.data?[index]['edate']}',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white)),
                                      ),
                                    ],
                                    ),
                                    SizedBox(height: 15,),
                                    Row(children:<Widget> [
                                      Container(
                                        margin: EdgeInsets.only(left: 20),
                                        child:Text('${snapshot.data?[index]['customername']}',style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold,color: Colors.white)),
                                      ),
                                    ],
                                    ),
                                    SizedBox(height: 8,),
                                  ]),
                                ),
                                  SizedBox(height: 20,),
                                  Row(children:<Widget> [
                                    Container(
                                      padding: EdgeInsets.only(left: 25),
                                      child: Text('Cards offers'.tr,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                                    )
                                  ],),
                                  SizedBox(height: 20,),


                                  Container(
                                    height: 180,
                                    width: 310,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(15)),
                                      gradient: LinearGradient(
                                        begin:Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: [
                                          Color(0xff282828),
                                          Color(0xff868686),
                                        ],
                                      ),
                                    ),
                                    child:
                                    Column(children: [
                                      SizedBox(height: 10,),
                                      Row(children:<Widget> [
                                        SizedBox(width: 40),
                                        Container(child: Text('Debit',style:TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.white),)),
                                        SizedBox(width: 130),
                                        Container(
                                          child:Image(image: AssetImage('images/fnb1.png'),height: 55,width: 75),
                                        ),
                                      ],
                                      ),
                                      Row(children:<Widget> [
                                        Container(
                                          margin: EdgeInsets.only(left: 40),
                                          child:Image(image: AssetImage('images/chip.png'),),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(left: 15),
                                          child:Text('****  *****  *****  ****',style: TextStyle(fontSize: 19,color: Colors.white)),
                                        ),
                                      ],
                                      ),
                                      Row(children:<Widget> [
                                        Container(
                                          margin: EdgeInsets.only(left: 214),
                                          child:Text('EXP ../..',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white)),
                                        ),
                                      ],
                                      ),
                                      SizedBox(height: 15,),
                                      Row(children:<Widget> [
                                        Container(
                                          margin: EdgeInsets.only(left: 20),
                                          child:Text('NAME',style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold,color: Colors.white)),
                                        ),
                                      ],
                                      ),
                                      SizedBox(height: 8,),
                                    ]),
                                  ),
                                  SizedBox(height: 15,),
                                  Row(
                                    children: [
                                      Container(
                                        padding:EdgeInsets.only(left: 20) ,
                                        child:Text('Maximum Credit Limit : 250,000 EGP'.tr,style: TextStyle(fontSize: 15)) ,),
                                    ],
                                  ),
                                  SizedBox(height: 10,),
                                  Row(
                                    children: [
                                      Container(
                                        padding:EdgeInsets.only(left: 20) ,
                                        child:Text('Grace period : up to 59 days for purchase'.tr,style: TextStyle(fontSize: 15)) ,),
                                    ],
                                  ),
                                  SizedBox(height: 15,),
                                  Divider(
                                    indent: 20,
                                    endIndent: 20,
                                    thickness: 4,
                                  ),
                                  SizedBox(height: 15,),
                                  Container(
                                    height: 180,
                                    width: 310,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(15)),
                                      gradient: LinearGradient(
                                        begin:Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: [
                                          Color(0xffb49800),
                                          Color(0xffffcd00),
                                        ],
                                      ),
                                    ),
                                    child:
                                    Column(children: [
                                      SizedBox(height: 10,),
                                      Row(children:<Widget> [
                                        SizedBox(width: 40),
                                        Container(child: Text('Gold',style:TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.white),)),
                                        SizedBox(width: 130),
                                        Container(
                                          child:Image(image: AssetImage('images/fnb1.png'),height: 55,width: 75),
                                        ),
                                      ],
                                      ),
                                      Row(children:<Widget> [
                                        Container(
                                          margin: EdgeInsets.only(left: 40),
                                          child:Image(image: AssetImage('images/chip.png'),),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(left: 15),
                                          child:Text('****  *****  *****  ****',style: TextStyle(fontSize: 19,color: Colors.white)),
                                        ),
                                      ],
                                      ),
                                      Row(children:<Widget> [
                                        Container(
                                          margin: EdgeInsets.only(left: 214),
                                          child:Text('EXP ../..',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white)),
                                        ),
                                      ],
                                      ),
                                      SizedBox(height: 15,),
                                      Row(children:<Widget> [
                                        Container(
                                          margin: EdgeInsets.only(left: 20),
                                          child:Text('NAME',style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold,color: Colors.white)),
                                        ),
                                      ],
                                      ),
                                      SizedBox(height: 8,),
                                    ]),
                                  ),
                                  SizedBox(height: 15,),
                                  Row(
                                    children: [
                                      Container(
                                        padding:EdgeInsets.only(left: 20) ,
                                        child:Text('Maximum Credit Limit : 100,000 EGP'.tr,style: TextStyle(fontSize: 15)) ,),
                                    ],
                                  ),
                                  SizedBox(height: 10,),
                                  Row(
                                    children: [
                                      Container(
                                        padding:EdgeInsets.only(left: 20) ,
                                        child:Text('Online card usage : available'.tr,style: TextStyle(fontSize: 15)) ,),
                                    ],
                                  ),
                                  SizedBox(height: 10,),
                                  Row(
                                    children: [
                                      Container(
                                        padding:EdgeInsets.only(left: 20) ,
                                        child:Text('Card usage : locally and abroad'.tr,style: TextStyle(fontSize: 15)) ,),
                                    ],
                                  ),
                                  SizedBox(height: 40,),


                                ],);
                              }
                            else if(card['cardtype']=='Debit')
                            {
                              return Column(children: [
                                SizedBox(height: 10,),
                                Row(children:<Widget> [
                                  Container(
                                    padding: EdgeInsets.only(left: 25),
                                    child: Text('My card'.tr,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                                  )
                                ],),

                                SizedBox(height: 20,),
                                Container(
                                  height: 180,
                                  width: 310,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(15)),
                                    gradient: LinearGradient(
                                      begin:Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [

                                        Color(0xff282828),
                                        Color(0xff868686),
                                      ],
                                    ),
                                  ),
                                  child:
                                  Column(children: [
                                    SizedBox(height: 10,),
                                    Row(children:<Widget> [
                                      SizedBox(width: 40),
                                      Container(child: Text('${snapshot.data?[index]['cardtype']}',style:TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.white),)),
                                      SizedBox(width: 130),
                                      Container(
                                        child:Image(image: AssetImage('images/fnb1.png'),height: 55,width: 75),
                                      ),
                                    ],
                                    ),
                                    Row(children:<Widget> [
                                      Container(
                                        margin: EdgeInsets.only(left: 40),
                                        child:Image(image: AssetImage('images/chip.png'),),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 15),
                                        child:Text('****  *****  *****  ****',style: TextStyle(fontSize: 19,color: Colors.white)),
                                      ),
                                    ],
                                    ),
                                    Row(children:<Widget> [
                                      Container(
                                        margin: EdgeInsets.only(left: 214),
                                        child:Text('EXP ${snapshot.data?[index]['edate']}',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white)),
                                      ),
                                    ],
                                    ),
                                    SizedBox(height: 15,),
                                    Row(children:<Widget> [
                                      Container(
                                        margin: EdgeInsets.only(left: 20),
                                        child:Text('${snapshot.data?[index]['customername']}',style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold,color: Colors.white)),
                                      ),
                                    ],
                                    ),
                                    SizedBox(height: 8,),
                                  ]),
                                ),
                                SizedBox(height: 20,),
                                Row(children:<Widget> [
                                  Container(
                                    padding: EdgeInsets.only(left: 25),
                                    child: Text('Cards offers'.tr,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                                  )
                                ],),
                                SizedBox(height: 20,),


                                Container(
                                  height: 180,
                                  width: 310,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(15)),
                                    gradient: LinearGradient(
                                      begin:Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        Color(0xff000417),
                                        Color(0xff1e2023),
                                      ],
                                    ),
                                  ),
                                  child:
                                  Column(children: [
                                    SizedBox(height: 10,),
                                    Row(children:<Widget> [
                                      SizedBox(width: 40),
                                      Container(child: Text('Credit',style:TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.white),)),
                                      SizedBox(width: 130),
                                      Container(
                                        child:Image(image: AssetImage('images/fnb1.png'),height: 55,width: 75),
                                      ),
                                    ],
                                    ),
                                    Row(children:<Widget> [
                                      Container(
                                        margin: EdgeInsets.only(left: 40),
                                        child:Image(image: AssetImage('images/chip.png'),),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 15),
                                        child:Text('****  *****  *****  ****',style: TextStyle(fontSize: 19,color: Colors.white)),
                                      ),
                                    ],
                                    ),
                                    Row(children:<Widget> [
                                      Container(
                                        margin: EdgeInsets.only(left: 214),
                                        child:Text('EXP ../..',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white)),
                                      ),
                                    ],
                                    ),
                                    SizedBox(height: 15,),
                                    Row(children:<Widget> [
                                      Container(
                                        margin: EdgeInsets.only(left: 20),
                                        child:Text('NAME',style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold,color: Colors.white)),
                                      ),
                                    ],
                                    ),
                                    SizedBox(height: 8,),
                                  ]),
                                ),
                                SizedBox(height: 15,),
                                Row(
                                  children: [
                                    Container(
                                      padding:EdgeInsets.only(left: 20) ,
                                      child:Text('Maximum Credit Limit : 300,000 EGP'.tr,style: TextStyle(fontSize: 15)) ,),
                                  ],
                                ),
                                SizedBox(height: 10,),
                                Row(
                                  children: [
                                    Container(
                                      padding:EdgeInsets.only(left: 20) ,
                                      child:Text('Online card usage : available'.tr,style: TextStyle(fontSize: 15)) ,),
                                  ],
                                ),
                                SizedBox(height: 10,),
                                Row(
                                  children: [
                                    Container(
                                      padding:EdgeInsets.only(left: 20) ,
                                      child:Text('Card usage : locally and abroad'.tr,style: TextStyle(fontSize: 15)) ,),
                                  ],
                                ),
                                SizedBox(height: 15,),
                                Divider(
                                  indent: 20,
                                  endIndent: 20,
                                  thickness: 4,
                                ),
                                SizedBox(height: 15,),
                                Container(
                                  height: 180,
                                  width: 310,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(15)),
                                    gradient: LinearGradient(
                                      begin:Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        Color(0xffb49800),
                                        Color(0xffffcd00),
                                      ],
                                    ),
                                  ),
                                  child:
                                  Column(children: [
                                    SizedBox(height: 10,),
                                    Row(children:<Widget> [
                                      SizedBox(width: 40),
                                      Container(child: Text('Gold',style:TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.white),)),
                                      SizedBox(width: 130),
                                      Container(
                                        child:Image(image: AssetImage('images/fnb1.png'),height: 55,width: 75),
                                      ),
                                    ],
                                    ),
                                    Row(children:<Widget> [
                                      Container(
                                        margin: EdgeInsets.only(left: 40),
                                        child:Image(image: AssetImage('images/chip.png'),),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 15),
                                        child:Text('****  *****  *****  ****',style: TextStyle(fontSize: 19,color: Colors.white)),
                                      ),
                                    ],
                                    ),
                                    Row(children:<Widget> [
                                      Container(
                                        margin: EdgeInsets.only(left: 214),
                                        child:Text('EXP ../..',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white)),
                                      ),
                                    ],
                                    ),
                                    SizedBox(height: 15,),
                                    Row(children:<Widget> [
                                      Container(
                                        margin: EdgeInsets.only(left: 20),
                                        child:Text('NAME',style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold,color: Colors.white)),
                                      ),
                                    ],
                                    ),
                                    SizedBox(height: 8,),
                                  ]),
                                ),
                                SizedBox(height: 15,),
                                Row(
                                  children: [
                                    Container(
                                      padding:EdgeInsets.only(left: 20) ,
                                      child:Text('Maximum Credit Limit : 100,000 EGP'.tr,style: TextStyle(fontSize: 15)) ,),
                                  ],
                                ),
                                SizedBox(height: 10,),
                                Row(
                                  children: [
                                    Container(
                                      padding:EdgeInsets.only(left: 20) ,
                                      child:Text('Online card usage : available'.tr,style: TextStyle(fontSize: 15)) ,),
                                  ],
                                ),
                                SizedBox(height: 10,),
                                Row(
                                  children: [
                                    Container(
                                      padding:EdgeInsets.only(left: 20) ,
                                      child:Text('Card usage : locally and abroad'.tr,style: TextStyle(fontSize: 15)) ,),
                                  ],
                                ),
                                SizedBox(height: 40,),


                              ],);
                            }
                            else if(card['cardtype']=='Gold')
                            {
                              return Column(children: [
                                SizedBox(height: 10,),
                                Row(children:<Widget> [
                                  Container(
                                    padding: EdgeInsets.only(left: 25),
                                    child: Text('My card'.tr,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                                  )
                                ],),

                                SizedBox(height: 20,),
                                Container(
                                  height: 180,
                                  width: 310,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(15)),
                                    gradient: LinearGradient(
                                      begin:Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [

                                        Color(0xffb49800),
                                        Color(0xffffcd00),
                                      ],
                                    ),
                                  ),
                                  child:
                                  Column(children: [
                                    SizedBox(height: 10,),
                                    Row(children:<Widget> [
                                      SizedBox(width: 40),
                                      Container(child: Text('${snapshot.data?[index]['cardtype']}',style:TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.white),)),
                                      SizedBox(width: 130),
                                      Container(
                                        child:Image(image: AssetImage('images/fnb1.png'),height: 55,width: 75),
                                      ),
                                    ],
                                    ),
                                    Row(children:<Widget> [
                                      Container(
                                        margin: EdgeInsets.only(left: 40),
                                        child:Image(image: AssetImage('images/chip.png'),),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 15),
                                        child:Text('****  *****  *****  ****',style: TextStyle(fontSize: 19,color: Colors.white)),
                                      ),
                                    ],
                                    ),
                                    Row(children:<Widget> [
                                      Container(
                                        margin: EdgeInsets.only(left: 214),
                                        child:Text('EXP ${snapshot.data?[index]['edate']}',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white)),
                                      ),
                                    ],
                                    ),
                                    SizedBox(height: 15,),
                                    Row(children:<Widget> [
                                      Container(
                                        margin: EdgeInsets.only(left: 20),
                                        child:Text('${snapshot.data?[index]['customername']}',style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold,color: Colors.white)),
                                      ),
                                    ],
                                    ),
                                    SizedBox(height: 8,),
                                  ]),
                                ),
                                SizedBox(height: 20,),
                                Row(children:<Widget> [
                                  Container(
                                    padding: EdgeInsets.only(left: 25),
                                    child: Text('Cards offers'.tr,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                                  )
                                ],),
                                SizedBox(height: 20,),


                                Container(
                                  height: 180,
                                  width: 310,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(15)),
                                    gradient: LinearGradient(
                                      begin:Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        Color(0xff282828),
                                        Color(0xff868686),
                                      ],
                                    ),
                                  ),
                                  child:
                                  Column(children: [
                                    SizedBox(height: 10,),
                                    Row(children:<Widget> [
                                      SizedBox(width: 40),
                                      Container(child: Text('Debit',style:TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.white),)),
                                      SizedBox(width: 130),
                                      Container(
                                        child:Image(image: AssetImage('images/fnb1.png'),height: 55,width: 75),
                                      ),
                                    ],
                                    ),
                                    Row(children:<Widget> [
                                      Container(
                                        margin: EdgeInsets.only(left: 40),
                                        child:Image(image: AssetImage('images/chip.png'),),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 15),
                                        child:Text('****  *****  *****  ****',style: TextStyle(fontSize: 19,color: Colors.white)),
                                      ),
                                    ],
                                    ),
                                    Row(children:<Widget> [
                                      Container(
                                        margin: EdgeInsets.only(left: 214),
                                        child:Text('EXP ../..',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white)),
                                      ),
                                    ],
                                    ),
                                    SizedBox(height: 15,),
                                    Row(children:<Widget> [
                                      Container(
                                        margin: EdgeInsets.only(left: 20),
                                        child:Text('NAME',style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold,color: Colors.white)),
                                      ),
                                    ],
                                    ),
                                    SizedBox(height: 8,),
                                  ]),
                                ),
                                SizedBox(height: 15,),
                                Row(
                                  children: [
                                    Container(
                                      padding:EdgeInsets.only(left: 20) ,
                                      child:Text('Maximum Credit Limit : 250,000 EGP'.tr,style: TextStyle(fontSize: 15)) ,),
                                  ],
                                ),
                                SizedBox(height: 10,),
                                Row(
                                  children: [
                                    Container(
                                      padding:EdgeInsets.only(left: 20) ,
                                      child:Text('Grace period : up to 59 days for purchase'.tr,style: TextStyle(fontSize: 15)) ,),
                                  ],
                                ),
                                SizedBox(height: 15,),
                                Divider(
                                  indent: 20,
                                  endIndent: 20,
                                  thickness: 4,
                                ),
                                SizedBox(height: 15,),
                                Container(
                                  height: 180,
                                  width: 310,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(15)),
                                    gradient: LinearGradient(
                                      begin:Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        Color(0xff000417),
                                        Color(0xff1e2023),
                                      ],
                                    ),
                                  ),
                                  child:
                                  Column(children: [
                                    SizedBox(height: 10,),
                                    Row(children:<Widget> [
                                      SizedBox(width: 40),
                                      Container(child: Text('Credit',style:TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.white),)),
                                      SizedBox(width: 130),
                                      Container(
                                        child:Image(image: AssetImage('images/fnb1.png'),height: 55,width: 75),
                                      ),
                                    ],
                                    ),
                                    Row(children:<Widget> [
                                      Container(
                                        margin: EdgeInsets.only(left: 40),
                                        child:Image(image: AssetImage('images/chip.png'),),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 15),
                                        child:Text('****  *****  *****  ****',style: TextStyle(fontSize: 19,color: Colors.white)),
                                      ),
                                    ],
                                    ),
                                    Row(children:<Widget> [
                                      Container(
                                        margin: EdgeInsets.only(left: 214),
                                        child:Text('EXP ../..',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white)),
                                      ),
                                    ],
                                    ),
                                    SizedBox(height: 15,),
                                    Row(children:<Widget> [
                                      Container(
                                        margin: EdgeInsets.only(left: 20),
                                        child:Text('NAME',style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold,color: Colors.white)),
                                      ),
                                    ],
                                    ),
                                    SizedBox(height: 8,),
                                  ]),
                                ),
                                SizedBox(height: 15,),
                                Row(
                                  children: [
                                    Container(
                                      padding:EdgeInsets.only(left: 20) ,
                                      child:Text('Maximum Credit Limit : 300,000 EGP'.tr,style: TextStyle(fontSize: 15)) ,),
                                  ],
                                ),
                                SizedBox(height: 10,),
                                Row(
                                  children: [
                                    Container(
                                      padding:EdgeInsets.only(left: 20) ,
                                      child:Text('Online card usage : available'.tr,style: TextStyle(fontSize: 15)) ,),
                                  ],
                                ),
                                SizedBox(height: 10,),
                                Row(
                                  children: [
                                    Container(
                                      padding:EdgeInsets.only(left: 20) ,
                                      child:Text('Card usage : locally and abroad'.tr,style: TextStyle(fontSize: 15)) ,),
                                  ],
                                ),
                                SizedBox(height: 40,),


                              ],);
                            }



                          },
                        );
                      }
                    else{

                        return ListView(children: [
                          SizedBox(height: 10,),
                          Row(children:<Widget> [
                            Container(
                              padding: EdgeInsets.only(left: 25),
                              child: Text('Cards offers'.tr,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                            )
                          ],),
                          SizedBox(height: 20,),


                          Container(
                            height: 180,
                            width: 310,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                              gradient: LinearGradient(
                                begin:Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Color(0xff282828),
                                  Color(0xff868686),
                                ],
                              ),
                            ),
                            child:
                            Column(children: [
                              SizedBox(height: 10,),
                              Row(children:<Widget> [
                                SizedBox(width: 40),
                                Container(child: Text('Debit',style:TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.white),)),
                                SizedBox(width: 130),
                                Container(
                                  child:Image(image: AssetImage('images/fnb1.png'),height: 55,width: 75),
                                ),
                              ],
                              ),
                              Row(children:<Widget> [
                                Container(
                                  margin: EdgeInsets.only(left: 40),
                                  child:Image(image: AssetImage('images/chip.png'),),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 15),
                                  child:Text('****  *****  *****  ****',style: TextStyle(fontSize: 19,color: Colors.white)),
                                ),
                              ],
                              ),
                              Row(children:<Widget> [
                                Container(
                                  margin: EdgeInsets.only(left: 214),
                                  child:Text('EXP ../..',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white)),
                                ),
                              ],
                              ),
                              SizedBox(height: 15,),
                              Row(children:<Widget> [
                                Container(
                                  margin: EdgeInsets.only(left: 20),
                                  child:Text('NAME',style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold,color: Colors.white)),
                                ),
                              ],
                              ),
                              SizedBox(height: 8,),
                            ]),
                          ),
                          SizedBox(height: 15,),
                          Row(
                            children: [
                              Container(
                                padding:EdgeInsets.only(left: 20) ,
                                child:Text('Maximum Credit Limit : 250,000 EGP'.tr,style: TextStyle(fontSize: 15)) ,),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              Container(
                                padding:EdgeInsets.only(left: 20) ,
                                child:Text('Grace period : up to 59 days for purchase'.tr,style: TextStyle(fontSize: 15)) ,),
                            ],
                          ),
                          SizedBox(height: 15,),
                          Divider(
                            indent: 20,
                            endIndent: 20,
                            thickness: 4,
                          ),
                          SizedBox(height: 15,),
                          Container(
                            height: 180,
                            width: 310,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                              gradient: LinearGradient(
                                begin:Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Color(0xff000417),
                                  Color(0xff1e2023),
                                ],
                              ),
                            ),
                            child:
                            Column(children: [
                              SizedBox(height: 10,),
                              Row(children:<Widget> [
                                SizedBox(width: 40),
                                Container(child: Text('Credit',style:TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.white),)),
                                SizedBox(width: 130),
                                Container(
                                  child:Image(image: AssetImage('images/fnb1.png'),height: 55,width: 75),
                                ),
                              ],
                              ),
                              Row(children:<Widget> [
                                Container(
                                  margin: EdgeInsets.only(left: 40),
                                  child:Image(image: AssetImage('images/chip.png'),),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 15),
                                  child:Text('****  *****  *****  ****',style: TextStyle(fontSize: 19,color: Colors.white)),
                                ),
                              ],
                              ),
                              Row(children:<Widget> [
                                Container(
                                  margin: EdgeInsets.only(left: 214),
                                  child:Text('EXP ../..',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white)),
                                ),
                              ],
                              ),
                              SizedBox(height: 15,),
                              Row(children:<Widget> [
                                Container(
                                  margin: EdgeInsets.only(left: 20),
                                  child:Text('NAME',style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold,color: Colors.white)),
                                ),
                              ],
                              ),
                              SizedBox(height: 8,),
                            ]),
                          ),
                          SizedBox(height: 15,),
                          Row(
                            children: [
                              Container(
                                padding:EdgeInsets.only(left: 20) ,
                                child:Text('Maximum Credit Limit : 300,000 EGP'.tr,style: TextStyle(fontSize: 15)) ,),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              Container(
                                padding:EdgeInsets.only(left: 20) ,
                                child:Text('Online card usage : available'.tr,style: TextStyle(fontSize: 15)) ,),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              Container(
                                padding:EdgeInsets.only(left: 20) ,
                                child:Text('Card usage : locally and abroad'.tr,style: TextStyle(fontSize: 15)) ,),
                            ],
                          ),
                          SizedBox(height: 15,),
                          Divider(
                            indent: 20,
                            endIndent: 20,
                            thickness: 4,
                          ),
                          SizedBox(height: 15,),
                          Container(
                            height: 180,
                            width: 310,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                              gradient: LinearGradient(
                                begin:Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Color(0xffb49800),
                                  Color(0xffffcd00),
                                ],
                              ),
                            ),
                            child:
                            Column(children: [
                              SizedBox(height: 10,),
                              Row(children:<Widget> [
                                SizedBox(width: 40),
                                Container(child: Text('Gold',style:TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.white),)),
                                SizedBox(width: 130),
                                Container(
                                  child:Image(image: AssetImage('images/fnb1.png'),height: 55,width: 75),
                                ),
                              ],
                              ),
                              Row(children:<Widget> [
                                Container(
                                  margin: EdgeInsets.only(left: 40),
                                  child:Image(image: AssetImage('images/chip.png'),),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 15),
                                  child:Text('****  *****  *****  ****',style: TextStyle(fontSize: 19,color: Colors.white)),
                                ),
                              ],
                              ),
                              Row(children:<Widget> [
                                Container(
                                  margin: EdgeInsets.only(left: 214),
                                  child:Text('EXP ../..',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white)),
                                ),
                              ],
                              ),
                              SizedBox(height: 15,),
                              Row(children:<Widget> [
                                Container(
                                  margin: EdgeInsets.only(left: 20),
                                  child:Text('NAME',style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold,color: Colors.white)),
                                ),
                              ],
                              ),
                              SizedBox(height: 8,),
                            ]),
                          ),
                          SizedBox(height: 15,),
                          Row(
                            children: [
                              Container(
                                padding:EdgeInsets.only(left: 20) ,
                                child:Text('Maximum Credit Limit : 100,000 EGP'.tr,style: TextStyle(fontSize: 15)) ,),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              Container(
                                padding:EdgeInsets.only(left: 20) ,
                                child:Text('Online card usage : available'.tr,style: TextStyle(fontSize: 15)) ,),
                            ],
                          ),
                          SizedBox(height: 10,),


                        ],);





                      }


                    } else if (snapshot.hasError) {
                        return Text("${snapshot.error}");
                      }



                      // By default, show a loading spinner.
                      return Container(
                          alignment: Alignment.center,
                          child: CircularProgressIndicator(
                            strokeWidth: 4,
                            color: Color(0xff8d0000),


                          ));
                    },
                  ),
                ),],),),],),



    ListView(children: [
      Column(
        children:<Widget> [

          SizedBox(height: 60),
          Center(child: Image(image: AssetImage('images/loan.png'),width: 150,height: 150,)),
          SizedBox(height: 30),

          Container(
              margin: EdgeInsets.symmetric(vertical: 12),
              width: size.width * 0.85,
              child: ClipRRect(
                child: SizedBox(height: 55, child:  ElevatedButton(

                  // padding: EdgeInsets.symmetric(vertical: 18,horizontal: 38),
                  // color: Colors.deepOrange,
                  onPressed: () async {
                    Navigator.push(context, MaterialPageRoute(builder:
                        (context)=> loanamount(data: data, name: name, dob1: dob1, nationality: nationality, gender: gender, mart: mart, add: add, emailadd: emailadd, homenum: homenum, mobilenum: mobilenum, jobb: jobb, jobbadd: jobbadd, income: income, type: type, id: id, accountnum1: accountnum1, balance1: balance1, money: money, username: username, password: password)),
                    );
                  },
                  child: Text(
                    'Loan amount calculator'.tr,
                    style:
                    TextStyle(color: Colors.white, fontSize: 18),
                  ),

                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Color(0xff8d0000)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius:BorderRadius.circular(25),
                            side: BorderSide(color: Colors.white)
                        ),)
                  ),
                )),
              )),

          SizedBox(height: 7,),

          Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              width: size.width * 0.85,
              child: ClipRRect(
                child: SizedBox(height: 55, child:  ElevatedButton(

                  // padding: EdgeInsets.symmetric(vertical: 18,horizontal: 38),
                  // color: Colors.deepOrange,
                  onPressed: () async {
                    Navigator.push(context, MaterialPageRoute(builder:
                        (context)=> LoanCalculator()),
                    );
                  },
                  child: Text(
                    'Loan installment calculator'.tr,
                    style:
                    TextStyle(color: Colors.white, fontSize: 18),
                  ),

                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Color(0xff8d0000)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius:BorderRadius.circular(25),
                            side: BorderSide(color: Colors.white)
                        ),)
                  ),
                )),
              )),


          SizedBox(height: 7,),

          Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              width: size.width * 0.85,
              child: ClipRRect(
                child: SizedBox(height: 55, child:  ElevatedButton(
                  // padding: EdgeInsets.symmetric(vertical: 18,horizontal: 38),
                  // color: Colors.deepOrange,
                  onPressed: () async {
                    Navigator.push(context, MaterialPageRoute(builder:
                        (context)=> loanrequest(data: data, name: name, dob1: dob1, nationality: nationality, gender: gender, mart: mart, add: add, emailadd: emailadd, homenum: homenum, mobilenum: mobilenum, jobb: jobb, jobbadd: jobbadd, income: income, type: type, id: id, accountnum1: accountnum1, balance1: balance1, money: money, username: username, password: password)),
                    );
                  },
                  child: Text(
                    'My loans requests'.tr,
                    style:
                    TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Color(0xff8d0000)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius:BorderRadius.circular(25),
                            side: BorderSide(color: Colors.white)
                        ),)
                  ),
                )),
              )),



        ],
      ),

    ],),


ListView(children: [
      Column(
        children:<Widget> [

          SizedBox(height: 60),
            Center(child: Image(image: AssetImage('images/coins.png'),)),
          SizedBox(height: 20),
          Center(child: Text('Time to invest!'.tr,style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),)),
          SizedBox(height: 10),
          Center(child: Text('It seems that you dont have any investment products yet!'.tr,style: TextStyle(fontSize: 19,),textAlign: TextAlign.center,)),
          SizedBox(height: 20),
          Container(
              margin: EdgeInsets.symmetric(vertical: 12),
              width: size.width * 0.9,
              child: ClipRRect(
                child: SizedBox(height: 50, child:  ElevatedButton(
                  // padding: EdgeInsets.symmetric(vertical: 18,horizontal: 38),
                  // color: Colors.deepOrange,
                  onPressed: () async {
                    Navigator.push(context, MaterialPageRoute(builder:
                        (context)=> certificate(data: data, name: name, dob1: dob1, nationality: nationality, gender: gender, mart: mart, add: add, emailadd: emailadd, homenum: homenum, mobilenum: mobilenum, jobb: jobb, jobbadd: jobbadd, income: income, type: type, id: id, accountnum1: accountnum1, balance1: balance1, money: money, username: username, password: password,pass2: pass2,)),
                    );
                  },
                  child: Text(
                    'Apply'.tr,
                    style:
                    TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Color(0xff8d0000)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius:BorderRadius.circular(25),
                            side: BorderSide(color: Colors.white)
                        ),)
                  ),
                )),
              )),
          SizedBox(height: 0),
          Container(
              margin: EdgeInsets.symmetric(vertical: 12),
              width: size.width * 0.9,
              child: ClipRRect(
                child: SizedBox(height: 50, child:  ElevatedButton(
                  // padding: EdgeInsets.symmetric(vertical: 18,horizontal: 38),
                  // color: Colors.deepOrange,
                  onPressed: () async {
                    Navigator.push(context, MaterialPageRoute(builder:
                        (context)=> mycertificates(data: data, name: name, dob1: dob1, nationality: nationality, gender: gender, mart: mart, add: add, emailadd: emailadd, homenum: homenum, mobilenum: mobilenum, jobb: jobb, jobbadd: jobbadd, income: income, type: type, id: id, accountnum1: accountnum1, balance1: balance1, money: money, username: username, password: password)),
                    );
                  },
                  child: Text(
                    'My certificates'.tr,
                    style:
                    TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Color(0xff8d0000)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius:BorderRadius.circular(25),
                            side: BorderSide(color: Colors.white)
                        ),)
                  ),
                )),
              )),



        ],
      ),
],)

    ],
    ),

    ),





    ],
    ),
    ),




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
      ),
    );
  }
}