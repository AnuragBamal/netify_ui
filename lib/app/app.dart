import 'package:flutter/material.dart';
import 'package:netify/persentation/resources/routes_manager.dart';
import 'package:netify/persentation/resources/theme_manager.dart';

class Netify extends StatefulWidget {
  //const Netify({Key? key}) : super(key: key); //default constructor

  const Netify._intetnal(); //internal constructor

  static const Netify instance = Netify._intetnal(); //singleton instance

  factory Netify() => instance; //factory constructor
  @override
  NetifyState createState() => NetifyState();
}

class NetifyState extends State<Netify> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Netify',
      debugShowCheckedModeBanner: false,
      theme: getApplicationTheme(),
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.splashRoute,
    );
  }
}
