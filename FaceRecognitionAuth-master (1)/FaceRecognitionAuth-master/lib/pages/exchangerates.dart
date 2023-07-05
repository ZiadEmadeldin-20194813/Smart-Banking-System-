import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/api_client.dart';
import '../widgets/drop_down.dart';
import 'package:currency_picker/currency_picker.dart';

class exchangerates extends StatefulWidget {
  const exchangerates({Key? key}) : super(key: key);

  @override
  State<exchangerates> createState() => _exchangeratesState();
}

class _exchangeratesState extends State<exchangerates> {


  ApiClient client = ApiClient();


  Color secColor = Color(0xFF8D0000);
  List<String> currencies = [];

  String from="EGP";

  String to1="USD";
  String to2="EUR";
  String to3="AUD";
  String to4="QAR";
  String to5="TRY";
  String to6="YER";
  String to7="SAR";
  String to8="CNY";
  String to9="BRL";
  String to10="INR";
  String to11="CAD";
  String to12="OMR";
  String to13="RUB";
  String to14="GBP";
  String to15="ZAR";
  String to16="GHS";

  double rate1=0;
  double rate2=0;
  double rate3=0;
  double rate4=0;
  double rate5=0;
  double rate6=0;
  double rate7=0;
  double rate8=0;
  double rate9=0;
  double rate10=0;
  double rate11=0;
  double rate12=0;
  double rate13=0;
  double rate14=0;
  double rate15=0;
  double rate16=0;

  String result1b="";
  String result1s="";
  String result2b="";
  String result2s="";
  String result3b="";
  String result3s="";
  String result4b="";
  String result4s="";
  String result5b="";
  String result5s="";
  String result6b="";
  String result6s="";
  String result7b="";
  String result7s="";
  String result8b="";
  String result8s="";
  String result9b="";
  String result9s="";
  String result10b="";
  String result10s="";
  String result11b="";
  String result11s="";
  String result12b="";
  String result12s="";
  String result13b="";
  String result13s="";
  String result14b="";
  String result14s="";
  String result15b="";
  String result15s="";
  String result16b="";
  String result16s="";

  double brate=0.025;



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


