import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/api_client.dart';
import '../widgets/drop_down.dart';
import 'package:currency_picker/currency_picker.dart';



class currencyConverter extends StatefulWidget {
  const currencyConverter({Key? key}) : super(key: key);
  @override
  State<currencyConverter> createState() => _currencyConverterState();
}

class _currencyConverterState extends State<currencyConverter> {

  ApiClient client = ApiClient();


  Color secColor = Color(0xFF8D0000);
  List<String> currencies = [];
  String from="";
  String to="";
  double rate=0;
  String result="";




  Future<List<String>> getCurrencyList() async {
    return await client.getCurrencies();
  }

  @override
  void initState() {
    // TODO: implement initState
    _loadDarkMode();
    super.initState();
    (() async{
      List<String> list =await client.getCurrencies();
      setState(() {
        currencies = list;
      });
    })();
  }


  var _index = 1;
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
      appBar: AppBar (

        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new,color: Colors.white,),
          onPressed: ()=> Navigator.pop(context),

        ),
        backgroundColor:Color(0xff8d0000) ,
        centerTitle: true,
        title: Text ('Currencies'.tr),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(25),
          ),
        ),

      ),

      body: SafeArea(

        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 5.0),
          child: SizedBox(height: 480,

            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10,),
                Center(

                  child: Text("Currency Converter".tr,style: TextStyle(color: Colors.black,
                      fontSize: 22,fontWeight: FontWeight.bold)),
                ),
                Expanded(child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      TextField(
                        onSubmitted: (value) async{
                          rate = await client.getRate(from, to);

                          setState(() {
                            result =
                                (rate * double.parse(value)).toStringAsFixed(3);

                          });

                        },
                        decoration:InputDecoration(
                            focusedBorder: new OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black,width: 1.5)
                            ),
                            border:OutlineInputBorder(gapPadding:2,),
                            filled: true,
                            fillColor: Colors.white,
                            labelText: "Input Value to Convert".tr,
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 18.0,color: Colors.black,

                            )),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget> [
                          Column(children:<Widget> [
                            Container(
                              child: Text("From".tr,style: TextStyle(color: Colors.black,fontSize: 16,)),
                            ),

                            Container(

                              child: customDropDown(currencies,from,(val){
                                setState(() {
                                  from = val;
                                });
                              }),
                            ),


                          ],),

                          FloatingActionButton(
                            onPressed: (){
                              String temp = from;
                              setState(() {
                                from=to;
                                to=temp;
                              });
                            },

                            child: Icon(Icons.swap_horiz),
                            elevation: 0.0,
                            backgroundColor: secColor,
                          ),


                          Column(children:<Widget> [
                            Container(child: Text("To".tr,style: TextStyle(color: Colors.black,fontSize: 16,)),
                            ),

                            Container(child: customDropDown(currencies, to, (val) {
                              setState(() {
                                to = val;
                              });
                            }),),

                          ],)



                        ],
                      ),


                      SizedBox(height: 20,),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.black,width: 1.5),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Column(
                          children: [
                            Text("Result".tr,style: TextStyle(
                              color: secColor,
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            ),),
                            Text(result,style: TextStyle(
                              color: secColor,
                              fontSize: 36.0,
                              fontWeight: FontWeight.bold,
                            )),
                          ],
                        ),
                      ),
                    ],
                  ),



                )),



              ],

            ),
          )



        ),
      ),




), );
  }
}
