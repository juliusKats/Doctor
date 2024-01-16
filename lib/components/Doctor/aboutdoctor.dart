import 'package:doctors/utils/config.dart';
import 'package:flutter/material.dart';
class AboutDoctor extends StatefulWidget {
  const AboutDoctor({ Key? key }) : super(key: key);

  @override
  _AboutDoctorState createState() => _AboutDoctorState();
}

class _AboutDoctorState extends State<AboutDoctor> {
  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Container(
      width: double.infinity,
      child: Column(
        children: <Widget>[
          const CircleAvatar( 
            radius: 65.0,
            backgroundImage: AssetImage('assets/doctor2.jpg'),
            backgroundColor: Colors.white,
          ),
          Config.spaceMedium,
          const Text(
            'Dr Julius',
            style: TextStyle( 
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Config.spaceSmall,
          SizedBox(
            width: Config.widthSize * 075,
            child: const Text( 
              'MBBS (International Medical University, Malaysia), MCRP (Royal College of Physican ,United Kingdom)',
              style: TextStyle( 
                color: Colors.grey,
                fontSize: 15
              ),
            softWrap: true,
            textAlign: TextAlign.center,
            ),
          ),
          Config.spaceSmall,
          SizedBox(
            width: Config.widthSize * 075,
            child: const Text( 
              'International Hospital of United Kingdom',
              style: TextStyle( 
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.bold
              ),
            softWrap: true,
            textAlign: TextAlign.center,
            ),
          ),
        ],
        ),
    );
  }
}