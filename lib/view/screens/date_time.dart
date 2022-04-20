import 'package:flutter/material.dart';
import 'package:reel_app/utils/colors.dart';
import 'package:sizer/sizer.dart';

class DisplayDateAndTime extends StatefulWidget {
  DisplayDateAndTime({Key? key}) : super(key: key);

  @override
  State<DisplayDateAndTime> createState() => _DisplayDateAndTimeState();
}

String year = '';
String month = '';
String day = '';
String hour = '';
String second = '';
String minute = '';
String weekday = '';

class _DisplayDateAndTimeState extends State<DisplayDateAndTime> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.h),
          height: 50.h,
          width: 100.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Year : $year',
                style: Theme.of(context).textTheme.headline6,
              ),
              Text(
                'Month : $month',
                style: Theme.of(context).textTheme.headline6,
              ),
              Text(
                'Day : $day',
                style: Theme.of(context).textTheme.headline6,
              ),
              Text(
                'Hour : $hour',
                style: Theme.of(context).textTheme.headline6,
              ),
              Text(
                'Minute : $minute',
                style: Theme.of(context).textTheme.headline6,
              ),
              Text(
                'Seconds : $second',
                style: Theme.of(context).textTheme.headline6,
              ),
              Text(
                'WeekDay : $weekday',
                style: Theme.of(context).textTheme.headline6,
              ),
              // Spacer()
              SizedBox(
                height: 10.h,
              ),
              InkWell(
                  onTap: () {
                    setState(() {
                      year = DateTime.now().year.toString();
                      month = DateTime.now().month.toString();
                      weekday = DateTime.now().weekday.toString();
                      day = DateTime.now().day.toString();
                      hour = DateTime.now().hour.toString();
                      minute = DateTime.now().minute.toString();
                      second = DateTime.now().second.toString();
                    });
                  },
                  child: Container(
                    height: 7.h,
                    width: 80.w,
                    color: buttonColor,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
