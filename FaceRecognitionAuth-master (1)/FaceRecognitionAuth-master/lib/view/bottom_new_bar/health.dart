import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import '../../controller/new_controller.dart';
import '../../model/new_model.dart';
import '../../pages/home.dart';
import 'business.dart';
import 'science.dart';
import 'sports.dart';


class Health extends GetWidget{
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


  Health(
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


    NewsController controller=Get.put(NewsController());
    return Scaffold(
      appBar:AppBar (

        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new,color: Colors.white,),
          onPressed:() async {
            Navigator.push(context, MaterialPageRoute(builder:
                (context)=> homePage(data: data, name: name, dob1: dob1, nationality: nationality, gender: gender, mart: mart, add: add, emailadd: emailadd, homenum: homenum, mobilenum: mobilenum, jobb: jobb, jobbadd: jobbadd, income: income, type: type, id: id, accountnum1: accountnum1, balance1: balance1, money: money, username: username, password: password, pass2: pass2)),
            );
          },



        ),
        backgroundColor:Color(0xff8d0000) ,
        centerTitle: true,
        title: Text ('Health'),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(25),
          ),
        ),

      ),


      body:
      RefreshIndicator(

        displacement: 40,
        backgroundColor: Color(0xff8d0000) ,
        color: Colors.white,
        strokeWidth: 3,
        triggerMode: RefreshIndicatorTriggerMode.onEdge,
        onRefresh: () async {
          await
          Future.delayed(Duration(milliseconds: 1500),);
          setState(() {


          });
        },

        child:  FutureBuilder(
            future: controller.getData("health"),
            builder: (context,AsyncSnapshot snapshot)
            {
              Articles data=snapshot.data;
              if(snapshot.hasData)
              {
                return ListView.builder(

                    itemCount: data.articles.length,
                    itemBuilder:(context,int index)
                    {
                      return Card(
                        elevation: 10,
                        shadowColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),

                        ),
                        child: Column(
                          children: [
                            Container(
                              width: double.infinity,
                              height: 150,
                              child: Image.network(
                                data.articles[index].urlToImage.toString(),
                                fit: BoxFit.fill,
                              ),
                            ),
                            Text(
                              data.articles[index].title.toString(),
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                              textDirection: TextDirection.ltr,

                            ),
                            Text(
                              data.articles[index].description.toString(),
                              style: TextStyle(
                                  fontSize: 18,color: Colors.grey),
                              textDirection: TextDirection.ltr,

                            ),
                            SizedBox(height: 10,),
                          ],
                        ),
                      );
                    } );
              }
              else{
                return Center(child: CircularProgressIndicator());
              }
            }),),

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
    );
  }

  void setState(Null Function() param0) {}

}