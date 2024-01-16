import 'package:doctors/utils/config.dart';
import 'package:flutter/material.dart';
class DScheduleCard extends StatefulWidget {
  const DScheduleCard({ Key? key }) : super(key: key);

  @override
  _DScheduleCardState createState() => _DScheduleCardState();
}

class _DScheduleCardState extends State<DScheduleCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration( 
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10)
      ),
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: Row( 
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const <Widget>[
          Icon(
            Icons.calendar_today,
             color:Config.primaryColor,
             size: 15,
             ),
              SizedBox(
              width: 5,
             ),
             Text('Monday, 01/15/2024',
             style: TextStyle( 
              color: Config.primaryColor,
              ),
             ),
          SizedBox( 
            width: 20,
          ),
          Icon(
            Icons.access_alarm,
             color: Config.primaryColor,
             size: 17,
             ), 
              SizedBox(
              width: 5,
             ),
             Flexible(child: Text('2:00 PM',style: TextStyle( color: Config.primaryColor,),))  
         
        ],
      ),
    );
  }
}