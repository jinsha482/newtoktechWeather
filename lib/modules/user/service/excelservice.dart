
import 'dart:io';
import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'weatherservice.dart';


class ExcelService extends ChangeNotifier {
  File? parcedFile;
  

 
  Future<File?> pickExcelFile(BuildContext context) async {
     final weatherCtrl = Provider.of<WeatherService>(context, listen: false);
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['xlsx'],
    );

    if (result != null && result.files.single.path != null) {
      parcedFile = File(result.files.single.path!);
      List<Map<String, String>> locations = await parseExcelFile(parcedFile!);
      await weatherCtrl.locationDetails(locations,context);
    }

    return null;
  }

  Future<List<Map<String, String>>> parseExcelFile(File file) async {
    final bytes = file.readAsBytesSync();
    final excel = Excel.decodeBytes(bytes);

    final List<Map<String, String>> locationList = [];

    for (var table in excel.tables.keys) {
      final sheet = excel.tables[table]!;
      final headerRow = sheet.rows.first; 
      int? countryCol, stateCol, districtCol, cityCol;
      for (var i = 0; i < headerRow.length; i++) {
        final header = headerRow[i]?.value?.toString().toLowerCase();
        if (header != null) {
          if (header.contains('country')) countryCol = i;
          if (header.contains('state')) stateCol = i;
          if (header.contains('district')) districtCol = i;
          if (header.contains('city')) cityCol = i;
        }
      }
      for (var row in sheet.rows.skip(1)) { 
        final locationData = <String, String>{};

        if (countryCol != null && row[countryCol] != null) {
          locationData['Country'] = row[countryCol]!.value.toString();
        }
        if (stateCol != null && row[stateCol] != null) {
          locationData['State'] = row[stateCol]!.value.toString();
        }
        if (districtCol != null && row[districtCol] != null) {
          locationData['District'] = row[districtCol]!.value.toString();
        }
        if (cityCol != null && row[cityCol] != null) {
          locationData['City'] = row[cityCol]!.value.toString();
        }

        if (locationData.isNotEmpty) {
          locationList.add(locationData);
        }
      }
    }

    return locationList;
  }

}