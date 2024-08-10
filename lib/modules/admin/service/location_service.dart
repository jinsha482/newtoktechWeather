import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:newtoktechassignment/modules/admin/controller/admin_location.controller.dart';
import 'package:provider/provider.dart';

class LocationService {
    CollectionReference location =
          FirebaseFirestore.instance.collection('location');
       
  Future<int> addLocation({
    required String country,
    required String state,
   required String district,
    required String city,
  }) async {
    try {
    
     
      await location.add({
        'country': country,
        'state': state,
        'district' :district,
        'city' : city
      });
      return 200;
    } catch (e) {
      return 400;
    }
  }

  Future<List<String>> getCountries(BuildContext context) async {
   final locCtrl = Provider.of<AdminLocationController>(context, listen: false);
    try {
      QuerySnapshot querySnapshot = await location.get();
      for (var doc in querySnapshot.docs) {
        if (doc['country'] != null) {
         
         log(doc['country']);
         locCtrl.setCountries(doc['country']);
        }
        
      }
    } catch (e) {
      print("Error fetching country: $e");
    }
   return locCtrl.countries;
  }
Future<List<String>> getStates(BuildContext context) async {
  final locCtrl = Provider.of<AdminLocationController>(context, listen: false);
    try {
      QuerySnapshot querySnapshot = await location.get();
      for (var doc in querySnapshot.docs) {
        if (doc['state'] != null) {
         locCtrl.setStates(doc['state']);
        }
      }
    } catch (e) {
      print("Error fetching states: $e");
    }
    return locCtrl.states;
  }
  Future<List<String>> getCities(BuildContext context) async {
   final locCtrl = Provider.of<AdminLocationController>(context, listen: false);
    try {
      QuerySnapshot querySnapshot = await location.get();
      for (var doc in querySnapshot.docs) {
        if (doc['city'] != null) {
          locCtrl.setCities(doc['city']);
          log(doc['city']);
        }
      }
    } catch (e) {
      print("Error fetching cities: $e");
    }
    return locCtrl.cities;
  }

  Future<List<String>> getDistricts(BuildContext context) async {
  final locCtrl = Provider.of<AdminLocationController>(context, listen: false);
    try {
      QuerySnapshot querySnapshot = await location.get();
      for (var doc in querySnapshot.docs) {
        if (doc['district'] != null) {
          locCtrl.setDistricts(doc['district']);
        }
      }
    } catch (e) {
      print("Error fetching districts: $e");
    }
    return locCtrl.districts;
  }

}