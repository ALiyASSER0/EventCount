
import 'package:event_count_downar/helpers/enums.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Shared {
  static SharedPreferences? sharedPreferences;
  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

 static putString({required SharedKeys key, required String value}){
    sharedPreferences!.setString(key.name, value);
  }

 static getString({required SharedKeys key}) {
    return sharedPreferences!.getString(key.name)?? '' ;
  }

  static putBOOl({required SharedKeys key, required bool value}) {
    sharedPreferences!.setBool(key.name, value);
  }
 static getBOOL({required SharedKeys key}) {
    return sharedPreferences!.getBool(key.name)?? false;
  }

 static putDouble({required SharedKeys key, required double value}) {
    sharedPreferences!.setDouble(key.name, value) ;
  }
 static getDouble({required SharedKeys key}) {
    return sharedPreferences!.getDouble(key.name) ?? 0;
  }

 static putInt({required SharedKeys key, required int value}) {
    sharedPreferences!.setInt(key.name, value);
  }
 static getInt({required SharedKeys key}) {
    return sharedPreferences!.getInt(key.name) ?? 0;
  }

  deleteData(){
    sharedPreferences!.clear();
  }

  removeData({required SharedKeys key}) {
    sharedPreferences!.remove(key.name);
  }
}