          child:ListView(
            children:<Widget> [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 30,),
                  Center(

                    child: Text("Egyptian pound exchange".tr,style: TextStyle(color: Color(0xff8d0000),
                        fontSize: 20,fontWeight: FontWeight.bold)),
                  ),

                  SizedBox(height: 30,),

                  Container(
                    padding: EdgeInsets.only(left: 40,right: 40),
                    child:TextField(
                    onSubmitted: (value) async{
                      rate1 = await client.getRate(from, to1);
                      rate2 = await client.getRate(from, to2);
                      rate3 = await client.getRate(from, to3);
                      rate4 = await client.getRate(from, to4);
                      rate5 = await client.getRate(from, to5);
                      rate6 = await client.getRate(from, to6);
                      rate7 = await client.getRate(from, to7);
                      rate8 = await client.getRate(from, to8);
                      rate9 = await client.getRate(from, to9);
                      rate10 = await client.getRate(from, to10);
                      rate11 = await client.getRate(from, to11);
                      rate12 = await client.getRate(from, to12);
                      rate13 = await client.getRate(from, to13);
                      rate14 = await client.getRate(from, to14);
                      rate15 = await client.getRate(from, to15);
                      rate16 = await client.getRate(from, to16);
                      setState(() {

                        result1b = (rate1 * double.parse(value)+brate).toStringAsFixed(2);
                        result1s = (rate1 * double.parse(value)-brate).toStringAsFixed(2);


                        result2b = (rate2 * double.parse(value)+brate).toStringAsFixed(2);
                        result2s = (rate2 * double.parse(value)-brate).toStringAsFixed(2);

                        result3b = (rate3 * double.parse(value)+brate).toStringAsFixed(2);
                        result3s = (rate3 * double.parse(value)-brate).toStringAsFixed(2);

                        result4b = (rate4 * double.parse(value)+brate).toStringAsFixed(2);
                        result4s = (rate4 * double.parse(value)-brate).toStringAsFixed(2);

                        result5b = (rate5 * double.parse(value)+brate).toStringAsFixed(2);
                        result5s = (rate5 * double.parse(value)-brate).toStringAsFixed(2);

                        result6b = (rate6 * double.parse(value)+brate).toStringAsFixed(2);
                        result6s = (rate6 * double.parse(value)-brate).toStringAsFixed(2);

                        result7b = (rate7 * double.parse(value)+brate).toStringAsFixed(2);
                        result7s = (rate7 * double.parse(value)-brate).toStringAsFixed(2);

                        result8b = (rate8 * double.parse(value)+brate).toStringAsFixed(2);
                        result8s = (rate8 * double.parse(value)-brate).toStringAsFixed(2);

                        result9b = (rate9 * double.parse(value)+brate).toStringAsFixed(2);
                        result9s = (rate9 * double.parse(value)-brate).toStringAsFixed(2);

                        result10b = (rate10 * double.parse(value)+brate).toStringAsFixed(2);
                        result10s = (rate10 * double.parse(value)-brate).toStringAsFixed(2);

                        result11b = (rate11 * double.parse(value)+brate).toStringAsFixed(2);
                        result11s = (rate11 * double.parse(value)-brate).toStringAsFixed(2);

                        result12b = (rate12 * double.parse(value)+brate).toStringAsFixed(2);
                        result12s = (rate12 * double.parse(value)-brate).toStringAsFixed(2);

                        result13b = (rate13 * double.parse(value)+brate).toStringAsFixed(2);
                        result13s = (rate13 * double.parse(value)-brate).toStringAsFixed(2);

                        result14b = (rate14 * double.parse(value)+brate).toStringAsFixed(2);
                        result14s = (rate14 * double.parse(value)-brate).toStringAsFixed(2);

                        result15b = (rate15 * double.parse(value)+brate).toStringAsFixed(2);
                        result15s = (rate15 * double.parse(value)-brate).toStringAsFixed(2);

                        result16b = (rate16 * double.parse(value)+brate).toStringAsFixed(2);
                        result16s = (rate16 * double.parse(value)-brate).toStringAsFixed(2);
                      });

                    },
                    decoration:InputDecoration(
                        focusedBorder: new OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black,width: 1.5)
                        ),
                        border:OutlineInputBorder(gapPadding:2,),
                        filled: true,
                        fillColor: Colors.white,
                        labelText: "Input value in egyptian pound".tr,
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
                  ),),

                  SizedBox(height: 15,),
                  /*  Container(
                      child: Text("From",style: TextStyle(color: Colors.black,fontSize: 16,)),
                    ),

                    Container(

                      child: customDropDown(currencies,from,(val){
                        setState(() {
                          from = val;
                        });
                      }),
                    ),*/



