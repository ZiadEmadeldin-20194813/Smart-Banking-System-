import 'package:flutter/material.dart';
import 'package:get/get.dart';


void showAlertDialog(BuildContext context){
  var alertDialog = AlertDialog(

    scrollable: true,

    content:
       
        Column(children:<Widget> [
Container(
  child: Text('FAQs - Retail'.tr,style: TextStyle(fontSize: 20,color:Color(0xff8d0000),fontWeight: FontWeight.bold,decoration: TextDecoration.underline,),),
),

          SizedBox(height: 30,),

          Row(children: [
           Expanded(child:  Container(
             child: Text('Can i change my user iD?'.tr,style: TextStyle(fontSize: 19,color: Color(0xff00640b)),),
           ),),
          ]),
          Row(children: [
            Expanded(child: Container(
              child: Text('You can not change your user ID'.tr,style: TextStyle(fontSize: 18),),
            ),),
          ]),

          SizedBox(height: 15,),

          Row(
            children: [
              Expanded(child:Container(
                child: Text('When can i use FNB app?'.tr,style: TextStyle(fontSize: 19,color: Color(0xff00640b)),),
              ), ),
            ],
          ),
          Row(children: [
            Expanded(child:Container(
              child: Text('FNB app is available 24/7'.tr,style: TextStyle(fontSize: 18),),
            ), ),
          ],),

          SizedBox(height: 15,),

          Row(children: [
          Expanded(child:Container(
            child: Text('Can the "Login password" be changed?'.tr,style: TextStyle(fontSize: 19,color: Color(0xff00640b)), ),
          ), ),

          ],),
          Row(children: [
            Expanded(child:Container(
              child: Text('Yes, you can change the "Login password" by clicking on the settings then Change password'.tr,style: TextStyle(fontSize: 18,),),
            ), ),
          ],),
          SizedBox(height: 15,),

          Row(children: [
            Expanded(child:Container(
              child: Text('How can i login via One-Time-Password?'.tr,style: TextStyle(fontSize: 19,color: Color(0xff00640b)),),
            ), ),
          ]),
          Row(children: [
            Expanded(child:Container(
              child: Text('Once you clicking on the OTP option you will receive 4 digits through your mobile number, enter these digits on the textfield to login'.tr,style: TextStyle(fontSize: 18,),),
            ), ),
          ],),

          SizedBox(height: 15,),

          Row(children: [
            Expanded(child:
            Container(
              child: Text('Can i change my personal information through the application?'.tr,style: TextStyle(fontSize: 19,color: Color(0xff00640b)),),
            ), ),
          ],),
          Row(
            children: [
              Expanded(child:Container(
                child: Text('No, you can not update/change you personal information unless you go to any bank branch'.tr,style: TextStyle(fontSize: 18,),),
              ), ),
            ],
          ),
          SizedBox(height: 15,),
          Row(children: [
            Expanded(child:Container(
              child: Text('Can i cancel the book appointment to visit a branch?'.tr,style: TextStyle(fontSize: 19,color: Color(0xff00640b)),),
            ), ),
          ],),
          Row(children: [
          Expanded(child:  Container(
            child: Text('Yes, you can cancel your request anytime'.tr,style: TextStyle(fontSize: 18,),),
          ), ),
          ],),

          SizedBox(height: 15,),
          Row(
            children: [
              Expanded(child:Container(
                child: Text('Can transfers be made to other accounts inside or outside FNB?'.tr,style: TextStyle(fontSize: 19,color: Color(0xff00640b)),),
              ), ),
            ],
          ),
          Row(
            children: [
             Expanded(child:  Container(
               child: Text('You can transfer to FNB accounts only'.tr,style: TextStyle(fontSize: 18,),),
             ),),
            ],
          ),

        ]),
         



    actions: [
      ElevatedButton(onPressed: (){
        Navigator.pop(context);



      },style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color(0xff8d0000)),),
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