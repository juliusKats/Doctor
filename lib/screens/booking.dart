import 'package:doctors/components/button.dart';
import 'package:doctors/components/customAppBar.dart';
import 'package:doctors/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:table_calendar/table_calendar.dart';
class Booking extends StatefulWidget {
  const Booking({ Key? key }) : super(key: key);

  @override
  _BookingState createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  // Declaration
  CalendarFormat _format = CalendarFormat.month;
  DateTime _focusDay =DateTime.now();
  DateTime _currentDay =DateTime.now();
  int? _currentIndex;
  bool _isWeekend = false;
  bool _dateSelected =false;
  bool _timeSelected = false;
  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Scaffold(
      appBar: CustomAppBar( 
        appTitle: 'Appointment',
        icon: FaIcon(Icons.arrow_back_ios),
      ),
      body: CustomScrollView( 
        slivers: <Widget>[
          SliverToBoxAdapter( 
            child: Column( 
              children: <Widget>[
                // dispaly calender
               _tableCalendar(),
               const Padding(
                padding: EdgeInsets.symmetric(vertical: 10,horizontal: 25),
                child: Center( 
                  child: Text( 
                    'Select Consultation Time',
                    style: TextStyle( 
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                ),
              ],
            ),
          ),
          _isWeekend ? 
          SliverToBoxAdapter(
            child: Container( 
              padding: const EdgeInsets.symmetric( 
                horizontal: 10,
                vertical: 30,
              ),
              alignment: Alignment.center,
              child: const Text( 
                'Weekend is not available, please select another date',
                style:TextStyle( 
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                )
              ),
            ),
          ) 
          : SliverGrid(
            delegate: SliverChildBuilderDelegate((contwxt, index){
              return InkWell( 
                splashColor: Colors.transparent,
                onTap: () {
                  // set selected, update current index and selected to true
                  setState(() {
                    _currentIndex=index;
                    _timeSelected=true;
                  });
                },
                child: Container( 
                  margin: const EdgeInsets.all(5),
                  decoration: BoxDecoration( 
                    border: Border.all( 
                      color: _currentIndex ==index
                  ? Colors.white
                  : Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(15),
                    color: _currentIndex ==index
                  ? Config.primaryColor
                  : null,
                  ),
                  alignment: Alignment.center,
                  child: Text( 
                    '${index + 9}:00 ${index + 9 > 11 ? "PM" : "AM"}',
                    style:TextStyle( 
                      fontWeight: FontWeight.bold,
                      color: _currentIndex ==index
                  ? Colors.white
                  : null,
                    )
                  ),
                ),
              );
            },
            childCount: 8
            ), 
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4, childAspectRatio: 1.5
              ),
              ) ,
              SliverToBoxAdapter( 
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 80),
                  child: Button(
                    width: double.infinity, 
                    title: 'Make Appointment', 
                    onPressed: (){
                      Navigator.of(context).popAndPushNamed('booksuccess');
                    }, 
                    disable: _timeSelected &&_dateSelected ? false: true
                    ),
                ),
              )
        ],
      ),
    );
  }


  // table calender
Widget _tableCalendar(){
  return TableCalendar(
    focusedDay: _focusDay,
    firstDay: DateTime.now(),
    lastDay: DateTime(2024,12,31),
    calendarFormat: _format,
    currentDay: _currentDay,
    rowHeight: 48,
    calendarStyle:CalendarStyle( 
      todayDecoration: BoxDecoration( 
        color: Config.primaryColor,
        shape: BoxShape.circle
      ),
    ),
    availableCalendarFormats: const {
      CalendarFormat.month: 'Month',
    },
    onFormatChanged: (format){
      setState(() {
        _format = format;
      });
    },
    onDaySelected: ((selectedDay, focusedDay){
      setState(() {
        _currentDay = selectedDay;
        _focusDay = focusedDay;
        _dateSelected =true;

        // checking if weekend is selected
        if(selectedDay.weekday==6 || selectedDay.weekday ==7){
          _isWeekend =true;
          _timeSelected = false;
          _currentIndex = null;
        }
        else{
          _isWeekend=false;
        }
      });
    }),
  );
}
}

