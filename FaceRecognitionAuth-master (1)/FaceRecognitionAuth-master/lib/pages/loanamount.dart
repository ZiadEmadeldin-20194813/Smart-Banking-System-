import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart'as http;
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:file_picker/file_picker.dart';


class loanamount extends StatefulWidget {
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


  loanamount(
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
  State<loanamount> createState() => _loanamountState(data: data, name: name, dob1: dob1, nationality: nationality, gender: gender, mart: mart, add: add, emailadd: emailadd, homenum: homenum, mobilenum: mobilenum, jobb: jobb, jobbadd: jobbadd, income: income, type: type, id: id, accountnum1: accountnum1, balance1: balance1, money: money, username: username, password: password);
}

class _loanamountState extends State<loanamount> {


  TextEditingController amount = new TextEditingController();
  TextEditingController period = new TextEditingController();
  TextEditingController rate = new TextEditingController();
  TextEditingController gPrice = new TextEditingController();


  num monthly=0;
  num payable=0;
  num interest=0;

  void calculate(){


    interest=((((num.parse(amount.text)~/100)*num.parse(rate.text))~/12)*num.parse(period.text));
    payable=num.parse(amount.text)+interest;
    monthly=payable~/num.parse(period.text);

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


  _loanamountState(
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




  File? _image;
  File? _pdf;

  Future<void> _getImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(
      source: source,
      maxWidth: 450,
      maxHeight: 600,
      imageQuality: 100,
    );

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        _pdf = null; // Reset PDF selection
      }
    });
  }

  Future<void> _getPdf() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      PlatformFile file = result.files.first;
      String filePath = file.path!;
      setState(() {
        _image = null; // Reset image selection
        _pdf = File(filePath);
      });
    } else {
      // User canceled the file picker
    }
  }

  Future<void> uploadImage() async {
    try {
      var request = http.MultipartRequest('POST', Uri.parse('https://inconspicuous-pairs.000webhostapp.com/uploadLoanImage.php'));
      request.fields['amount'] = amount.text;
      request.fields['period'] = period.text;
      request.fields['rate'] = rate.text;
      request.fields['totalinterest'] = interest.toString();
      request.fields['totalpayable'] = payable.toString();
      request.fields['monthly'] = monthly.toString();
      request.fields['accountnumber'] = accountnum1;

      request.fields['name'] = name;
      request.fields['job'] = jobb;
      request.fields['salary'] = income;

      request.fields['nationalid'] = id;
      request.fields['gPrice'] = gPrice.text;
      request.fields['balance'] = balance1;
      request.fields['reputation'] = 'Good';

      for (var i = 0; i < selectedGuarantees.length; i++) {
        request.fields['guarantee[$i]'] = selectedGuarantees[i];
      }

      if(_image!=null)
      {
        request.files.add(await http.MultipartFile.fromPath('image', _image!.path));
      }
      else if(_pdf!=null)
      {
        request.files.add(await http.MultipartFile.fromPath('image', _pdf!.path));
      }
      else
      {
        print('Image upload failed');
      }

      var response = await request.send();
      print(await response.stream.bytesToString());
    } catch (e) {
      print(e);
    }
  }



  List<String> selectedGuarantees = [];
  void toggleGuarantee(String guarantee) {
    setState(() {
      if (selectedGuarantees.contains(guarantee)) {
        selectedGuarantees.remove(guarantee);
      } else {
        selectedGuarantees.add(guarantee);
      }
    });
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
          title: Text ('Loans'),
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

                Center( child: Text('Loan amount calculator',style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold)),),

                SizedBox(height: 30,),

                Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 15),

                      child: Text('Loan amount',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),

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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:<Widget> [
                    Container(
                      padding: EdgeInsets.only(left: 15),
                      child: Text('Min 5000 EGP',style: TextStyle(fontSize: 15)),
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 15),
                      child: Text('Max 50,000,000 EGP',style: TextStyle(fontSize: 15)),
                    ),

                  ],
                ),
                Divider(thickness: 4,height: 40),



                SizedBox(height: 5,),

                Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 15),

                      child: Text('Loan period',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),

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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:<Widget> [
                    Container(
                      padding: EdgeInsets.only(left: 15),
                      child: Text('Min 6 months',style: TextStyle(fontSize: 15)),
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 15),
                      child: Text('Max 120 months',style: TextStyle(fontSize: 15)),
                    ),

                  ],
                ),
                Divider(thickness: 4,height: 40),

                SizedBox(height: 5,),

                Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 15),

                      child: Text('Interest rate (Annual %)',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),

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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:<Widget> [
                    Container(
                      padding: EdgeInsets.only(left: 15),
                      child: Text('Min 16%',style: TextStyle(fontSize: 15)),
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 15),
                      child: Text('Max 21%',style: TextStyle(fontSize: 15)),
                    ),

                  ],
                ),

                SizedBox(height: 30,),
                Container(
                    margin: EdgeInsets.symmetric(vertical: 12),
                    width: size.width * 0.9,
                    child: ClipRRect(
                      child: SizedBox(height: 50, child:  ElevatedButton(
                        // padding: EdgeInsets.symmetric(vertical: 18,horizontal: 38),
                        // color: Colors.deepOrange,
                        onPressed: () async {

                          setState(() {
                            if(int.parse(amount.text)>=5000 && int.parse(amount.text)<=50000000 && int.parse(period.text)>=6 && int.parse(period.text)<=120 && int.parse(rate.text)>=16 &&int.parse(rate.text)<=21){
                              calculate();
                            }
                            else
                            {
                              Fluttertoast.showToast(
                                msg: 'please check the constraints of the form!',
                                backgroundColor:Color(0xff1e2023),
                                textColor: Colors.white,
                                toastLength: Toast.LENGTH_SHORT,

                              );
                            }

                          });

                        },
                        child: Text(
                          'Calculate',
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
                SizedBox(height: 20),
                Container(
                  width: 350,
                  height: 160,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Color(0xff8d0000)),
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xff8d0000),
                  ),
                  child: Column(
                    children:<Widget> [

                      SizedBox(height: 10,),
                      Container(
                        child: Text('Your monthly payments',textAlign: TextAlign.center,style:TextStyle(color: Colors.white,fontSize: 20)),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        child: Text('EGP $monthly',textAlign: TextAlign.center,style:TextStyle(color: Colors.white,fontSize: 18)),
                      ),
                      SizedBox(height: 5,),
                      Divider(color: Colors.white,indent: 30,endIndent: 30,thickness: 1),
                      SizedBox(height: 5,),

                      Row(
                        children:<Widget> [

                          SizedBox(width: 35),
                          Column(children:<Widget> [

                            Container(
                              child: Text('Total payable',textAlign: TextAlign.center,style:TextStyle(color: Colors.white,fontSize: 20)),
                            ),
                            SizedBox(height: 10,),
                            Container(
                              child: Text('EGP $payable',textAlign: TextAlign.center,style:TextStyle(color: Colors.white,fontSize: 18)),
                            ),
                          ],),

                          SizedBox(width: 35),
                          Column(children:<Widget> [

                            Container(
                              child: Text('Total interest',textAlign: TextAlign.center,style:TextStyle(color: Colors.white,fontSize: 20)),
                            ),
                            SizedBox(height: 10,),
                            Container(
                              child: Text('EGP $interest',textAlign: TextAlign.center,style:TextStyle(color: Colors.white,fontSize: 18)),
                            ),
                          ],),


                        ],
                      )

                    ],
                  ),
                ),


                SizedBox(height: 30,),
                Divider(thickness: 4,height: 40),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(child: Text('Please upload an image as proof of any of your property to act as collateral for this loan',
                      style: TextStyle(fontSize: 15),textAlign: TextAlign.center,)),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        TextButton(
                          onPressed: () => _getImage(ImageSource.gallery),
                          child: Text('Gallery',style: TextStyle(color: Color(0xff8d0000),fontWeight: FontWeight.bold)),
                        ),
                        TextButton(
                          onPressed: () => _getImage(ImageSource.camera),
                          child: Text('Camera',style: TextStyle(color: Color(0xff8d0000),fontWeight: FontWeight.bold)),
                        ),
                     /*   TextButton(
                          onPressed: () => _getPdf(),
                          child: Text('PDF',style: TextStyle(color: Color(0xff8d0000),fontWeight: FontWeight.bold)),
                        ),*/
                      ],),

                    _image != null
                        ? Image.file(_image!,height: 300,width: 400)
                        : Text('',style: TextStyle(fontSize: 14),),

                  /*  _pdf != null
                        ? Text('PDF file selected',style: TextStyle(fontSize: 14),)
                        : Text('',style: TextStyle(fontSize: 14),)*/

                  ],
                ),
                SizedBox(height: 15),
                Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 15),

                      child: Text('Select one or more guarantees',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),

                    )

                  ],
                  mainAxisAlignment: MainAxisAlignment.start,
                ),
                SizedBox(height: 8.0),
                Wrap(
                  spacing: 2.0,
                  children: [
                    _buildCheckbox('Car'),
                    _buildCheckbox('Home'),
                    _buildCheckbox('Salary'),
                    _buildCheckbox('Land'),
                    _buildCheckbox('Store'),
                    _buildCheckbox('Building'),
                    // Add more checkboxes as needed
                  ],
                ),

                SizedBox(height: 15,),
                Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 15),

                      child: Text('Guarantee(s) price',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),

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
                    controller: gPrice,
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
                Container(
                    margin: EdgeInsets.symmetric(vertical: 12),
                    width: size.width * 0.9,
                    child: ClipRRect(
                      child: SizedBox(height: 50, child:  ElevatedButton(
                        // padding: EdgeInsets.symmetric(vertical: 18,horizontal: 38),
                        // color: Colors.deepOrange,
                        onPressed: () async {

                          if(amount.text!=''&&period.text!=''&&rate.text!=''&&monthly!=0 && selectedGuarantees.isNotEmpty && gPrice.text!='')
                          {
                            if(_image!=null)
                              {
                                setState(() async {
                                  //SendData();

                                  uploadImage();

                                  Fluttertoast.showToast(
                                    msg: 'Your loan request has been uploaded successfully please wait for the response that shows in your notification page!',
                                    backgroundColor:Color(0xff1e2023),
                                    textColor: Colors.white,
                                    toastLength: Toast.LENGTH_SHORT,
                                    timeInSecForIosWeb: 4,
                                  );

                                  period.text='';
                                  rate.text='';
                                  amount.text='';
                                  monthly=0;
                                  payable=0;
                                  interest=0;
                                  _image=null;
                                  selectedGuarantees.clear();
                                  gPrice.text='';
                                });

                              }
                            else
                            {
                              Fluttertoast.showToast(
                                msg: 'please check the constraints of the form and make sure that you uploaded an image/PDF!',
                                backgroundColor:Color(0xff1e2023),
                                textColor: Colors.white,
                                toastLength: Toast.LENGTH_SHORT,
                              );
                            }
                              }

                          else
                          {
                            Fluttertoast.showToast(
                              msg: 'please check the constraints of the form and make sure that you uploaded an image/PDF!',
                              backgroundColor:Color(0xff1e2023),
                              textColor: Colors.white,
                              toastLength: Toast.LENGTH_SHORT,
                            );
                          }

                        },
                        child: Text(
                          'Apply for this',
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
  Widget _buildCheckbox(String guarantee) {
    final isChecked = selectedGuarantees.contains(guarantee);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Checkbox(
          value: isChecked,
          activeColor: Color(0xff8d0000),
          onChanged: (_) => toggleGuarantee(guarantee),
        ),
        Text(guarantee),
      ],
    );
  }

}
