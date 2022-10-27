import 'package:flutter/material.dart';

class IncomeCataegory{
  String title;
  IconData icon;
  int icondata;
  int show;

  IncomeCataegory(
      {required this.title, required this.icon, required this.icondata,this.show=1});

  static const String salary="Salary";
  static const String rentalHome="Home Rental";
  static const String fdrInterest="Fixed Deposit Interest";
  static const String stockMarket="Stock Market";
  static const String other="Other";


}