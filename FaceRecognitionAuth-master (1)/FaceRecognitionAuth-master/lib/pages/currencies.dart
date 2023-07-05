import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../pages/exchangerates.dart';
import '../pages/payments.dart';
import '../pages/home.dart';
import '../pages/profile.dart';
import '../pages/currencyConverter.dart';
import 'package:get/get.dart';

class currencies extends StatefulWidget {
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


  currencies(
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
  State<currencies> createState() => _currenciesState(data: data, name: name, dob1: dob1, nationality: nationality, gender: gender, mart: mart, add: add, emailadd: emailadd, homenum: homenum, mobilenum: mobilenum, jobb: jobb, jobbadd: jobbadd, income: income, type: type, id: id, accountnum1: accountnum1, balance1: balance1, money: money, username: username, password: password,pass2: pass2);
}

class _currenciesState extends State<currencies> {
  var _index = 1;
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


  _currenciesState(
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

            /*leading: IconButton(
              icon: Icon(Icons.arrow_back_ios_new,color: Colors.white,),
              onPressed: ()=> Navigator.pop(context),

            ),*/
            backgroundColor:Color(0xff8d0000) ,
            centerTitle: true,
            title: Text ('Currencies'.tr),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:<Widget> [
                      Container(
                        padding: EdgeInsets.only(left: 50),
                        child: Text('Exhange rates'.tr,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                      ),

                      Container(
                        padding: EdgeInsets.only(right: 40),
                        child: IconButton(
                          icon: Icon(Icons.arrow_forward_ios,color: Colors.black,),
                          onPressed: (){

                            Navigator.push(context, MaterialPageRoute(builder:
                                (context)=> exchangerates()),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 15,),
                  Divider
                    (
                    thickness: 1.5,
                    height: 0,
                    color: Colors.black,
                    indent: 40,
                    endIndent:40,
                  ),
                  SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:<Widget> [
                      Container(
                        padding: EdgeInsets.only(left: 50),
                        child: Text('Currency converter'.tr,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                      ),


                      Container(
                        padding: EdgeInsets.only(right: 40),
                        child: IconButton(
                          icon: Icon(Icons.arrow_forward_ios,color: Colors.black,),
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder:
                                (context)=> currencyConverter()),
                            );

                          },
                        ),
                      )
                    ],
                  ),


                ],
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
                      (context)=> homePage(data: data, name: name, dob1: dob1, nationality: nationality, gender: gender, mart: mart, add: add, emailadd: emailadd, homenum: homenum, mobilenum: mobilenum, jobb: jobb, jobbadd: jobbadd, income: income, type: type, id: id, accountnum1: accountnum1, balance1: balance1, money: money, username: username, password: password,pass2: pass2,)),
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
