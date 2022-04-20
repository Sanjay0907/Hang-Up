import 'package:flutter/material.dart';

class VideoUploadDate {
  String? _month;
  String? _weekDay;
  String? _uploadDate;

  String? get upload_date => _uploadDate;
  String? get week_day => _weekDay;
  String? get mnt => _month;

  void uploadDate(
    String year,
    String month,
    String day,
    String hour,
    String second,
    String minute,
    String weekday,
  ) {
    if (month == '1') {
      _month = 'January';
    } else if (month == '2') {
      _month = 'Feburary';
    } else if (month == '3') {
      _month = 'March';
    } else if (month == '4') {
      _month = 'April';
    } else if (month == '5') {
      _month = 'May';
    } else if (month == '6') {
      _month = 'June';
    } else if (month == '7') {
      _month = 'July';
    } else if (month == '8') {
      _month = 'August';
    } else if (month == '9') {
      _month = 'September';
    } else if (month == '10') {
      _month = 'Octuber';
    } else if (month == '11') {
      _month = 'November';
    } else if (month == '12') {
      _month = 'December';
    } else {
      _month = 'Not Valid';
    }

    if (weekday == '1') {
      _weekDay = 'Monday';
    } else if (weekday == '2') {
      _weekDay = 'Tuesday';
    } else if (weekday == '3') {
      _weekDay = 'Wednesday';
    } else if (weekday == '4') {
      _weekDay = 'Thursday';
    } else if (weekday == '5') {
      _weekDay = 'Friday';
    } else if (weekday == '6') {
      _weekDay = 'Saturday';
    } else if (weekday == '7') {
      _weekDay = 'Sunday';
    } else {
      _weekDay = 'Not Valid';
    }

    _uploadDate = '$day:$_month:$year   $hour:$minute:$second   $_weekDay  ';
  }
}
