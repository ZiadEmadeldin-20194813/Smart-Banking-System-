import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class receipt extends StatefulWidget {
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


  receipt(
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
  State<receipt> createState() => _receiptState(data: data, name: name, dob1: dob1, nationality: nationality, gender: gender, mart: mart, add: add, emailadd: emailadd, homenum: homenum, mobilenum: mobilenum, jobb: jobb, jobbadd: jobbadd, income: income, type: type, id: id, accountnum1: accountnum1, balance1: balance1, money: money, username: username, password: password);
}

class _receiptState extends State<receipt> {

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


  _receiptState(
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

  Future<List<dynamic>> fetchTransactions(accountnum1) async {
    final response = await http.get(Uri.parse('https://inconspicuous-pairs.000webhostapp.com/getreceipt.php?accountnumber=$accountnum1'));

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
            title: Text ('Queuing request'.tr),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(25),
              ),
            ),

          ),

          body:
          ListView(
            children: [

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 15),

                    Center( child: Text('My receipts'.tr,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),),
                    SizedBox(height: 10),
                    SizedBox(height:  MediaQuery.of(context).size.height - 130, //500
                      child:
                      FutureBuilder<List<dynamic>>(
                        future: fetchTransactions(accountnum1),


                        builder: (context, snapshot) {
                          if (snapshot.hasData) {

                            return ListView.builder(

                              itemCount: snapshot.data?.length,
                              itemBuilder: (context, index)
                              {

                                return
                                  Column(children: [

                                  Container( decoration: BoxDecoration(
                                  border: Border.all(width: 1.5, color: Colors.black12),
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.black12,
                                ),
                               child:  Column(
                              children:<Widget> [

                              SizedBox(height: 20,),
                              Container(

                              child: Text('YOUR QUEUEING NUMBER IS'.tr,textAlign: TextAlign.center,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                              ),
                              SizedBox(height: 15,),
                              Container(

                              child: Text('${snapshot.data?[index]['requestid']}',textAlign: TextAlign.center,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold)),
                              ),
                              SizedBox(height: 15,),
                                Divider(height: 5,thickness: 4),
                                SizedBox(height: 15,),
                                Container(

                                child: Text('BRANCH'.tr,textAlign: TextAlign.center,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                                ),
                                SizedBox(height: 10,),
                                Container(

                                child: Text('${snapshot.data?[index]['branch']}',textAlign: TextAlign.center,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                                ),
                                SizedBox(height: 20,),
                              Container(

                              child: Text('DATE & TIME'.tr,textAlign: TextAlign.center,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                              ),
                              SizedBox(height: 10,),
                              Container(

                              child: Text('${snapshot.data?[index]['date']},${snapshot.data?[index]['time']}',textAlign: TextAlign.center,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                              ),
                                SizedBox(height: 20,),
                              /*SizedBox(height: 15,),
                              Divider(height: 5,thickness: 4),
                              SizedBox(height: 15,),
                              TextButton(
                              child: const Text(
                              'Delete appointment',
                              style: TextStyle(
                              fontSize: 17, color: Color(0xff8d0000)),
                              ),
                              onPressed: () {



                              },
                              ),*/
                                ],
                                )),
                                  SizedBox(height: 15,),
                                  ],);



                              },
                            );
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

        ));
  }
}
