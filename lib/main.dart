import 'package:e_commerce_app/signup.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'products.dart';
import 'package:flutter/material.dart';
import 'signin.dart';

main(List<String> args) async {
  // var prefs = await SharedPreferences.getInstance();
  // var token = prefs.getString('token') ?? "0";

  return runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    //home: token != "0" ? ProductPage() : MyHomePage(),
    home: MyHomePage(),
    routes: <String, WidgetBuilder>{
      "/product": (BuildContext context) => ProductPage(),
      "/signup": (BuildContext context) => SignupPage(),
      "/signin": (BuildContext context) => MyHomePage(),
    },
  ));
}
