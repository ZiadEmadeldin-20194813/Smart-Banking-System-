import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../pages/education.dart';
import '../pages/electricity.dart';
import '../pages/gas.dart';
import '../pages/home.dart';
import '../pages/currencies.dart';
import '../pages/ministat.dart';
import '../pages/profile.dart';
import '../pages/telecom.dart';
import '../pages/transfer.dart';
import '../pages/mytrans.dart';
import '../pages/water.dart';
import 'package:get/get.dart';


class payments extends StatefulWidget {
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


  payments(
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
  State<payments> createState() => _paymentsState(data: data, name: name, dob1: dob1, nationality: nationality, gender: gender, mart: mart, add: add, emailadd: emailadd, homenum: homenum, mobilenum: mobilenum, jobb: jobb, jobbadd: jobbadd, income: income, type: type, id: id, accountnum1: accountnum1, balance1: balance1, money: money, username: username, password: password,pass2: pass2);
}

class _paymentsState extends State<payments> {
  var _index = 2;
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


  _paymentsState(
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

          /*  leading: IconButton(
              icon: Icon(Icons.arrow_back_ios_new,color: Colors.white,),
              onPressed: ()=> Navigator.pop(context),

            ),*/
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
          Container(
            child: Container(

              child: ListView(

                padding: EdgeInsets.only(left: 20,right: 20),
                children: <Widget>[

                  SizedBox(height:30),


                  Row(children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 12),
                      width: size.width * 0.4,
                      height:150,
                      child: FloatingActionButton.extended(onPressed: (){

                        Navigator.push(context, MaterialPageRoute(builder:
                            (context)=> transfer(data: data, name: name, dob1: dob1, nationality: nationality, gender: gender, mart: mart, add: add, emailadd: emailadd, homenum: homenum, mobilenum: mobilenum, jobb: jobb, jobbadd: jobbadd, income: income, type: type, id: id, accountnum1: accountnum1, balance1: balance1, money: money, username: username, password: password,pass2:pass2)
                        ), );

                      },

                        label: Text('Transfer\nmoney'.tr,style: TextStyle(color: Colors.white,fontSize: 20),textAlign: TextAlign.center,
                        ),backgroundColor: Color(0xff8d0000),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25),
                            side: BorderSide(style: BorderStyle.solid,width: 1.5,color: Color(
                                0xffffffff)) ),
                      ),
                    ),

SizedBox(width: 30,),
                    Container(
                      child: Column(children: [

                        Container(
                          margin: EdgeInsets.symmetric(vertical: 12),
                          width: size.width * 0.4,
                          height:65,
                          child: FloatingActionButton.extended(onPressed: (){

                            Navigator.push(context, MaterialPageRoute(builder:
                                (context)=> mytrans(data: data, name: name, dob1: dob1, nationality: nationality, gender: gender, mart: mart, add: add, emailadd: emailadd, homenum: homenum, mobilenum: mobilenum, jobb: jobb, jobbadd: jobbadd, income: income, type: type, id: id, accountnum1: accountnum1, balance1: balance1, money: money, username: username, password: password)
                            ),);


                          },

                            label: Text('Mini\nstatements  '.tr,style: TextStyle(color: Colors.white,fontSize: 18),
                            ),backgroundColor: Color(0xff8d0000),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25),
                                side: BorderSide(style: BorderStyle.solid,width: 1.5,color: Color(
                                    0xffffffff)) ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 12),
                          width: size.width * 0.4,
                          height:65,
                          child: FloatingActionButton.extended(onPressed: (){

                            Navigator.push(context, MaterialPageRoute(builder:
                                (context)=> ministat(data: data, name: name, dob1: dob1, nationality: nationality, gender: gender, mart: mart, add: add, emailadd: emailadd, homenum: homenum, mobilenum: mobilenum, jobb: jobb, jobbadd: jobbadd, income: income, type: type, id: id, accountnum1: accountnum1, balance1: balance1, money: money, username: username, password: password)
                            ),);


                          },

                            label: Text('My\ntransactions'.tr,style: TextStyle(color: Colors.white,fontSize: 18),textAlign: TextAlign.start,
                            ),backgroundColor: Color(0xff8d0000),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25),
                                side: BorderSide(style: BorderStyle.solid,width: 1.5,color: Color(
                                    0xffffffff)) ),
                          ),
                        ),

                      ]),
                    )

                  ],),
                  SizedBox(height: 10),
                  Container(
                    child: FloatingActionButton.extended(onPressed: (){

                      Navigator.push(context, MaterialPageRoute(builder:
                          (context)=> telecom(data: data, name: name, dob1: dob1, nationality: nationality, gender: gender, mart: mart, add: add, emailadd: emailadd, homenum: homenum, mobilenum: mobilenum, jobb: jobb, jobbadd: jobbadd, income: income, type: type, id: id, accountnum1: accountnum1, balance1: balance1, money: money, username: username, password: password,pass2:pass2)),
                      );


                    },
                      icon: Icon(Icons.send_to_mobile,
                        color: Colors.white,size: 25,),
                      label: Text('Telecom'.tr,style: TextStyle(color: Colors.white,fontSize: 17),
                      ),backgroundColor: Color(0xff8d0000),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25),
                          side: BorderSide(style: BorderStyle.solid,width: 1.5,color: Color(
                              0xffffffff)) ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    child: FloatingActionButton.extended(onPressed: (){

                      Navigator.push(context, MaterialPageRoute(builder:
                          (context)=> education(data: data, name: name, dob1: dob1, nationality: nationality, gender: gender, mart: mart, add: add, emailadd: emailadd, homenum: homenum, mobilenum: mobilenum, jobb: jobb, jobbadd: jobbadd, income: income, type: type, id: id, accountnum1: accountnum1, balance1: balance1, money: money, username: username, password: password,pass2:pass2)),
                      );


                    },
                      icon: Icon(Icons.school,
                        color: Colors.white,size: 25,),
                      label: Text('Education'.tr,style: TextStyle(color: Colors.white,fontSize: 17),
                      ),backgroundColor: Color(0xff8d0000),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25),
                          side: BorderSide(style: BorderStyle.solid,width: 1.5,color: Color(
                              0xffffffff)) ),
                    ),
                  ),

                  SizedBox(height: 20),
                  Container(
                    child: FloatingActionButton.extended(onPressed: (){

                      Navigator.push(context, MaterialPageRoute(builder:
                          (context)=> water(data: data, name: name, dob1: dob1, nationality: nationality, gender: gender, mart: mart, add: add, emailadd: emailadd, homenum: homenum, mobilenum: mobilenum, jobb: jobb, jobbadd: jobbadd, income: income, type: type, id: id, accountnum1: accountnum1, balance1: balance1, money: money, username: username, password: password,pass2:pass2)),   );


                    },
                      icon: Icon(Icons.water_drop_rounded,
                        color: Colors.white,size: 25,),
                      label: Text('Water'.tr,style: TextStyle(color: Colors.white,fontSize: 17),
                      ),backgroundColor: Color(0xff8d0000),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25),
                          side: BorderSide(style: BorderStyle.solid,width: 1.5,color: Color(
                              0xffffffff)) ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    child: FloatingActionButton.extended(onPressed: (){

                      Navigator.push(context, MaterialPageRoute(builder:
                          (context)=> electricity(data: data, name: name, dob1: dob1, nationality: nationality, gender: gender, mart: mart, add: add, emailadd: emailadd, homenum: homenum, mobilenum: mobilenum, jobb: jobb, jobbadd: jobbadd, income: income, type: type, id: id, accountnum1: accountnum1, balance1: balance1, money: money, username: username, password: password,pass2:pass2)),   );

                    },
                      icon: Icon(Icons.electric_bolt,
                        color: Colors.white,size: 25,),
                      label: Text('Electricity'.tr,style: TextStyle(color: Colors.white,fontSize: 17),
                      ),backgroundColor: Color(0xff8d0000),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25),
                          side: BorderSide(style: BorderStyle.solid,width: 1.5,color: Color(
                              0xffffffff)) ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    child: FloatingActionButton.extended(onPressed: (){

                      Navigator.push(context, MaterialPageRoute(builder:
                          (context)=> gas(data: data, name: name, dob1: dob1, nationality: nationality, gender: gender, mart: mart, add: add, emailadd: emailadd, homenum: homenum, mobilenum: mobilenum, jobb: jobb, jobbadd: jobbadd, income: income, type: type, id: id, accountnum1: accountnum1, balance1: balance1, money: money, username: username, password: password,pass2:pass2)),   );


                    },
                      icon: Icon(Icons.gas_meter,
                        color: Colors.white,size: 25,),
                      label: Text('Gas'.tr,style: TextStyle(color: Colors.white,fontSize: 17),
                      ),backgroundColor: Color(0xff8d0000),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25),
                          side:  BorderSide(style: BorderStyle.solid,width: 1.5,color: Color(
                              0xffffffff)) ),
                    ),
                  ),

                  SizedBox(height: 20),



                ],),
            ),),






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
                      (context)=> homePage(data: data, name: name, dob1: dob1, nationality: nationality, gender: gender, mart: mart, add: add, emailadd: emailadd, homenum: homenum, mobilenum: mobilenum, jobb: jobb, jobbadd: jobbadd, income: income, type: type, id: id, accountnum1: accountnum1, balance1: balance1, money: money, username: username, password: password,pass2: pass2,)),
                  );
                  if (_index == 1)  Navigator.push(context, MaterialPageRoute(builder:
                      (context)=> currencies(data: data, name: name, dob1: dob1, nationality: nationality, gender: gender, mart: mart, add: add, emailadd: emailadd, homenum: homenum, mobilenum: mobilenum, jobb: jobb, jobbadd: jobbadd, income: income, type: type, id: id, accountnum1: accountnum1, balance1: balance1, money: money, username: username, password: password,pass2: pass2,)),
                  );
                  if (_index == 2)    Navigator.push(context, MaterialPageRoute(builder:
                      (context)=> payments(data: data, name: name, dob1: dob1, nationality: nationality, gender: gender, mart: mart, add: add, emailadd: emailadd, homenum: homenum, mobilenum: mobilenum, jobb: jobb, jobbadd: jobbadd, income: income, type: type, id: id, accountnum1: accountnum1, balance1: balance1, money: money, username: username, password: password,pass2: pass2,)),
                  );

                  if (_index == 3)  Navigator.push(context, MaterialPageRoute(builder:
                      (context)=> profile(data: data, name: name, dob1: dob1, nationality: nationality, gender: gender, mart: mart, add: add, emailadd: emailadd, homenum: homenum, mobilenum: mobilenum, jobb: jobb, jobbadd: jobbadd, income: income, type: type, id: id, accountnum1: accountnum1, balance1: balance1, money: money, username: username, password: password,pass2:pass2)),
                  );



                });

              }
          ),




        ));
  }
}
