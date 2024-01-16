import 'package:doctors/components/scheduleCard.dart';
import 'package:doctors/utils/config.dart';
import 'package:flutter/material.dart';
class Appointmentcard extends StatefulWidget {
  const Appointmentcard({ Key? key }) : super(key: key);

  @override
  _AppointmentcardState createState() => _AppointmentcardState();
}

class _AppointmentcardState extends State<Appointmentcard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Config.primaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child:  Material( 
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column( 
          children: [
            // inserting Row 
            Row(
              children: [
                 CircleAvatar( 
              backgroundImage: AssetImage('assets/doctor1.jpg'),
            ),
            SizedBox(
              width: 10,
              ),
            Column( 
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>  [
                Text(
                  'Dr Richard', 
                  style: TextStyle(
                    color: Colors.white
                    ),
                    ),
                SizedBox(
                  height: 2,
                  ),
                Text(
                  'Dental', 
                  style: TextStyle(
                    color: Colors.black
                    ),
                    ),
                
              ],
            )
          
              ],
            ),
          Config.spaceSmall,
          // Schedule infomation
        const  ScheduleCard(),
          Config.spaceSmall,
          // action button 
          Row( 
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:<Widget> [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom( 
                    backgroundColor: Colors.red,
                  ),
                  child: const Text('Cancel',style: TextStyle(color: Colors.white),),
                  onPressed: (){}, 
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom( 
                    backgroundColor: Colors.blue,
                  ),
                  child: const Text('Completed',style: TextStyle(color: Colors.white),),
                  onPressed: (){}, 
                  ),
                  
                ),
           
            ],
          )
          ],
        ),
      
          ),
        ),
    );
  }
}