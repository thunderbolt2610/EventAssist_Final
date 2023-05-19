import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:testing/UI/events/create_events.dart';

class AddEvents extends StatefulWidget {
  const AddEvents({Key? key}) : super(key: key);

  @override
  State<AddEvents> createState() => _AddEventsState();
}

class _AddEventsState extends State<AddEvents> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SfCalendar(
        onTap: (calendarTapDetails) {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const CreateEvents()));
        },
        view: CalendarView.week,
        firstDayOfWeek: 1,
        dataSource: MeetingDataSource(getAppointments()),

      ),
    );
  }
}

List<Appointment> getAppointments()
{
  List<Appointment> meetings = <Appointment>[];
  final DateTime today=DateTime.now();
  final DateTime startTime=DateTime(today.year,today.month,today.day,10,0,0);
  final DateTime endTime=startTime.add(const Duration(hours: 2));

  meetings.add(Appointment(startTime: startTime, endTime: endTime,subject: 'conference',color: Colors.blue));

  return meetings;
}
class MeetingDataSource extends CalendarDataSource
{
  MeetingDataSource(List<Appointment> source)
  {
    appointments=source;

  }
}
