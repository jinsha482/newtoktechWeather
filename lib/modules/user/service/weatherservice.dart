import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import '../../../global/constants/styles/colors/colors.dart';
import '../model/weather.model.dart';
import 'dart:convert';

class WeatherService extends ChangeNotifier{
  final List<Map<String, String>> weatherReports = [];
  WeatherModel weatherModel = WeatherModel();

   setDate(String inputDate){
 
  DateTime parsedDate = DateTime.parse(inputDate);
  String formattedDate = DateFormat('EEEE, h:mm a').format(parsedDate);
  return formattedDate; 
}
splitDate(String inputDate){
List date =inputDate.split(' ');
return date[1];
}
setGreeting(String inputDate){
   DateTime parsedDate = DateTime.parse(inputDate);
  
  String greeting;
  int hour = parsedDate.hour;
  
  if (hour >= 5 && hour < 12) {
    greeting = "Good Morning";
  } else if (hour >= 12 && hour < 17) {
    greeting = "Good Afternoon";
  } else if (hour >= 17 && hour < 21) {
    greeting = "Good Evening";
  } else {
    greeting = "Good Night";
  }
 
  
return greeting; 
}


  // passing location details to url
 locationDetails(List<Map<String, String>> locations,BuildContext context) async {
  for (var location in locations) {
    String? city = location['City'];
    String? state = location['State'];
    String? country = location['Country'];
    String? district = location['District'];

    if (city != null || country != null || district != null || state != null) {
     String query = '';
     if(city !=null) query += ', $state';
      if (state != null) query += ', $state';
      if (district != null) query += ', $district';
      if (country != null) query += ', $country';

      final weatherData = await getWeatherReport(query,context);

      if (weatherData != null && weatherData.containsKey('current') && weatherData['current'] != null) {
        final currentData = weatherData['current'];
        final temp = currentData['temp_c']; // Temperature in Celsius
        final weatherDescription = currentData['condition'] != null ? currentData['condition']['text'] : 'No description available';

        weatherReports.add({
          'Location': query,
          'Temperature': temp?.toString() ?? 'N/A',
          'Description': weatherDescription,
        });
       
      } else {
       
      }
    } else {
     
    }
  }

  notifyListeners();  
}

Future<Map<String, dynamic>?> getWeatherReport(String query,BuildContext context) async {
   const apiKey = '9382a472929a45fc9be64957240908'; 
  final url = 'https://api.weatherapi.com/v1/current.json?q=$query&key=$apiKey';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
       weatherModel = WeatherModel.fromJson(json.decode(response.body));
       
      Navigator.pushNamed(context, 'weatherReport');
      notifyListeners();
      return data;
      
    } else {
      
       
      notifyListeners();
      return null;
    }
    
  }
}

