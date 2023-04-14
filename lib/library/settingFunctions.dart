import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';


//DEFAULT VALUES


void saveSettingsBool(String key, bool value) async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool(key, value);
}

void saveSettingsInt(String key, int value) async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setInt(key, value);
}

Future<bool> loadSettingsBool(String key, bool defaultValue) async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool value = prefs.getBool(key) ?? defaultValue;
  return value;
}

Future<int> loadSettingsInt(String key, int defaultValue) async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  int value = prefs.getInt(key) ?? defaultValue;
  return value;
}