                  Container(

                    child: DataTable(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        gradient: LinearGradient(
                          begin:Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xffffeaea),
                            Color(0xffffffff),
                          ],
                        ),
                      ),
                      dividerThickness: 3,

                      columns: [

                        DataColumn(label: Text("Currency".tr,style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold)),),
                        DataColumn(label: Text("Sell".tr,style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold)),),
                        DataColumn(label: Text("Buy".tr,style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold)),),
                      ],

                      rows: [
                        DataRow(cells: [
                          DataCell(Text("$to1 (\$)",style: TextStyle(fontSize: 16))),
                          DataCell(Text("$result1b",style: TextStyle(fontSize: 16))),
                          DataCell(Text("$result1s",style: TextStyle(fontSize: 16))),

                        ]),
                        DataRow(cells: [
                          DataCell(Text("$to2 (€)",style: TextStyle(fontSize: 16))),
                          DataCell(Text("$result2b",style: TextStyle(fontSize: 16))),
                          DataCell(Text("$result2s",style: TextStyle(fontSize: 16))),
                        ]),
                        DataRow(cells: [
                          DataCell(Text("$to3 (\$)",style: TextStyle(fontSize: 16))),
                          DataCell(Text("$result3b",style: TextStyle(fontSize: 16))),
                          DataCell(Text("$result3s",style: TextStyle(fontSize: 16))),
                        ]),
                        DataRow(cells: [
                          DataCell(Text("$to4(﷼)  ",style: TextStyle(fontSize: 16))),
                          DataCell(Text("$result4b",style: TextStyle(fontSize: 16))),
                          DataCell(Text("$result4s",style: TextStyle(fontSize: 16))),
                        ]),
                        DataRow(cells: [
                          DataCell(Text("$to5 (₺)",style: TextStyle(fontSize: 16))),
                          DataCell(Text("$result5b",style: TextStyle(fontSize: 16))),
                          DataCell(Text("$result5s",style: TextStyle(fontSize: 16))),

                        ]),
                        DataRow(cells: [
                          DataCell(Text("$to6(﷼)  ",style: TextStyle(fontSize: 16))),
                          DataCell(Text("$result6b",style: TextStyle(fontSize: 16))),
                          DataCell(Text("$result6s",style: TextStyle(fontSize: 16))),
                        ]),
                        DataRow(cells: [
                          DataCell(Text("$to7(﷼)  ",style: TextStyle(fontSize: 16))),
                          DataCell(Text("$result7b",style: TextStyle(fontSize: 16))),
                          DataCell(Text("$result7s",style: TextStyle(fontSize: 16))),
                        ]),
                        DataRow(cells: [
                          DataCell(Text("$to8 (¥)",style: TextStyle(fontSize: 16))),
                          DataCell(Text("$result8b",style: TextStyle(fontSize: 16))),
                          DataCell(Text("$result8s",style: TextStyle(fontSize: 16))),
                        ]),
                        DataRow(cells: [
                          DataCell(Text("$to9 (R\$)",style: TextStyle(fontSize: 16))),
                          DataCell(Text("$result9b",style: TextStyle(fontSize: 16))),
                          DataCell(Text("$result9s",style: TextStyle(fontSize: 16))),

                        ]),
                        DataRow(cells: [
                          DataCell(Text("$to10 (₹)",style: TextStyle(fontSize: 16))),
                          DataCell(Text("$result10b",style: TextStyle(fontSize: 16))),
                          DataCell(Text("$result10s",style: TextStyle(fontSize: 16))),
                        ]),
                        DataRow(cells: [
                          DataCell(Text("$to11 (\$)",style: TextStyle(fontSize: 16))),
                          DataCell(Text("$result11b",style: TextStyle(fontSize: 16))),
                          DataCell(Text("$result11s",style: TextStyle(fontSize: 16))),
                        ]),
                        DataRow(cells: [
                          DataCell(Text("$to12(﷼)  ",style: TextStyle(fontSize: 16))),
                          DataCell(Text("$result12b",style: TextStyle(fontSize: 16))),
                          DataCell(Text("$result12s",style: TextStyle(fontSize: 16))),
                        ]),
                        DataRow(cells: [
                          DataCell(Text("$to13 (₽)",style: TextStyle(fontSize: 16))),
                          DataCell(Text("$result13b",style: TextStyle(fontSize: 16))),
                          DataCell(Text("$result13s",style: TextStyle(fontSize: 16))),

                        ]),
                        DataRow(cells: [
                          DataCell(Text("$to14 (£)",style: TextStyle(fontSize: 16))),
                          DataCell(Text("$result14b",style: TextStyle(fontSize: 16))),
                          DataCell(Text("$result14s",style: TextStyle(fontSize: 16))),
                        ]),
                        DataRow(cells: [
                          DataCell(Text("$to15 (R)",style: TextStyle(fontSize: 16))),
                          DataCell(Text("$result15b",style: TextStyle(fontSize: 16))),
                          DataCell(Text("$result15s",style: TextStyle(fontSize: 16))),
                        ]),
                        DataRow(cells: [
                          DataCell(Text("$to16 (¢)",style: TextStyle(fontSize: 16))),
                          DataCell(Text("$result16b",style: TextStyle(fontSize: 16))),
                          DataCell(Text("$result16s",style: TextStyle(fontSize: 16))),
                        ]),


                      ],
                    ),

                  ),
                  SizedBox(height: 15,),


                ],
              )

            ],
          ) ,
        ),

      ),
    );
  }
}
