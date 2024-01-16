
import 'package:doctors/components/Doctor/doctorinfo.dart';
import 'package:doctors/utils/config.dart';
import 'package:flutter/material.dart';
class DetailBody extends StatelessWidget {
  const DetailBody({ super.key });

//   @override
//   _DetailBodyState createState() => _DetailBodyState();
// }

// class _DetailBodyState extends State<DetailBody> {
  
  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(bottom: 30),
      child: Column( 
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Config.spaceSmall,
          // doctors experience, Patient and Rating
          const DoctorInfo(),
          Config.spaceMedium,
          const Text(
            'About Doctor',
            style: TextStyle( 
              fontSize: 18,
              fontWeight: FontWeight.w600
            ),
          ),
          Config.spaceSmall,
          const Text(
            'Dr Julius is an experience Cardiologist at IHK United Kingdom. He is graduated since 2019 and completed his traiing at Mulago Hospital',
            style: TextStyle( 
              height: 1.5,
              fontWeight: FontWeight.w500
            ),
            softWrap: true,
            textAlign: TextAlign.justify,
          ),
          
        ],
      ),
    );
  }
}