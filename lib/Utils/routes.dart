
import 'package:core_flutter_exam1/Component/Screens/AddNew/add_new.dart';
import 'package:flutter/material.dart';

import '../Component/Screens/HomeScreen/homescreen.dart';
class AppRoutes
{
  static Map<String,Widget Function(BuildContext)>routes={
    '/':(context)=> HomeScreen(),
    '/addNew': (context)=> AddNew(),
  };
}