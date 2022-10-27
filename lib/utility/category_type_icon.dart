import 'package:expanse_tracker_sql/model/expanses_category.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:expanse_tracker_sql/model/income_category.dart';

final List<CatagoryExpanses> expansesDropDownList = [
  CatagoryExpanses(
    title: CatagoryExpanses.food,
    icon: Icons.food_bank,
    icondata: 0,
  ),
  CatagoryExpanses(
      title: CatagoryExpanses.electricity,
      icon: Icons.electric_bolt,
      icondata: 1),
  CatagoryExpanses(
      title: CatagoryExpanses.phone, icon: Icons.phone, icondata: 2),
  CatagoryExpanses(
      title: CatagoryExpanses.water, icon: Icons.water_drop, icondata: 3),
  CatagoryExpanses(
      title: CatagoryExpanses.gas, icon: Icons.gas_meter, icondata: 4),
  CatagoryExpanses(
      title: CatagoryExpanses.grocery,
      icon: Icons.local_grocery_store,
      icondata: 5),
  CatagoryExpanses(
      title: CatagoryExpanses.electricity,
      icon: Icons.card_travel,
      icondata: 6),
  CatagoryExpanses(
      title: CatagoryExpanses.houseRent, icon: Icons.home_work, icondata: 7),
];
final List<String> monthName = [
  "January",
  "February",
  "March",
  "April",
  "May",
  "June",
  "July",
  "August",
  "September",
  "October",
  "November",
  "December"
];

final List<IncomeCataegory> incomeDropDownList = [
  IncomeCataegory(
      title: IncomeCataegory.salary, icon: Icons.money, icondata: 1),
  IncomeCataegory(
      title: IncomeCataegory.rentalHome, icon: Icons.home_work, icondata: 2),
  IncomeCataegory(
      title: IncomeCataegory.fdrInterest,
      icon: Icons.percent_sharp,
      icondata: 3),
  IncomeCataegory(
      title: IncomeCataegory.stockMarket,
      icon: Icons.stacked_line_chart,
      icondata: 4),
  IncomeCataegory(
      title: IncomeCataegory.other,
      icon: Icons.call_missed_outgoing,
      icondata: 5),
];
