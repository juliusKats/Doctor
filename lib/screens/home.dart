import 'package:doctors/components/appointcard.dart';
import 'package:doctors/components/Doctor/doctorcard.dart';
import 'package:flutter/material.dart';
import 'package:doctors/utils/config.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class  HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 List<Map<String, dynamic>> medCat=[
   {
     "icon":FontAwesomeIcons.userDoctor,
     "category":"General"
   },
   {
     "icon":FontAwesomeIcons.heartPulse,
     "category":"Cardiology"
   },
   {
     "icon":FontAwesomeIcons.lungs,
     "category":"Respirations"
   },
   {
     "icon":FontAwesomeIcons.hands,
     "category":"Dermatology"
   },
   {
     "icon":FontAwesomeIcons.personPregnant,
     "category":"Gynecology"
   },
   {
     "icon":FontAwesomeIcons.teeth,
     "category":"Dental"
   },
   {
     "icon":FontAwesomeIcons.baby,
     "category":"Pedestrian"
   }
 ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold (
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 15
        ),
        child: SafeArea(
          child:SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                      'Welcome', // hard corded
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage:
                      AssetImage('assets/profile1.jpg'),
                    ),
                  )
                ],
              ),
              Config.spaceMedium,
              
              const Text(
                'Category',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight:FontWeight.bold,
                ),
              ),
              Config.spaceSmall,
               // building category listing
              SizedBox(
                height: Config.heightSize * 0.05,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children:List<Widget>.generate(medCat.length, (index){
                    return Card(
                      margin:const EdgeInsets.only(right: 20),
                      color: Config.primaryColor,
                      child:Padding(
                        padding:const EdgeInsets.symmetric(horizontal:15,vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          FaIcon(
                            medCat[index]['icon'],
                            color: Colors.red,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            medCat[index]['category'],
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ), 
                      )
                      
                    );
                  }),
                ),
              ),
              Config.spaceSmall,
              const Text(
                    'Appointment Today',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      
                    ),
                  ),
              Config.spaceSmall,
              // display appointment card here
              const Appointmentcard(),
              Config.spaceSmall,
               const Text(
                    'Top Doctors',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      
                    ),
                  ),
               Config.spaceSmall,
               // display topdoctor card here
               Column(
                children: 
                  List.generate(10, (index) {
                  return const Doctorcard(
                    route: 'doctorsdetails',
                  );
                  })
                ,
               
               ),
            ],
          )
          ),
        )
      )
    );
  }
}