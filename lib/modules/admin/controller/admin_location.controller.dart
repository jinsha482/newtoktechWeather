
import 'package:flutter/material.dart';


class AdminLocationController extends ChangeNotifier{

   String countryValue = "";
  String stateValue = "";
  String cityValue = "";
 TextEditingController districtCtrl = TextEditingController();
bool locationAdded = false;
List <String>countries = [];
List <String>states = [];
List<String> cities = [];
List<String> districts = [];
setCountries(String value){
  countries.add(value);
  notifyListeners();
}
setCities(String value){
  cities.add(value);
  notifyListeners();
}
setStates(String value){
  states.add(value);
  notifyListeners();
}
setDistricts(String value){
 districts.add(value);
  notifyListeners();
}
setlocationStatus(bool status){
locationAdded = status;
notifyListeners();
}
onInit(){
  countryValue = '';
  stateValue = '';
  cityValue = '';
  districtCtrl.text = '';
  locationAdded = false;
}
}