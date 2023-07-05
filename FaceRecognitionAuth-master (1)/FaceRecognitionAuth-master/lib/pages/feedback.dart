import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart'as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:flutter_tts/flutter_tts.dart';

class feedback extends StatefulWidget {
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

  feedback({
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

  @override
  _feedbackState createState() => _feedbackState(
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

class _feedbackState extends State<feedback> {
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

  _feedbackState({
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

  DateTime date1 = DateTime.now();
  Future<Null> selectinDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: date1,
      firstDate: DateTime(1960),
      lastDate: DateTime(2040),
    );
    if (picked != null && picked != date1) {
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

  final message = TextEditingController();
  SpeechToText speechToText = SpeechToText();
  FlutterTts flutterTts = FlutterTts();
  var isListening = false;

  @override
  void dispose() {
    message.dispose();
    super.dispose();
  }

  bool _isDarkMode = false;

  Future<void> _loadDarkMode() async {
    final prefs = await SharedPreferences.getInstance();
    final bool? isDarkMode = prefs.getBool('isDarkMode') ?? false;
    setState(() {
      _isDarkMode = isDarkMode!;
    });
  }

  Future SendData(var date, var time) async {
    var url = Uri.parse('https://inconspicuous-pairs.000webhostapp.com/addfeedback.php');

    final response = await http.post(url, body: {
      "complement": message.text,
      "Date": date,
      "Time": time,
      "mobile": mobilenum,
      "accountnumber": accountnum1,
    });
    try {
      var data = json.decode(response.body);
      print(data);
      if (data == "Error") {
      } else if (data == "Success") {
        setState(() {});
      }
      if (data == "Already Exists") {
        print('error');
      } else {
        Fluttertoast.showToast(
          msg: 'Something is error, please try again later',
          backgroundColor: Color(0xff1e2023),
          textColor: Colors.white,
          toastLength: Toast.LENGTH_SHORT,
        );
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var date = "${date1.day}/${date1.month}/${date1.year}".toString();
    var time = "${time1.hour}:${time1.minute}".toString();

    Color _getColor(bool isDarkMode) {
      return isDarkMode ? Colors.transparent : Colors.white;
    }

    return MaterialApp(
      theme: _isDarkMode ? ThemeData.dark() : ThemeData.light(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new, color: Colors.white),
            onPressed: () => Navigator.pop(context, true),
          ),
          backgroundColor: Color(0xff8d0000),
          centerTitle: true,
          title: Text('Feedback'),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(25),
            ),
          ),
        ),
        body: ListView(
          children: [
            Column(
              children: <Widget>[
                SizedBox(height: 10),
                Container(
                  margin: EdgeInsets.all(20),
                  child: Text(
                    'We value your opinion and would love to hear about your experience with us. Please feel free to share your thoughts and suggestions with us on how we can serve you better. We appreciate your time and look forward to hearing from you.',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  child: TextFormField(
                    controller: message,
                    textAlign: TextAlign.start,
                    maxLines: 5,
                    cursorColor: Colors.black,
                    style: TextStyle(fontSize: 18, color: Colors.black),
                    decoration: InputDecoration(
                      hintText: 'Please type/voice your feedback.',
                      hintStyle: TextStyle(fontSize: 16, color: Colors.grey[500]),
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey[400]!),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 20),
                      padding: EdgeInsets.all(7),
                      decoration: BoxDecoration(
                        color: Colors.grey[400],
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: IconButton(
                        icon: Icon(Icons.delete_outline),
                        color: Color(0xff8d0000),
                        onPressed: () {
                          setState(() {
                            message.clear();
                          });
                        },
                      ),
                    ),
                    AvatarGlow(
                      endRadius: 75,
                      animate: isListening,
                      duration: Duration(milliseconds: 2000),
                      glowColor: Color(0xffde5555),
                      repeat: true,
                      repeatPauseDuration: Duration(milliseconds: 100),
                      showTwoGlows: true,
                      child: GestureDetector(
                        onTapDown: (details) async {
                          if (!isListening) {
                            var available = await speechToText.initialize();
                            if (available) {
                              setState(() {
                                isListening = true;
                                speechToText.listen(
                                  onResult: (result) {
                                    setState(() {
                                      message.text = result.recognizedWords;
                                    });
                                  },
                                  localeId: 'ar', // Set localeId to Arabic
                                );
                              });
                            } else {
                              Fluttertoast.showToast(
                                msg: "Speech to text not available",
                                backgroundColor: Colors.grey[400],
                                textColor: Colors.white,
                              );
                            }
                          }
                        },
                        onTapUp: (details) {
                          setState(() {
                            isListening = false;
                            speechToText.stop();
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: Colors.grey[400],
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.mic,
                            size: 40,
                            color: Color(0xff8d0000),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 20),
                      padding: EdgeInsets.all(7),
                      decoration: BoxDecoration(
                        color: Colors.grey[400],
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: IconButton(
                        icon: Icon(Icons.send),
                        color: Color(0xff8d0000),
                        onPressed: () async {
                          SendData(date, time);
                          Fluttertoast.showToast(
                            msg: 'Your feedback uploaded successfully',
                            backgroundColor: Color(0xff1e2023),
                            textColor: Colors.white,
                            toastLength: Toast.LENGTH_SHORT,
                          );
                          setState(() {
                            message.clear();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}