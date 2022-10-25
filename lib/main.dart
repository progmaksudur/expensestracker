import 'package:expanse_tracker_sql/pages/expanses_tracker_dash.dart';
import 'package:expanse_tracker_sql/pages/home.dart';
import 'package:expanse_tracker_sql/pages/noted_page.dart';
import 'package:expanse_tracker_sql/provider/expanse_tracker_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => ExpansesTrackerProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (context) => HomePage(),
        ExpansesDashboard.routeName: (context) => ExpansesDashboard(),
        NotedPage.routeName:(context)=>NotedPage(),
      },
    );
  }
}
