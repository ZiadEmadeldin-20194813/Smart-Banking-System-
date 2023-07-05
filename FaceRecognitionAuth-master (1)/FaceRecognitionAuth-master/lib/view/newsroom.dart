import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import '../controller/new_controller.dart';
import 'bottom_new_bar/health.dart';
import 'bottom_new_bar/science.dart';
import 'bottom_new_bar/business.dart';
import 'bottom_new_bar/sports.dart';

class newsroom extends GetWidget{
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


  newsroom(
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
  Widget build(BuildContext context) {
    List<Widget>screens=[
      Business(data: data, name: name, dob1: dob1, nationality: nationality, gender: gender, mart: mart, add: add, emailadd: emailadd, homenum: homenum, mobilenum: mobilenum, jobb: jobb, jobbadd: jobbadd, income: income, type: type, id: id, accountnum1: accountnum1, balance1: balance1, money: money, username: username, password: password, pass2: pass2,),
      Science(data: data, name: name, dob1: dob1, nationality: nationality, gender: gender, mart: mart, add: add, emailadd: emailadd, homenum: homenum, mobilenum: mobilenum, jobb: jobb, jobbadd: jobbadd, income: income, type: type, id: id, accountnum1: accountnum1, balance1: balance1, money: money, username: username, password: password, pass2: pass2),
      Health(data: data, name: name, dob1: dob1, nationality: nationality, gender: gender, mart: mart, add: add, emailadd: emailadd, homenum: homenum, mobilenum: mobilenum, jobb: jobb, jobbadd: jobbadd, income: income, type: type, id: id, accountnum1: accountnum1, balance1: balance1, money: money, username: username, password: password, pass2: pass2),
      Sports(data: data, name: name, dob1: dob1, nationality: nationality, gender: gender, mart: mart, add: add, emailadd: emailadd, homenum: homenum, mobilenum: mobilenum, jobb: jobb, jobbadd: jobbadd, income: income, type: type, id: id, accountnum1: accountnum1, balance1: balance1, money: money, username: username, password: password, pass2: pass2),
    ];

    var currentIndex = 0;
    NewsController controller=Get.put(NewsController());
    return Scaffold(
        floatingActionButton:SpeedDial(
          animatedIcon: AnimatedIcons.menu_close,
          backgroundColor: Color(0xff8d0000),
          overlayColor: Colors.black,
          overlayOpacity: 0.7,
          spaceBetweenChildren: 12,
          spacing: 12,

          children: [
            SpeedDialChild(
              child: Icon(Icons.business,color:Color(0xff8d0000)),
              label: 'Business',labelStyle: TextStyle(color:Color(0xff8d0000),fontSize: 17),
              onTap: () async {
                Navigator.push(context, MaterialPageRoute(builder:
                    (context)=> Business(data: data, name: name, dob1: dob1, nationality: nationality, gender: gender, mart: mart, add: add, emailadd: emailadd, homenum: homenum, mobilenum: mobilenum, jobb: jobb, jobbadd: jobbadd, income: income, type: type, id: id, accountnum1: accountnum1, balance1: balance1, money: money, username: username, password: password, pass2: pass2)),
                );
              },
            ),
            SpeedDialChild(
              child: Icon(Icons.science,color: Color(0xff8d0000)),
              label: 'Science',labelStyle: TextStyle(color:Color(0xff8d0000),fontSize: 17),
              onTap: () async {
                Navigator.push(context, MaterialPageRoute(builder:
                    (context)=> Science(data: data, name: name, dob1: dob1, nationality: nationality, gender: gender, mart: mart, add: add, emailadd: emailadd, homenum: homenum, mobilenum: mobilenum, jobb: jobb, jobbadd: jobbadd, income: income, type: type, id: id, accountnum1: accountnum1, balance1: balance1, money: money, username: username, password: password, pass2: pass2)),
                );
              },
            ),
            SpeedDialChild(
              child: Icon(Icons.health_and_safety,color: Color(0xff8d0000)),
              label: 'Health',labelStyle: TextStyle(color:Color(0xff8d0000),fontSize: 17),
              onTap: () async {
                Navigator.push(context, MaterialPageRoute(builder:
                    (context)=> Health(data: data, name: name, dob1: dob1, nationality: nationality, gender: gender, mart: mart, add: add, emailadd: emailadd, homenum: homenum, mobilenum: mobilenum, jobb: jobb, jobbadd: jobbadd, income: income, type: type, id: id, accountnum1: accountnum1, balance1: balance1, money: money, username: username, password: password, pass2: pass2)),
                );
              },
            ),
            SpeedDialChild(
              child: Icon(Icons.sports_soccer,color: Color(0xff8d0000)),
              label: 'Sports',labelStyle: TextStyle(color:Color(0xff8d0000),fontSize: 17),

              onTap: () async {
                Navigator.push(context, MaterialPageRoute(builder:
                    (context)=> Sports(data: data, name: name, dob1: dob1, nationality: nationality, gender: gender, mart: mart, add: add, emailadd: emailadd, homenum: homenum, mobilenum: mobilenum, jobb: jobb, jobbadd: jobbadd, income: income, type: type, id: id, accountnum1: accountnum1, balance1: balance1, money: money, username: username, password: password, pass2: pass2)),
                );
              },
            ),
          ],
        ),

        body: GetX<NewsController>(builder: (controller)=>screens[controller.currentIndex.value])
    );
  }

}