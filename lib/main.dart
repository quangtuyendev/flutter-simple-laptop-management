import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:helloWorld/pages/laptop/laptop.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.black.withOpacity(0), //top bar color
    ),
  );
  runApp(
    MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.blue[400],
        ),
        title: 'My App',
        home: Laptop(),
        debugShowCheckedModeBanner: false),
  );
}
