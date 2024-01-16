import 'package:doctors/screens/appointment.dart';
import 'package:doctors/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  // @override
  // variable declaration
  int currentPage = 0;
  final PageController _page = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _page, 
        onPageChanged: (value) {
          setState(() {
            //updating page index when tab is pressed
            currentPage = value;
          });
        },
        children: const [
          HomePage(),
          AppointmentPage()
        ],

        ),
        bottomNavigationBar: BottomNavigationBar(
          
          currentIndex: currentPage,
          onTap: (page){
            setState(() {
              currentPage = page;
              _page.animateToPage(
                page, 
                duration: const Duration(milliseconds: 500), 
                curve: Curves.easeInOut);
            });
          },
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.houseChimneyMedical),
              label: 'Home',
              ),
              BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.solidCalendarCheck),
              label: 'Appointment',
              ),
          ],
        ),
        
    );
  }
}
