import 'package:email_otp/email_otp.dart';
import 'package:face_net_authentication/FaceConstants/constants.dart';
import 'package:face_net_authentication/locator.dart';
import 'package:face_net_authentication/FacePages/db/databse_helper.dart';
import 'package:face_net_authentication/FacePages/sign-in.dart';
import 'package:face_net_authentication/FacePages/sign-up.dart';
import 'package:face_net_authentication/FaceServices/camera.service.dart';
import 'package:face_net_authentication/FaceServices/ml_service.dart';
import 'package:face_net_authentication/FaceServices/face_detector_service.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import '../pages/f1.dart';
import '../pages/otp_screen.dart';

class MyHomePage extends StatefulWidget {
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


  MyHomePage(
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
        required this.password,
        required this.pass2});

  @override
  _MyHomePageState createState() => _MyHomePageState(data: data, name: name, dob1: dob1, nationality: nationality, gender: gender, mart: mart, add: add, emailadd: emailadd, homenum: homenum, mobilenum: mobilenum, jobb: jobb, jobbadd: jobbadd, income: income, type: type, id: id, accountnum1: accountnum1, balance1: balance1, money: money, username: username, password: password,pass2: pass2);
}

class _MyHomePageState extends State<MyHomePage> {

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


  _MyHomePageState(
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
        required this.password,
        required this.pass2});

  MLService _mlService = locator<MLService>();
  FaceDetectorService _mlKitService = locator<FaceDetectorService>();
  CameraService _cameraService = locator<CameraService>();
  bool loading = false;

  @override
  void initState() {
    _loadDarkMode();
    super.initState();
    _initializeServices();
  }

  _initializeServices() async {
    setState(() => loading = true);
    await _cameraService.initialize();
    await _mlService.initialize();
    _mlKitService.initialize();
    setState(() => loading = false);
  }

  void _launchURL() async => await canLaunch(Constants.githubURL)
      ? await launch(Constants.githubURL)
      : throw 'Could not launch ${Constants.githubURL}';


  EmailOTP myauth = EmailOTP();

  bool _isDarkMode = false;



  Future<void> _loadDarkMode() async {
    final prefs = await SharedPreferences.getInstance();
    final bool? isDarkMode = prefs.getBool('isDarkMode') ?? false;
    setState(() {
      _isDarkMode = isDarkMode!;
    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: _isDarkMode ? ThemeData.dark() : ThemeData.light(),
        debugShowCheckedModeBanner: false,
      home: Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new,color: Colors.white,),
          onPressed: ()=>  Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => f1()),
          )

        ),
        backgroundColor:Color(0xff8d0000) ,
        centerTitle: true,
        title: Text ('Authentication'.tr),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(25),
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20, top: 20),
            child: PopupMenuButton<String>(
              child: Icon(
                Icons.more_vert,
                color: Colors.black,
              ),
              onSelected: (value) {
                switch (value) {
                  case 'Clear DB':
                    DatabaseHelper _dataBaseHelper = DatabaseHelper.instance;
                    _dataBaseHelper.deleteAll();
                    break;
                }
              },
              itemBuilder: (BuildContext context) {
                return {'Clear DB'}.map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              },
            ),
          ),
        ],
      ),
      body: !loading
          ?
      Container(
        child: Container(

          decoration: BoxDecoration(
         //   color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: ListView(

            padding: EdgeInsets.only(left: 20,right: 20),
            children: <Widget>[

              SizedBox(height: 40),

              Center(
                child: Text('Choose the authentication type to log-in'.tr,
                  style: TextStyle(fontWeight:FontWeight.bold,fontSize: 17),
                ),
              ),

              SizedBox(height: 40,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  Column(
                    children:<Widget> [
                      Center(

                        child: ElevatedButton(
                          onPressed: (){

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) => SignIn(data: data, name: name, dob1: dob1, nationality: nationality, gender: gender, mart: mart, add: add, emailadd: emailadd, homenum: homenum, mobilenum: mobilenum, jobb: jobb, jobbadd: jobbadd, income: income, type: type, id: id, accountnum1: accountnum1, balance1: balance1, money: money, username: username, password: password,pass2:pass2),
                              ),
                            );

                          },

                          child: Image(image: AssetImage('images/face.png'),height: 90),
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size(120, 120),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                                side: BorderSide(style: BorderStyle.solid,width: 1,color: Colors.black38)

                            ),

                            padding: EdgeInsets.only(left: 0),
                            primary: Colors.white,


                          ),
                        ),

                      ),

                      Container(
                        padding: EdgeInsets.only(top: 10),
                        child: Text('Face id'.tr,style: TextStyle(fontSize:16,fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),



                  SizedBox(width: 17),




                  Column(
                    children:<Widget> [
                      Center(

                        child: ElevatedButton(
                          onPressed: () async {


                            myauth.setConfig(
                                appEmail: "FNB@gmail.com",
                                appName: "Future National Bank",
                                userEmail: emailadd,
                                otpLength: 4,
                                otpType: OTPType.digitsOnly);
                            if (await myauth.sendOTP() == true) {
                              Fluttertoast.showToast(
                                msg: 'otp sent!'.tr,
                                backgroundColor:Color(0xff1e2023),
                                textColor: Colors.white,
                                toastLength: Toast.LENGTH_SHORT,
                              );
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => OtpScreen(myauth: myauth, data: data, name: name, dob1: dob1, nationality: nationality, gender: gender, mart: mart, add: add, emailadd: emailadd, homenum: homenum, mobilenum: mobilenum, jobb: jobb, jobbadd: jobbadd, income: income, type: type, id: id, accountnum1: accountnum1, balance1: balance1, money: money, username: username, password: password,pass2:pass2)

                                  ));
                            } else {
                              Fluttertoast.showToast(
                                msg: 'invalid email!'.tr,
                                backgroundColor:Color(0xff1e2023),
                                textColor: Colors.white,
                                toastLength: Toast.LENGTH_SHORT,
                              );

                            }

                          },

                          child: Image(image: AssetImage('images/otp.png'),height: 90),
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size(120, 120),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                                side: BorderSide(style: BorderStyle.solid,width: 1,color: Colors.black38)

                            ),

                            padding: EdgeInsets.only(left: 0),
                            primary: Colors.white,


                          ),
                        ),

                      ),

                      Container(
                        padding: EdgeInsets.only(top: 10),
                        child: Text('OTP'.tr,style: TextStyle(fontSize:16,fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),

                ],
              ),


              /*   Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) => SignIn(),
                                ),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                    color: Colors.blue.withOpacity(0.1),
                                    blurRadius: 1,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(
                                  vertical: 14, horizontal: 16),
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'LOGIN',
                                    style: TextStyle(color: Color(0xFF0F0BDB)),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(Icons.login, color: Color(0xFF0F0BDB))
                                ],
                              ),
                            ),
                          ),

                          SizedBox(
                            height: 20,
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: Divider(
                              thickness: 2,
                            ),
                          ),
                         *//* InkWell(
                            onTap: _launchURL,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.black,
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                    color: Colors.blue.withOpacity(0.1),
                                    blurRadius: 1,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(
                                  vertical: 14, horizontal: 16),
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'CONTRIBUTE',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  FaIcon(
                                    FontAwesomeIcons.github,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                            ),
                          ),*//*
                        ],
                      )
*/
            ],),),)
          : Center(
              child: CircularProgressIndicator(),
            ),
      bottomSheet: Container(
        height: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('If you dont save your face id',style: TextStyle(fontSize: 15),),
            TextButton(
              child: const Text(
                'Try it now!',
                style: TextStyle(
                    fontSize: 16, color: Color(0xff8d0000)),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => SignUp(data: data, name: name, dob1: dob1, nationality: nationality, gender: gender, mart: mart, add: add, emailadd: emailadd, homenum: homenum, mobilenum: mobilenum, jobb: jobb, jobbadd: jobbadd, income: income, type: type, id: id, accountnum1: accountnum1, balance1: balance1, money: money, username: username, password: password, pass2:pass2),
                  ),
                );

              },
            )

          ],
        ),
      ),
      ) );
  }
}
