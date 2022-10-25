import 'package:expanse_tracker_sql/model/expanses_category.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final List<CatagoryExpanses> expansesDropDownList=[
  CatagoryExpanses(
      title: CatagoryExpanses.food,
      icon:Icons.food_bank,
      icondata: 0,),
  CatagoryExpanses(
      title: CatagoryExpanses.electricity,
      icon:Icons.electric_bolt,
      icondata: 1),
  CatagoryExpanses(
      title: CatagoryExpanses.phone,
      icon:Icons.phone,
      icondata: 2),
  CatagoryExpanses(
      title: CatagoryExpanses.water,
      icon:Icons.water_drop,
      icondata: 3),
  CatagoryExpanses(
      title: CatagoryExpanses.gas,
      icon:Icons.gas_meter,
      icondata: 4),
  CatagoryExpanses(
      title: CatagoryExpanses.grocery,
      icon:Icons.local_grocery_store,
      icondata: 5),
  CatagoryExpanses(
      title: CatagoryExpanses.electricity,
      icon:Icons.card_travel,
      icondata: 6),
  ];

final Map<int,IconData> expansesIconMap={
  1:Icons.food_bank,
  2:Icons.electric_bolt,
  3:Icons.phone,
  4:Icons.water_drop,
  5:Icons.gas_meter,
  6:Icons.local_grocery_store,
  7:Icons.card_travel,
};