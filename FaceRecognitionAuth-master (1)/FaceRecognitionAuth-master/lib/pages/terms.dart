import 'package:flutter/material.dart';
import 'package:get/get.dart';


void showAlertDialog(BuildContext context){
  var alertDialog = AlertDialog(

    scrollable: true,
    title: Text('Terms & Conditions'.tr,style: TextStyle(color:  Color(0xff8d0000))),
    content:
    Column(
      children: [
        Container(
         child:Center(child:Text('1 - Security'.tr,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17,decoration: TextDecoration.underline)),
             )),
        Container(
            child:Text('The user must take reasonable precautions to prevent unauthorized access to the application and their account information. The user must immediately report any unauthorized access or suspicious activity on their account.'.tr,style: TextStyle(fontSize: 15)),
            ),
        SizedBox(height: 5,),
        Container(
            child:Center(child:Text('2 - User Responsibilities'.tr,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17,decoration: TextDecoration.underline)),
            )),
        Container(
          child:Text('The user is responsible for maintaining the confidentiality of their login credentials, including their password, and for any actions taken using their account.'.tr,style: TextStyle(fontSize: 15)),
        ),
        SizedBox(height: 5,),
        Container(
            child:Center(child:Text('3 - Transactions:'.tr,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17,decoration: TextDecoration.underline)),
            )),
        Container(
          child:Text('The user is responsible for ensuring that all transactions initiated through the application are authorized and accurate.'.tr,style: TextStyle(fontSize: 15)),
        ),
        SizedBox(height: 5,),
        Container(
            child:Center(child:Text('4 - Fees'.tr,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17,decoration: TextDecoration.underline)),
            )),
        Container(
          child:Text('The user may be charged fees for certain transactions or services provided through the application. The user agrees to pay all applicable fees and charges.'.tr,style: TextStyle(fontSize: 15)),
        ),

        SizedBox(height: 5,),
        Container(
            child:Center(child:Text('5 - Loan Application'.tr,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17,decoration: TextDecoration.underline)),
            )),
        Container(
          child:Text('The user may apply for a loan through the application. The user must provide accurate and complete information when applying for a loan, and the financial institution reserves the right to reject any loan application that does not meet its underwriting criteria.'.tr,style: TextStyle(fontSize: 15)),
        ),

        SizedBox(height: 5,),
        Container(
            child:Center(child:Text('6 - Certificates'.tr,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17,decoration: TextDecoration.underline)),
            )),
        Container(
          child:Text('The financial institution may issue certificates of deposit (CDs) or other similar financial instruments through the application. The user must provide accurate and complete information when opening a CD or other financial instrument.'.tr,style: TextStyle(fontSize: 15)),
        ),
        SizedBox(height: 5,),
        Container(
            child:Center(child:Text('7 - Interest Rates'.tr,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17,decoration: TextDecoration.underline)),
            )),
        Container(
          child:Text('The interest rate on a certificate or other financial instrument may be fixed or variable, and may be subject to change at any time without notice.'.tr,style: TextStyle(fontSize: 15)),
        ),


      ],
    ),

    actions: [
      ElevatedButton(onPressed: (){
        Navigator.pop(context);
      },
          style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color(0xff8d0000)),),
          child: Text('Ok'.tr)),



    ],
  );

  showDialog(
      context: context,
      builder: (BuildContext context){
        return alertDialog;
      }
  );

}