import 'package:attendancesystem/util/String.dart';
import 'package:flutter/material.dart';

import 'dart:math';

List<Color> _listColor = [
  Colors.lightBlue,
  Colors.blueGrey,
  Colors.brown,
  Colors.grey,
  Colors.purple,
];

Color getRandomColor(int index){
  return _listColor[index%_listColor.length];
}

bool equalIgnoreCase(String str1, String str2) {
  if(str1 == null || str2 == null) return false;
  return str1.toLowerCase() == str2.toLowerCase();
}

Map<String, String> getCurrentTiming() {
  Map<String, String> map = new Map();

  var now = DateTime.now();
  String yyyy = now.year.toString();
  String mm = now.month.toString();
  String dd = now.day.toString();
  String weekDay = DAY[now.weekday - 1];
  String time =
      now.toString().split(" ")[1].substring(0, 5).replaceAll(":", "");

  map['date'] = mm + "/" + dd + "/" + yyyy;
  map['time'] = time;
  map['day'] = weekDay;

  return map;
}

int getCurrentTimeInMs() {
  var now = DateTime.now();
  return now.millisecondsSinceEpoch;
}

int sortComparator(String a, String b){
  List<String> i1 = a.split("/");
  List<String> i2 = b.split("/");

  if(i1[2] == i2[2]){
    if(i1[1] == i2[1]){
      return i1[0].compareTo(i2[0]);
    }else{
      return i1[1].compareTo(i2[1]);
    }
  }else{
    return i1[2].compareTo(i2[2]);
  }
}
