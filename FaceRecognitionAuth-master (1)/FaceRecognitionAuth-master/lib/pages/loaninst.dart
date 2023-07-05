import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';





class LoanCalculator extends StatefulWidget {
  const LoanCalculator({Key? key}) : super(key: key);

  @override
  _LoanCalculatorState createState() => _LoanCalculatorState();
}

class _LoanCalculatorState extends State<LoanCalculator> {
  final TextEditingController _loanAmountController = TextEditingController();
  final TextEditingController _loanPeriodController = TextEditingController();
  final TextEditingController _interestRateController = TextEditingController();
  final TextEditingController _loanStartDateController = TextEditingController();

  String? _installmentAmount;
  List<Map<String, dynamic>>? _installments;

  void _calculateInstallments() {
    double loanAmount = double.parse(_loanAmountController.text);
    num loanPeriod = num.parse(_loanPeriodController.text);
    double interestRate = double.parse(_interestRateController.text);
    DateTime loanStartDate = DateTime.parse(_loanStartDateController.text);



    double r = interestRate / 12;
    double installmentAmount = (((loanAmount/100)*r)*loanPeriod);
    double total=installmentAmount+loanAmount;
    double monthly=total/loanPeriod;
    double interestAmount = ((loanAmount/100)*r);
    _installmentAmount = total.toStringAsFixed(2);

    _installments = [];
    double remainingAmount = total;
    for (int i = 0; i < loanPeriod; i++) {
      double principalAmount = installmentAmount ;
      remainingAmount -= monthly;

      _installments?.add({
        'day': loanStartDate.day,
        'month': loanStartDate.month,
        'year': loanStartDate.year,
        'installmentAmount': monthly,
        'interestAmount': interestAmount,
        'principalAmount': principalAmount,
        'remainingAmount': remainingAmount,
      });

      loanStartDate = DateTime(
          loanStartDate.year, loanStartDate.month + 1, loanStartDate.day);
    }

    setState(() {});
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
    home:Scaffold(

      appBar: AppBar (

        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new,color: Colors.white,),
          onPressed: ()=> Navigator.pop(context),

        ),
        backgroundColor:Color(0xff8d0000) ,
        centerTitle: true,
        title: Text ('Loans'.tr),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(25),
          ),
        ),

      ),
      body:

      ListView(children:<Widget> [


        Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30),

            Center( child: Text('Loan Installment calculator'.tr,style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold)),),

            SizedBox(height: 30,),

            Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 15),

                  child: Text('Loan amount'.tr,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),

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
                controller: _loanAmountController,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:<Widget> [
                Container(
                  padding: EdgeInsets.only(left: 15),
                  child: Text('Min 5000 EGP'.tr,style: TextStyle(fontSize: 15)),
                ),
                Container(
                  padding: EdgeInsets.only(right: 15),
                  child: Text('Max 1,500,000 EGP'.tr,style: TextStyle(fontSize: 15)),
                ),

              ],
            ),
            Divider(thickness: 4,height: 40),
            Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 15),

                  child: Text('Loan period'.tr,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),

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
                controller: _loanPeriodController,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:<Widget> [
                Container(
                  padding: EdgeInsets.only(left: 15),
                  child: Text('Min 6 months'.tr,style: TextStyle(fontSize: 15)),
                ),
                Container(
                  padding: EdgeInsets.only(right: 15),
                  child: Text('Max 120 months'.tr,style: TextStyle(fontSize: 15)),
                ),

              ],
            ),
            Divider(thickness: 4,height: 40),
            Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 15),

                  child: Text('Interest rate (Annual %)'.tr,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),

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
                controller: _interestRateController,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:<Widget> [
                Container(
                  padding: EdgeInsets.only(left: 15),
                  child: Text('Min 16%'.tr,style: TextStyle(fontSize: 15)),
                ),
                Container(
                  padding: EdgeInsets.only(right: 15),
                  child: Text('Max 21%'.tr,style: TextStyle(fontSize: 15)),
                ),

              ],
            ),
            Divider(thickness: 4,height: 40),
            Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 15),

                  child: Text('Date of first Installment (yyyy-mm-dd)'.tr,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),

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
                controller: _loanStartDateController,
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
            const SizedBox(height: 16),
            Container(
                margin: EdgeInsets.symmetric(vertical: 12),
                width: size.width * 0.9,
                child: ClipRRect(
                  child: SizedBox(height: 50, child:  ElevatedButton(
                    // padding: EdgeInsets.symmetric(vertical: 18,horizontal: 38),
                    // color: Colors.deepOrange,
                    onPressed: () async {
                      if(_loanAmountController.text==''||_loanPeriodController.text==''||_interestRateController=='')
                        {
                          Fluttertoast.showToast(
                            msg: 'please fill-in the form!'.tr,
                            backgroundColor:Color(0xff1e2023),
                            textColor: Colors.white,
                            toastLength: Toast.LENGTH_SHORT,

                          );
                        }
                      else if(int.parse(_loanAmountController.text)>=5000 && int.parse(_loanAmountController.text)<=1500000 && int.parse(_loanPeriodController.text)>=6 && int.parse(_loanPeriodController.text)<=120 && int.parse(_interestRateController.text)>=16&& int.parse(_interestRateController.text)<=21)
                        {
                          _calculateInstallments();
                        }
                      else
                        {
                          Fluttertoast.showToast(
                            msg: 'please check the constraints of the form!'.tr,
                            backgroundColor:Color(0xff1e2023),
                            textColor: Colors.white,
                            toastLength: Toast.LENGTH_SHORT,

                          );
                        }

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

            if (_installmentAmount != null) ...[
              const SizedBox(height: 16),
              Text('Total Installment: $_installmentAmount EGP',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
              const SizedBox(height: 16),
              const Text('Installment Details:',style: TextStyle(fontSize:16)),
              const SizedBox(height: 20),
              SizedBox(
                height: 450,
                child: ListView.builder(
                 // shrinkWrap: true,
                  itemCount: _installments?.length ?? 0,
                  itemBuilder: (context, index) {
                    final installment = _installments![index];
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(child:Text(
                              'Receipt ${index + 1}: (${installment['day']}/${installment['month']}/${installment['year']})',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),
                            ) ,)
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(child:Text(
                              'Installment: ${installment['installmentAmount'].toStringAsFixed(2)}\nInterest: ${installment['interestAmount'].toStringAsFixed(2)}\nRemaining: ${installment['remainingAmount'].toStringAsFixed(2)}',style:TextStyle(fontSize: 15),
                            ),)
                          ],
                        ),
                        Divider(
                          height: 15,
                          thickness: 3,

                        ),


                      ],
                    );
                  },
                ),
              ),
            ],
          ],
        ),
      )
          ],)
    ) );
  }
}