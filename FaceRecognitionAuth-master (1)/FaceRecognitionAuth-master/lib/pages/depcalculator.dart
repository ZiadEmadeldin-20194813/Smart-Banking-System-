import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class depcalculator extends StatefulWidget {
  const depcalculator({Key? key}) : super(key: key);

  @override
  State<depcalculator> createState() => _depcalculatorState();
}

class _depcalculatorState extends State<depcalculator> {

  double loanam = 0;

  TextEditingController amount = new TextEditingController();
  TextEditingController period = new TextEditingController();
  TextEditingController rate = new TextEditingController();

  num monthly=0;
  num payable=0;
  num interest=0;
  num newrate =0;
  num newinterest=0;
  num hund=100;
  num result=0;
  num totalinterests=0;
  num years=0;
  num twelve =12;


  void calculate(){

    interest=(((num.parse(amount.text)~/100)*num.parse(rate.text))~/12)*num.parse(period.text);
    payable=num.parse(amount.text)+interest;

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
          title: Text ('Term Deposit Calculator'.tr),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(25),
            ),
          ),

        ),
        body:
        ListView(
          children: [

            Expanded(child:
            Column(

              children: <Widget>[
                SizedBox(height: 30),

                  Container( child: Text('How much would you like to deposit?'.tr,style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold)),),

                SizedBox(height: 30,),

                Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 15),

                      child: Text('Amount'.tr,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),

                    )

                  ],
                  mainAxisAlignment: MainAxisAlignment.start,
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: _getColor(_isDarkMode),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 6,
                        ),
                      ]),
                  child: TextField(
                    controller: amount,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    cursorColor: Colors.black,
                    onChanged: (value) {
                      setState(() {

                      });

                    },



                    decoration: InputDecoration(

                      border: InputBorder.none,
                      labelStyle: TextStyle(color: Colors.black,decoration: TextDecoration.none,),

                    ),

                  ),
                ),
                Divider(thickness: 4,height: 40),

                SizedBox(height: 5,),


                Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 15),

                      child: Text('Duration (months)'.tr,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),

                    )

                  ],
                  mainAxisAlignment: MainAxisAlignment.start,
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: _getColor(_isDarkMode),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 6,
                        ),
                      ]),
                  child: TextField(
                    controller: period,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    cursorColor: Colors.black,
                    onChanged: (value) {
                      setState(() {

                      });

                    },



                    decoration: InputDecoration(

                      border: InputBorder.none,
                      labelStyle: TextStyle(color: Colors.black,decoration: TextDecoration.none,),

                    ),

                  ),
                ),

                Divider(thickness: 4,height: 40),

                SizedBox(height: 5,),

                Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 15),

                      child: Text('Interest rate (%)'.tr,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),

                    )

                  ],
                  mainAxisAlignment: MainAxisAlignment.start,
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: _getColor(_isDarkMode),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 6,
                        ),
                      ]),
                  child: TextField(
                    controller: rate,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    cursorColor: Colors.black,
                    onChanged: (value) {
                      setState(() {

                      });

                    },


                    decoration: InputDecoration(

                      border: InputBorder.none,
                      labelStyle: TextStyle(color: Colors.black,decoration: TextDecoration.none,),

                    ),

                  ),
                ),

                Divider(thickness: 4,height: 40),

                SizedBox(height: 10),
                Container(
                  width: 350,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.black45),
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.black45,
                  ),
                  child: Column(
                    children:<Widget> [

                      SizedBox(height: 10,),
                      Container(
                        child: Text('You get back: EGP '.tr +
                            ' $payable',textAlign: TextAlign.center,style:TextStyle(color: Colors.white,fontSize: 19)),
                      ),
                      SizedBox(height: 10,),


                    ],
                  ),
                ),

                SizedBox(height: 10,),
                Container(
                    margin: EdgeInsets.symmetric(vertical: 12),
                    width: size.width * 0.9,
                    child: ClipRRect(
                      child: SizedBox(height: 50, child:  ElevatedButton(
                        // padding: EdgeInsets.symmetric(vertical: 18,horizontal: 38),
                        // color: Colors.deepOrange,
                        onPressed: () async {

                            setState(() {
                              calculate();
                            });
                        },
                        child: Text(
                          'Calculate'.tr,
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

                SizedBox(height: 60,),






              ],
            ),
            ),

          ],
        ),

      ),
    );
  }
}
