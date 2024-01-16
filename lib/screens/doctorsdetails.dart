import 'package:doctors/components/Doctor/aboutdoctor.dart';
import 'package:doctors/components/Doctor/detailbody.dart';
import 'package:doctors/components/button.dart';
import 'package:doctors/components/customAppBar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class DoctorDetails extends StatefulWidget {
  const DoctorDetails({ super.key });

  @override
  _DoctorDetailsState createState() => _DoctorDetailsState();
}

class _DoctorDetailsState extends State<DoctorDetails> {
  bool isFav = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appTitle: 'Doctor Details',
        icon: const FaIcon(Icons.arrow_back_ios),
        actions: [ 
          // Favourite Button
          IconButton(
            onPressed: (){
              setState(() {
                isFav = !isFav;
              });
            }, 
            icon: 
            FaIcon(isFav? Icons.favorite_rounded : Icons.favorite_outline),
            color: Colors.red,
            ),
        ],
      ),
      body:  SafeArea(
        child: Column(
          children: <Widget>[
             AboutDoctor(),
            //  Config.spaceSmall,
             DetailBody(),
            // const Spacer(),
             Padding(
              padding: const  EdgeInsets.all(20),
              child: Button(
                width: double.infinity, 
                title: 'Book Appointment' ,
                onPressed: (){
                  // navigate to booking page
                  Navigator.of(context).pushNamed('booking');
                },
                disable: false),
              ),
              
          ],
          
        ),
        
        ),
      
    );
  }
}