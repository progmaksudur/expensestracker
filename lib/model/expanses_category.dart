import 'package:flutter/material.dart';

class CatagoryExpanses {
  String title;
  IconData icon;
  int icondata;
  int show;

  CatagoryExpanses(
      {required this.title, required this.icon, required this.icondata,this.show=1});


  static const String food="Food Bills";
  static const String electricity="Electricity Bills";
  static const String phone="Phone Bills";
  static const String water="Water Bills";
  static const String gas="Gas Bills";
  static const String grocery="Grocery Bills";
  static const String transport="Transport";
}
