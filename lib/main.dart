import 'package:flutter/material.dart';import 'package:store_redirect/store_redirect.dart';void main() => runApp(MyApp());Color _color = Color(0xFFf2f2f2);class MyApp extends StatelessWidget {  @override  Widget build(BuildContext context) {    return MaterialApp(      home: OpenStoreScreen(),    );  } //  @override //  Widget build(BuildContext context) { //    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle( //      statusBarColor: Colors.transparent, //      statusBarBrightness: Brightness.light, //      statusBarIconBrightness: Brightness.dark, //      systemNavigationBarIconBrightness: Brightness.dark, //      systemNavigationBarColor: _color, //    )); //    return NeuApp( //      darkTheme: NeuThemeData(), //      theme: NeuThemeData( //        platform: TargetPlatform.iOS, //        primarySwatch: Colors.blue, //        backgroundColor: Color.lerp(_color, Colors.black, 0.005), //        scaffoldBackgroundColor: _color, //        dialogBackgroundColor: Colors.grey[300], //        appBarTheme: AppBarTheme( //          brightness: Brightness.light, //          color: _color, //          textTheme: TextTheme( //            title: TextStyle( //              color: Colors.black, //              fontSize: 20, //              fontWeight: FontWeight.w500, //            ), //          ), //          iconTheme: IconThemeData( //            color: Colors.black, //          ), //        ), //      ), //      home: ReadListScreen(), //    ); //  }}class OpenStoreScreen extends StatelessWidget {  @override  Widget build(BuildContext context) {    return Scaffold(      body: Container(        child: RaisedButton(          child: Text('Open store'),          onPressed: () {            StoreRedirect.redirect(                androidAppId: "com.gursheesh.singh.switchball",                iOSAppId: "389801252");          },        ),      ),    );  }}