import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart'as http;


import '../model/new_model.dart';

class NewsController extends GetxController{
  RxInt currentIndex=0.obs;
  getData(String cat)async{

    final url=Uri.parse("https://newsapi.org/v2/top-headlines?country=us&category=${cat}&apiKey=8696396065e84807a3f75164ffee56f1");
    //final url=Uri.parse("https://newsapi.org/v2/top-headlines?country=us&category=${cat}&apiKey=2a774b30f4754f2ebaf04223f71a9a5b");
    http.Response response = await http.get(url);

    if(response.statusCode==200)
    {
      try{
        return Articles.fromJson(jsonDecode(response.body));
      }catch(e)
      {
        Get.snackbar("error", e.toString());
      }
    }
  }
}