import 'package:doctors/components/Doctor/dscheduleCard.dart';
import 'package:doctors/utils/config.dart';
import 'package:flutter/material.dart';
class AppointmentPage extends StatefulWidget {
  const AppointmentPage({super.key});

  @override
  State<AppointmentPage> createState() => _AppointmentPageState();
}
// status declaration
enum FilterStatus {upcoming,complete, cancel}

class _AppointmentPageState extends State<AppointmentPage> {
  FilterStatus status = FilterStatus.upcoming; // initial status
  Alignment _alignment =Alignment.centerLeft;
  List<dynamic> schedules=[
    {
      "doctor_name": "Dr Julius",
      "doctor_profile": "assets/doctor2.jpg",
      "category": "Dental",
      "status": FilterStatus.upcoming,
    },
     {
      "doctor_name": "Dr Allan",
      "doctor_profile": "assets/doctor3.jpg",
      "category": "Cardiology",
      "status": "Complete"
    },
     {
      "doctor_name": "Dr Andrew",
      "doctor_profile": "assets/doctor4.jpg",
      "category": "Respiration",
      "status": FilterStatus.complete
    },
    
     {
      "doctor_name": "Dr Kintu",
      "doctor_profile": "assets/doctor6.jpg",
      "category": "Respiration",
      "status": FilterStatus.complete
    }, 
     {
      "doctor_name": "Dr Patrick",
      "doctor_profile": "assets/doctor5.jpg",
      "category": "Dermatology",
      "status": FilterStatus.cancel
    }
  ];
  
  @override
  Widget build(BuildContext context) {
    // three status to build for filtering
  //  1. upcoming
  //  2. completed 
  //  3. cancelled 
  List <dynamic>filteredSchedules=schedules.where((var schedule) {
    // switch(schedule['status']){
    //   case['upcoming']:
    //     schedule['status']=FilterStatus.upcoming;
    //     break;

    //     case['complete']:
    //     schedule['status']=FilterStatus.complete;
    //     break;

    //     case['cancel']:
    //     schedule['status']=FilterStatus.cancel;
    //     break;
    // }
    return schedule['status']==status;
  }).toList();
    return  SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
        child: Column( 
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Text(
              'Appointment Schedule',
              textAlign: TextAlign.center,
              style: TextStyle( 
                fontSize: 18,
                fontWeight: FontWeight.bold,
                 ),
            ),
            Config.spaceSmall,
            Stack( 
              children: <Widget>[
                Container( 
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration( 
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // filter tabs
                    for (FilterStatus filterStatus in FilterStatus.values)
                      Expanded(
                        child: GestureDetector( 
                          onTap: (){
                            setState(() {
                              if(filterStatus == FilterStatus.upcoming){
                                status=FilterStatus.upcoming;
                                _alignment=Alignment.centerLeft;
                              }
                              else if(filterStatus == FilterStatus.complete){
                                status=FilterStatus.complete;
                                _alignment=Alignment.center;
                              }
                               else if(filterStatus==FilterStatus.cancel){
                                status=FilterStatus.cancel;
                                _alignment=Alignment.centerRight;
                              }
                            });
                          },
                          child: Center( 
                            child: Text(filterStatus.name),
                          ),
                        ),
                      ),
                  ],
                  ),
                ),
                AnimatedAlign(
                  alignment: _alignment, 
                  duration: const Duration(milliseconds: 200),
                  child: Container( 
                    width: 100,
                    height: 40,
                    
                    decoration: BoxDecoration( 
                      color: Config.primaryColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                   child: Center( 
                     child: Text( 
                      status.name,
                      style: const TextStyle( 
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                   ),
                  ),
                  ),
              ],
            ),
            Config.spaceSmall,
            Expanded(
              child: ListView.builder(
                itemCount: filteredSchedules.length,
                itemBuilder: ((context,index){
                  var _schedule = filteredSchedules[index];
                  bool isLastElement = filteredSchedules.length + 1 == index;
                  return Card( 
                    shape: RoundedRectangleBorder(
                      side: const BorderSide( 
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    margin: !isLastElement 
                    ? const EdgeInsets.only(bottom: 20) 
                    : EdgeInsets.zero,
                    child: Padding(
                      padding:const EdgeInsets.all(15),
                      child: Column( 
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              CircleAvatar(
                            backgroundImage: AssetImage(_schedule['doctor_profile']),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          
                          Column( 
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                             
                              Text(_schedule['doctor_name'],
                              style: const TextStyle( 
                                color: Colors.black,
                                fontWeight: FontWeight.w700
                              ),
                              ),
                              const SizedBox(height: 5,),
                              Text(_schedule['category'],
                              style: const TextStyle( 
                                color: Colors.grey,
                                fontSize: 12,
                                fontWeight: FontWeight.w600
                              ),
                              ),
                            ],
                          )
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          // Schedule Card
                          const DScheduleCard(),
                          const SizedBox(
                            height: 15,
                          ),
                          Row( 
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Expanded(
                                child: OutlinedButton(
                                  onPressed: (){},
                                   child: const Text( 
                                    'Cancel',
                                    style: TextStyle( 
                                      color: Config.primaryColor,
                                    ),
                                   ),
                                   ),
                                ),
                                const SizedBox(width: 20,),
                                Expanded(
                                child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    backgroundColor: Config.primaryColor,
                                  ),
                                  onPressed: (){},
                                   child: const Text( 
                                    'Reschedule',
                                    style: TextStyle( 
                                      color: Colors.white,
                                    ),
                                   ),
                                   ),
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                })
                ),
              ),
          ],
        ),
        )
    );
  }
}