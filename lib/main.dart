import 'package:expanse_tracker_sql/pages/expanses_tracker_dash.dart';
import 'package:expanse_tracker_sql/pages/home.dart';
import 'package:expanse_tracker_sql/pages/noted_page.dart';
import 'package:expanse_tracker_sql/pages/update_expanses.dart';
import 'package:expanse_tracker_sql/provider/expanse_tracker_provider.dart';
import 'package:expanse_tracker_sql/utility/colors.dart';
import 'package:expanse_tracker_sql/pages/update_income.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => ExpansesTrackerProvider()
        ..createDatabaase()
        ..getAllIncome()
        ..getAllExpanses()
        ..totalBalance(),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Map<int, Color> pokeballappSwatch = {
      50: const Color(0xFFFFF3F3),
      100: const Color(0xffFFF1F1),
      200: const Color(0xffFFE4E4),
      300: const Color(0xffFFD7D7),
      400: const Color(0xffFFC9C9),
      500: const Color(0xffFFBCBC),
      600: const Color(0xffFFAFAF),
      700: const Color(0xffFFA1A1),
      800: const Color(0xffFF9494),
      900: const Color(0xffFF8787),
    };

    MaterialColor appColor = MaterialColor(0xFFFF8787, pokeballappSwatch);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: appColor,
      ),
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (context) => HomePage(),
        ExpansesDashboard.routeName: (context) => ExpansesDashboard(),
        NotedPage.routeName: (context) => NotedPage(),
        UpdateIncome.routeName:(context)=>UpdateIncome(),
        UpdateExpanses.routeName:(context)=>UpdateExpanses(),
      },
    );
  }
}
