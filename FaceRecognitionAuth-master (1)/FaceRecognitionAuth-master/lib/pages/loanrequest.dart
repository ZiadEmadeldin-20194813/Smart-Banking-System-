import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:shared_preferences/shared_preferences.dart';


class loanrequest extends StatefulWidget {


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


  loanrequest(
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
  State<loanrequest> createState() => _loanrequestState(data: data, name: name, dob1: dob1, nationality: nationality, gender: gender, mart: mart, add: add, emailadd: emailadd, homenum: homenum, mobilenum: mobilenum, jobb: jobb, jobbadd: jobbadd, income: income, type: type, id: id, accountnum1: accountnum1, balance1: balance1, money: money, username: username, password: password);
}

class _loanrequestState extends State<loanrequest> {


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

  var loanid;
  var amount;
  var rate;
  var period;
  var totalinterest;
  var monthly;
  var totalpayable;
  var accountnumber;
  var loanstatus;

  _loanrequestState(
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
    final response = await http.get(Uri.parse('https://inconspicuous-pairs.000webhostapp.com/myLoansRequests.php?accountnumber=$accountnum1'));


    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON.
      return jsonDecode(response.body);

    } else {
      // If the server returns an error response, throw an exception.
      throw Exception('Failed to load transactions');
    }
  }

var status='';
  Color pending = Color(0xFFE0D300);
  Color approved = Color(0xFF00640B);
  Color denied = Color(0xFF8D0000);

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
            title: Text ('My loans requests'.tr),
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

                    SizedBox( height:  MediaQuery.of(context).size.height - 150, //500
                      child:
                      FutureBuilder<List<dynamic>>(
                        future: fetchTransactions(accountnum1),



                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            Color st;
                            return ListView.builder(

                              itemCount: snapshot.data?.length,
                              itemBuilder: (context, index)
                              {
                                dynamic transaction = snapshot.data?[index];
                                if(transaction['loanstatus']=='Approved'){
                                  status='Approved'.tr;
                                   st = approved;

                                }
                                else if (transaction['loanstatus']=='Denied')
                                  {
                                    status='Denied'.tr;
                                     st = denied;
                                  }
                                else
                                  {
                                    status='Pending'.tr;
                                     st = pending;
                                  }


                                return  Column(
                                  children: [

                                    Container(
                                      padding: EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 5),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(width: 1.5, color: Color(
                                              0xff000000)),
                                          borderRadius: BorderRadius.circular(5),
                                        //  color:Colors.white,
                                        ),
                                        child: Column(
                                          children:<Widget> [


                                            SizedBox(height: 10,),

                                                Center(
                                                  child: Text('Loan id: ${snapshot.data?[index]['loanid']}',style: TextStyle(fontSize: 17,),textAlign: TextAlign.center),
                                                ),

                                            SizedBox(height: 5,),
                                            Divider(thickness: 4,height: 2,),
                                            SizedBox(height: 5,),

                                            Row(
                                              children: [
                                                Container(
                                                  child: Text('Amount:'.tr+
                                                      ' ${snapshot.data?[index]['amount']} $money',style: TextStyle(fontSize: 17,)),padding: EdgeInsets.only(left: 5),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 10,),

                                            Row(
                                              children: [
                                                Container(
                                                  child: Text('Period:'.tr+
                                                      ' ${snapshot.data?[index]['period']}'
                                                         + ' months'.tr,style: TextStyle(fontSize: 17,)),padding: EdgeInsets.only(left: 5),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 10,),

                                            Row(
                                              children: [
                                                Container(
                                                  child: Text('Rate:'.tr
                                                      +' ${snapshot.data?[index]['rate']}%',style: TextStyle(fontSize: 17,)),padding: EdgeInsets.only(left: 5),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 10,),

                                            Row(
                                              children: [
                                                Container(
                                                  child: Text('Total interest:'.tr
                                                      +' ${snapshot.data?[index]['totalinterest']} $money',style: TextStyle(fontSize: 17,)),padding: EdgeInsets.only(left: 5),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 10,),

                                            Row(
                                              children: [
                                                Container(
                                                  child: Text('Total payable:'.tr
                                                      +' ${snapshot.data?[index]['totalpayable']} $money',style: TextStyle(fontSize: 17,)),padding: EdgeInsets.only(left: 5),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 10,),

                                            Row(
                                              children: [
                                                Container(
                                                  child: Text('Monthly payment: ${snapshot.data?[index]['monthly']} $money',style: TextStyle(fontSize: 17,)),padding: EdgeInsets.only(left: 5),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 10,),

                                            Row(
                                              children: [
                                                Container(
                                                  child: Text('Guarantee(s): ${snapshot.data?[index]['guarantee']}',style: TextStyle(fontSize: 17,)),padding: EdgeInsets.only(left: 5),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 10,),
                                            Row(
                                              children: [
                                                Container(
                                                  child: Text('Status:',style: TextStyle(fontSize: 17,)),padding: EdgeInsets.only(left: 5),
                                                ),
                                                Container(
                                                  child: Text('$status',style: TextStyle(fontSize: 18,color: st,fontWeight: FontWeight.bold)),padding: EdgeInsets.only(left: 5),
                                                ),
                                              ],
                                            ),

                                            SizedBox(height: 10,),


                                          ],
                                        ),
                                      ),


                                    ),],);


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
                      ),),

                  ],),),
            ],
          ),
          bottomSheet: Container(
            height: 35,
            child: Center( child: Text('If your loan status is ACCEPTED please visit your nearest branch as soon as possible to confirm your loan informations'.tr,style: TextStyle(fontSize: 11.5,fontWeight: FontWeight.bold,color: Color(
                0xff00640b)),textAlign: TextAlign.center),),
          ),



        )
    );
  }
}
