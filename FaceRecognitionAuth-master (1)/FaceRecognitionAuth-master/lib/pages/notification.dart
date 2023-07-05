import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:badges/badges.dart';
import 'package:shared_preferences/shared_preferences.dart';

class notification extends StatefulWidget {
  /* final int notificationCount;
  final Function(int) updateNotificationCount;*/
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

  notification({
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
    /*  required this.notificationCount,
        required this.updateNotificationCount,*/
  });

  @override
  State<notification> createState() => _notificationState(
    data: data,
    name: name,
    dob1: dob1,
    nationality: nationality,
    gender: gender,
    mart: mart,
    add: add,
    emailadd: emailadd,
    homenum: homenum,
    mobilenum: mobilenum,
    jobb: jobb,
    jobbadd: jobbadd,
    income: income,
    type: type,
    id: id,
    accountnum1: accountnum1,
    balance1: balance1,
    money: money,
    username: username,
    password: password,
  );
}

class _notificationState extends State<notification> {
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

  _notificationState({
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
  });

  late List<dynamic> _notifications = [];
  bool _isDarkMode = false;
  FlutterTts _flutterTts = FlutterTts();

  @override
  void initState() {
    _loadDarkMode();
    _fetchNotifications();
    super.initState();
  }

  Future<void> _loadDarkMode() async {
    final prefs = await SharedPreferences.getInstance();
    final bool? isDarkMode = prefs.getBool('isDarkMode') ?? false;
    setState(() {
      _isDarkMode = isDarkMode!;
    });
  }

  Future<void> _fetchNotifications() async {
    final response = await http.get(Uri.parse(
        'https://inconspicuous-pairs.000webhostapp.com/getNotification.php?accountnumber=$accountnum1'));

    if (response.statusCode == 200) {
      setState(() {
        _notifications = jsonDecode(response.body);
      });
    } else {
      throw Exception('Failed to load transactions');
    }
  }

  Future<void> _speak(String text) async {
    final isArabic = RegExp(r'[^\u0000-\u007F]').hasMatch(text); // Check if the text contains non-ASCII characters (Arabic characters)

    await _flutterTts.setVolume(1);
    if (isArabic) {
      // Set Arabic language for TTS engine
      await _flutterTts.setLanguage('ar');
    } else {
      // Set default language for TTS engine
      await _flutterTts.setLanguage('en');
    }

    await _flutterTts.speak(text);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return MaterialApp(
      theme: _isDarkMode ? ThemeData.dark() : ThemeData.light(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            ),
            onPressed: () => Navigator.pop(context, true),
          ),
          backgroundColor: Color(0xff8d0000),
          centerTitle: true,
          title: Text('Notifications'.tr),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(25),
            ),
          ),
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 10),
                  SizedBox(
                    height: size.height * 0.8,
                    child: _notifications == null
                        ? Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 4,
                        color: Color(0xff8d0000),
                      ),
                    )
                        : ListView.builder(
                      itemCount: _notifications.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Container(
                              padding: EdgeInsets.only(
                                  left: 10, right: 10, top: 0, bottom: 5),
                              child: Container(
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      children: [
                                        Container(
                                          child: Icon(
                                            Icons.notification_important,
                                            color: Color(0xffffc200),
                                            size: 21,
                                          ),
                                        ),
                                        Container(
                                          child: Text(
                                            '${_notifications[index]['type']}'.tr,
                                            style: TextStyle(
                                                fontSize: 17.5,
                                                fontWeight:
                                                FontWeight.bold),
                                          ),
                                          padding:
                                          EdgeInsets.only(left: 5),
                                        ),
                                        IconButton(
                                          icon: Icon(Icons.volume_up),
                                          onPressed: () {
                                            _speak(
                                                '${_notifications[index]['message']}'.tr);
                                          },
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      child: Text(
                                        '${_notifications[index]['message']}'.tr,
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                        softWrap: true,
                                      ),
                                      padding:
                                      EdgeInsets.only(left: 5),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Divider(
                                      height: 5,
                                      thickness: 2,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}