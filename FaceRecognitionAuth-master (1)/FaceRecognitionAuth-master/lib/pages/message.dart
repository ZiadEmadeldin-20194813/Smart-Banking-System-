import 'dart:collection';
import 'dart:convert';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart'as http;
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:highlight_text/highlight_text.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:csv/csv.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class SpeechToTextScreen extends StatefulWidget {
  @override
  _SpeechToTextScreenState createState() => _SpeechToTextScreenState();
}

class _SpeechToTextScreenState extends State<SpeechToTextScreen> {
  DateTime date1 = DateTime.now();
  Future<Null> selectinDate(BuildContext context) async {
    final DateTime? picked =await showDatePicker(
      context:context,
      initialDate: date1,
      firstDate: DateTime(1960),
      lastDate: DateTime(2040),
    );
    if(picked != null && picked != date1) {
      setState(() {
        date1 = picked;
        print(date1.toString());
      });
    }
  }

  TimeOfDay time1 = TimeOfDay.now();
  Future<Null> selectTime(BuildContext context)async {
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
  var isListening = false;

  @override
  void dispose() {
    message.dispose();
    super.dispose();
  }

  var dataset = <List<dynamic>>[];
  var dataTable = <String, String>{};

  bool _isDarkMode = false;


  Future<void> _loadDarkMode() async {
    final prefs = await SharedPreferences.getInstance();
    final bool? isDarkMode = prefs.getBool('isDarkMode') ?? false;
    setState(() {
      _isDarkMode = isDarkMode!;
    });
  }


  @override
  void initState() {
    _loadDarkMode();
    super.initState();
    loadCsvFromAsset('assets/bank.csv').then((data) {
      setState(() {
        dataset = data;

        // Build hash table for fast search
        for (int i = 1; i < dataset.length; i++) {
          dataTable[dataset[i][0]] = dataset[i][1];
        }
      });
    });
  }

  final FlutterTts flutterTts = FlutterTts();
  Future<List<List<dynamic>>> loadCsvFromAsset(String path) async {
    String data = await rootBundle.loadString(path);
    List<List<dynamic>> csvTable = CsvToListConverter().convert(data);
    return csvTable;
  }

  String getUserInput() {
    return message.text; // assuming message isa TextEditingController
  }

  String? searchForAnswer(String userInput) {
    if (dataTable.containsKey(userInput)) {
      return dataTable[userInput];
    } else {
      // Calculate accuracy of all questions in the CSV file
      var highestAccuracy = 0.0;
      var bestMatch = '';
      for (int i = 1; i < dataset.length; i++) {
        var question = dataset[i][0];
        var answer = dataset[i][1];
        var accuracy = calculateAccuracy(question, userInput);
        if (accuracy > highestAccuracy) {
          highestAccuracy = accuracy;
          bestMatch = answer;
        }
      }

      // Return best match if accuracy is above a certain threshold
      if (highestAccuracy > 0.7) {
        return bestMatch;
      } else {
        return 'Sorry, I could not understand your question.';
      }
    }
  }

  double calculateAccuracy(String question, String userInput) {
    var commonWords = 0;
    var questionWords = question.split(' ');
    var userWords = userInput.split(' ');
    for (var word in questionWords) {
      if (userWords.contains(word)) {
        commonWords += 1;
      }
    }
    return commonWords / questionWords.length;
  }
  List<Message> messages = [];
  List<TextSpan> highlight(String source, String userInput) {
    var textSpans = <TextSpan>[
      TextSpan(
        text: source,
        style: TextStyle(fontSize: 18, color: Colors.black),
      ),
    ];
    return textSpans;
  }

  String response = '';

  @override
  Widget build(BuildContext context) {
    var date="${date1.year} - ${date1.month} - ${date1.day}".toString();
    var time="${time1.hour} - ${time1.minute}".toString();
   // return MaterialApp(

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
        title: Text('FNB bot'),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(25),
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(height: 5,),
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (BuildContext context, int index) {
                var message = messages[index];
                if (message.isBotResponse) {
                  return _buildBotMessage(message.text);
                } else {
                  return _buildUserMessage(message.text);
                }
              },
            ),
          ),
          _buildMessageInput(),
        ],
      ),
    ));
  }

  Widget _buildBotMessage(String text) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.symmetric(vertical: 0, horizontal: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.7,
                  ),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color(0xff8d0000),
                  ),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText(
                        text,
                        textStyle: TextStyle(fontSize: 15, color: Colors.white),
                        speed: const Duration(milliseconds: 100),
                      ),
                    ],
                    //pause: const Duration(milliseconds: 500),
                    displayFullTextOnTap: true,
                    //stopPauseOnTap: true,
                    isRepeatingAnimation: false,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: Icon(Icons.volume_up),
            color: Color(0xff8d0000),
            onPressed: () async {
              await flutterTts.speak(text);
            },
          ),
        ],
      ),
    );
  }
  Widget _buildUserMessage(String text) {
    return Container(
      alignment: Alignment.centerRight,
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        color: Colors.grey[400],
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Text(
            text,
            style: TextStyle(fontSize: 15, color: Colors.black),
          ),
        ),
      ),
    );
  }

  Widget _buildMessageInput() {
    return Container(
     // color: Colors.white,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 10, bottom: 5,top: 5),
              child: TextFormField(
                controller: message,
                textAlign: TextAlign.start,
                cursorColor: Colors.black,
                style: TextStyle(fontSize: 14, color: Colors.black),
                decoration: InputDecoration(
                  hintText:
                  'Type or voice your question here...',
                  hintStyle:
                  TextStyle(fontSize: 14, color: Colors.grey[500]),
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide(color:Colors.black,width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
            ),
          ),
          AvatarGlow(
            endRadius: 30,
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
                child: Icon(
                  Icons.mic,
                  size: 25,
                  color: Color(0xff8d0000),
                ),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            color: Color(0xff8d0000),
            onPressed: () async {
              var userInput = getUserInput();
              if (userInput.isNotEmpty) {
                var botResponse = searchForAnswer(userInput);
                setState(() {
                  messages.add(Message(userInput, false));
                  messages.add(Message(botResponse!, true));
                });

                // Reset message text field
                message.clear();
              } else {
                Fluttertoast.showToast(
                  msg: "Please enter a message",
                  backgroundColor: Colors.grey[400],
                  textColor: Colors.white,
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

  class Message {
  final String text;
  final bool isBotResponse;

  Message(this.text, this.isBotResponse);
  }

