import 'package:expanse_tracker_sql/pages/expanses_tracker_dash.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utility/colors.dart';
import '../utility/font_theam.dart';

class HomePage extends StatefulWidget {
  static const String routeName="/home";
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40,horizontal: 20),
          child: Container(
            constraints: BoxConstraints(maxHeight:size.height*.7,),
            width: double.infinity,
            decoration: BoxDecoration(
              color: buttonColorSecondary.withOpacity(.1),

            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("WellCome",style:GoogleFonts.ptSerif(textStyle: spTitle1),),
                SizedBox(
                  height: 15,
                ),
                Text("To",style:GoogleFonts.ptSerif(textStyle: spTitle1),),
                Text("Expanses Tracker",style:GoogleFonts.ptSerif(textStyle: spTitle2),),
                SizedBox(
                  height: 15,
                ),
                Text("Help to track real life expanses",style:GoogleFonts.ptSerif(textStyle: spTitle3),),
                SizedBox(
                  height: 40,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: buttonColorPrimary,
                    borderRadius: BorderRadius.only(topRight: Radius.circular(25),bottomLeft:Radius.circular(25))
                  ),
                  height: 60,
                  width: size.width*0.4,
                  child: TextButton(
                    onPressed: (){
                      Navigator.pushReplacementNamed(context, ExpansesDashboard.routeName);
                    },
                    child: Text("Get Started",style:GoogleFonts.ptSerif(textStyle: spBTitle1),),
                  ),
                )
              ],
            ),
          ),
        ),
      ),

    );
  }
}
