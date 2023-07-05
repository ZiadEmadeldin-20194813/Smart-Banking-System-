import 'package:face_net_authentication/locator.dart';
import 'package:face_net_authentication/FacePages/models/user.model.dart';
import 'package:face_net_authentication/FacePages/profile.dart';
import 'package:face_net_authentication/FacePages/widgets/app_button.dart';
import 'package:face_net_authentication/FacePages/widgets/app_text_field.dart';
import 'package:face_net_authentication/FaceServices/camera.service.dart';
import 'package:face_net_authentication/pages/home.dart';
import 'package:flutter/material.dart';

class SignInSheet extends StatelessWidget {
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
  var pass2;


  SignInSheet(
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
        required this.password,
        required this.user,
        required this.pass2,
      });

 // SignInSheet({Key? key, required this.user}) : super(key: key);
  final User user;

  final _passwordController = TextEditingController();
  final _cameraService = locator<CameraService>();

  Future _signIn(context, user) async {
    if (user.user == username) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => homePage(data: data, name: name, dob1: dob1, nationality: nationality, gender: gender, mart: mart, add: add, emailadd: emailadd, homenum: homenum, mobilenum: mobilenum, jobb: jobb, jobbadd: jobbadd, income: income, type: type, id: id, accountnum1: accountnum1, balance1: balance1, money: money, username: username, password: password,pass2:pass2)
                  /*  user.user,
                    imagePath: _cameraService.imagePath!,
                  )*/));
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text('Face not recognized, try again!'),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /*Container(
            child: Text(
              '',
              style: TextStyle(fontSize: 20),
            ),
          ),*/
          Container(
            child: Column(
              children: [
               /* SizedBox(height: 10),
                AppTextField(
                  controller: _passwordController,
                  labelText: "Password",
                  isPassword: true,
                ),*/

                Divider(),
                SizedBox(height: 10),
                AppButton(
                  text: 'LOGIN',
                  onPressed: () async {
                    _signIn(context, user);
                  },
                  icon: Icon(
                    Icons.login,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
