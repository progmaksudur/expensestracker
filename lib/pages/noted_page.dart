import 'package:expanse_tracker_sql/utility/colors.dart';
import 'package:flutter/material.dart';

class NotedPage extends StatefulWidget {
  static const String routeName="/notedpage";
  const NotedPage({Key? key}) : super(key: key);

  @override
  State<NotedPage> createState() => _NotedPageState();
}

class _NotedPageState extends State<NotedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: buttonColorSecondary.withOpacity(.1)
        ),
        child: Column(

        ),
      ),
    );
  }
}
