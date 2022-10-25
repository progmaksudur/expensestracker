import 'package:expanse_tracker_sql/utility/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utility/font_theam.dart';

class IteamShortDetails extends StatelessWidget {
  IconData typeIconData;
  IconData titleIconData;
  String title;
  String time;
  String amount;
  IteamShortDetails({Key? key,required this.typeIconData,required this.title,required this.amount, required this.time,required this.titleIconData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
          color: buttonColorSecondary.withOpacity(.3),
          borderRadius: BorderRadius.circular(10)
        ),
        padding: EdgeInsets.symmetric(horizontal: 4),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(flex: 2,child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: buttonColorThard,
                    radius: 14,
                    child: Icon(typeIconData,color: Colors.white,),
                  ),
                  title: Text(title,style:GoogleFonts.ptSerif(textStyle: exTitle2)),
                  subtitle: Text(time,style:GoogleFonts.ptSerif(textStyle: exTitle4) ,),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16,),
                  child: FittedBox(
                    child: Text("\$ $amount",style:GoogleFonts.ptSerif(textStyle: exTitle4)),
                  ),
                ),
              ],
            ),),
            Expanded(
              flex: 1,
              child: Container(
              padding: EdgeInsets.all(10),
              child: CircleAvatar(
                backgroundColor: Colors.blueGrey.withOpacity(.1),
                radius: 25,
                child: Icon(titleIconData,size: 25,color: Colors.white,),

            ),),)
          ],

        ),
      ),
    );
  }
}
