import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../pages/receipt.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart'as http;



class queue extends StatefulWidget {
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


  queue(
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
  State<queue> createState() => _queueState(data: data, name: name, dob1: dob1, nationality: nationality, gender: gender, mart: mart, add: add, emailadd: emailadd, homenum: homenum, mobilenum: mobilenum, jobb: jobb, jobbadd: jobbadd, income: income, type: type, id: id, accountnum1: accountnum1, balance1: balance1, money: money, username: username, password: password);
}

class _queueState extends State<queue> {



  String dropdown = 'Fue';
  var items = ['Fue','Tahrir','Mohy eldeen','Helwan','El obour','Cairo mall','Cairo festival','October city'];

  String dropdown1 = 'Deposit';
  var items1 = ['Deposit','Withdraw','Get card','Other purpose'];



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


  _queueState(
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




  Future SendData(var date,var time) async {

    var url = Uri.parse('https://inconspicuous-pairs.000webhostapp.com/request.php') ;

    Random random = new Random();
    int num1 = random.nextInt(7) + 9;
    int num2 = random.nextInt(60); // generates random minute between 0 and 59
    var reqTime = "$num1:${num2.toString().padLeft(2, '0')}";


    final response = await http.post(url, body:{


      "branch":dropdown,
      "date":date,
      "time":reqTime,
      "purpose":dropdown1,
      "accountnumber":accountnum1,

    });
    try {
      var data = json.decode(response.body);
      print(data);
      if (data == "Error") {
      }
      else if (data == "Success") {
        setState(() {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => receipt(data: data, name: name, dob1: dob1, nationality: nationality, gender: gender, mart: mart, add: add, emailadd: emailadd, homenum: homenum, mobilenum: mobilenum, jobb: jobb, jobbadd: jobbadd, income: income, type: type, id: id, accountnum1: accountnum1, balance1: balance1, money: money, username: username, password: password),
              ));

        });
      }
      if (data == "Already Exists") {
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



    Color _getColor(bool isDarkMode) {
      return isDarkMode ? Colors.transparent : Colors.white;
    }

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

              padding: EdgeInsets.only(left: 0,right: 0),
              children: <Widget>[

          Column(
            children: <Widget>[
              SizedBox(height: 40),
              Center(child: Text('Book an appointment'.tr,style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),)),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:<Widget> [
                  Container(
                    padding: EdgeInsets.only(left: 15),
                    child: Text('Choose your nearest\nbranch'.tr,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                  ),

                  Container(
                    padding: EdgeInsets.only(right: 15),
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
                thickness: 1.5,
                height: 0,
                color: Colors.black,
                indent: 15,
                endIndent:15,
              ),
              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:<Widget> [

                  Container(
                    padding: EdgeInsets.only(left: 15),
                    child:Text('Book date'.tr,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),),

                  Row(children: [
                    Container( child: IconButton(onPressed: () {selectinDate(context);}, icon: Icon(Icons.date_range)),),
                    Container(padding:EdgeInsets.only(right: 15),child: Text(('${date1.year} - ${date1.month} - ${date1.day}').toString(),style: TextStyle(fontSize: 16),),)

                  ]),

                ],
              ),

              SizedBox(height: 15,),

              Divider
                (
                thickness: 1.5,
                height: 0,
                color: Colors.black,
                indent: 15,
                endIndent:15,
              ),

              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:<Widget> [
                  Container(
                    padding: EdgeInsets.only(left: 15),
                    child: Text('Select the purpose'.tr,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                  ),

                  Container(
                    padding: EdgeInsets.only(right: 15),
                    child: DropdownButton(
                      value: dropdown1,
                      borderRadius: BorderRadius.circular(15),
                      icon: const Icon(Icons.arrow_drop_down_sharp),
                      items: items1.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      onChanged: (String? newvalue1){
                        setState(() {
                          dropdown1 = newvalue1!;
                        });
                      },

                    ),


                  )
                ],
              ),
              SizedBox(height: 20),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  TextButton(
                    child:Text(
                      'My receipt'.tr,
                      style: TextStyle(
                          fontSize: 17, color: Color(0xff8d0000),decoration: TextDecoration.underline),
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder:
                          (context)=> receipt(data: data, name: name, dob1: dob1, nationality: nationality, gender: gender, mart: mart, add: add, emailadd: emailadd, homenum: homenum, mobilenum: mobilenum, jobb: jobb, jobbadd: jobbadd, income: income, type: type, id: id, accountnum1: accountnum1, balance1: balance1, money: money, username: username, password: password)),
                      );
                    },
                  ),
                ],
              ),

              SizedBox(height: 160),
              Container(
                  margin: EdgeInsets.symmetric(vertical: 12),
                  width: size.width * 0.9,
                  child: ClipRRect(
                    child: SizedBox(height: 50, child:  ElevatedButton(
                      // padding: EdgeInsets.symmetric(vertical: 18,horizontal: 38),
                      // color: Colors.deepOrange,
                      onPressed: () {
                        SendData(date, time);

                    /*    Navigator.push(context, MaterialPageRoute(builder:
                            (context)=> receipt(data: data, name: name, dob1: dob1, nationality: nationality, gender: gender, mart: mart, add: add, emailadd: emailadd, homenum: homenum, mobilenum: mobilenum, jobb: jobb, jobbadd: jobbadd, income: income, type: type, id: id, accountnum1: accountnum1, balance1: balance1, money: money, username: username, password: password)),
                        );*/
                      },
                      child: Text(
                        'Book'.tr,
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
