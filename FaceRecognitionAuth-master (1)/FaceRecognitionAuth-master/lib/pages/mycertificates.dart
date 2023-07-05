import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../crypto/crypto.dart';


class mycertificates extends StatefulWidget {


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


  mycertificates(
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
  State<mycertificates> createState() => _mycertificatesState(data: data, name: name, dob1: dob1, nationality: nationality, gender: gender, mart: mart, add: add, emailadd: emailadd, homenum: homenum, mobilenum: mobilenum, jobb: jobb, jobbadd: jobbadd, income: income, type: type, id: id, accountnum1: accountnum1, balance1: balance1, money: money, username: username, password: password);
}

class _mycertificatesState extends State<mycertificates> {


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

  _mycertificatesState(
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
    final key = "2f7b4e8d71c4a00f2a3f4c175a8a4e6c";
    final aes = Aes(key);

    final encAcc = base64Encode(aes.encrypt(Uint8List.fromList(utf8.encode(accountnum1))));
    final response = await http.get(Uri.parse('https://inconspicuous-pairs.000webhostapp.com/getCertificateDataMobile.php?accountnumber=$encAcc'));


    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON.
      return jsonDecode(response.body);

    } else {
      // If the server returns an error response, throw an exception.
      throw Exception('Failed to load transactions');
    }
  }

  var status='';
  Color pending = Color(0xFFFFF000);
  Color approved = Color(0xFF00C511);
  Color denied = Color(0xFFF30000);

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
              title: Text ('My certificates'.tr),
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

                      SizedBox( height:  MediaQuery.of(context).size.height - 120,
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
                                  if(transaction['status']=='Approved'){
                                    status='Approved';
                                    st = approved;
                                  }
                                  else if (transaction['status']=='Denied')
                                  {
                                    status='Denied';
                                    st = denied;
                                  }
                                  else
                                  {
                                    status='Pending';
                                    st = pending;
                                  }


                                  return Column(children: [


                                     Container(


                                    height: 200,
                                    width: 350,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(15)),
                                      gradient: LinearGradient(
                                        begin:Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: [
                                          Color(0xff919191),
                                          Color(0xff676767),
                                        ],
                                      ),
                                    ),
                                    child:
                                    Column(children: [
                                      SizedBox(height: 10,),
                                      Row(
                                        mainAxisAlignment:MainAxisAlignment.spaceBetween ,
                                        children:<Widget> [

                                        Container(child: Text('   Certificate id: ${snapshot.data?[index]['certid']}',style:TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white),)),
                                        Container(

                                          child:Image(image: AssetImage('images/fnb1.png'),height: 60,width: 80),
                                        ),
                                      ],
                                      ),
                                      Row(children:<Widget> [
                                        Container(
                                          margin: EdgeInsets.only(left: 10),
                                          child:Text('${snapshot.data?[index]['certtype']}',style: TextStyle(fontSize: 17,color: Colors.white,fontWeight: FontWeight.bold)),
                                        ),
                                      ],
                                      ),
                                      SizedBox(height: 5,),
                                      Row(children:<Widget> [
                                        Container(
                                          margin: EdgeInsets.only(left: 10),
                                          child:Text('Amount: ${snapshot.data?[index]['certamount']} $money',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white)),
                                        ),
                                      ],
                                      ),
                                      SizedBox(height: 5,),
                                      Row(children:<Widget> [
                                        Container(
                                          margin: EdgeInsets.only(left: 10),
                                          child:Text('Date: ${snapshot.data?[index]['certdate']}',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white)),
                                        ),
                                      ],
                                      ),
                                      SizedBox(height: 5,),
                                      Row(
                                        children: [
                                          Container(
                                              margin: EdgeInsets.only(left: 10),
                                            child: Text('Status:',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white))
                                          ),
                                          Container(
                                            child: Text('$status',style: TextStyle(fontSize: 17,color: st,fontWeight: FontWeight.bold)),padding: EdgeInsets.only(left: 5),
                                          ),
                                        ],
                                      ),
                                    ]),

                                  ),
                                  SizedBox(height: 20,),
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
                        ),),

                    ],),),
              ],
            ),
          bottomSheet: Container(
            height: 35,
            child:Center( child: Text('If your certificate status is ACCEPTED please visit your nearest branch as soon as possible to confirm informations'.tr,style: TextStyle(fontSize: 11.5,fontWeight: FontWeight.bold,color: Color(
                0xff00640b)),textAlign: TextAlign.center),),
          ),


        )
    );
  }
}
