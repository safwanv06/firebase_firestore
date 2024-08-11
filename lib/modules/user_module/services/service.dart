import 'dart:io';

import 'package:dio/dio.dart';
import 'package:excel/excel.dart';

import 'model.dart';

class ExcelService {
  Future<List<LocationData>> parseExcelFile(File excelFile) async {
    int? countryIndex;
    int? stateIndex;
    int? cityIndex;
    List<LocationData> locationData = [];
    var bytes = excelFile.readAsBytesSync();
    Excel excel = Excel.decodeBytes(bytes);
    for (String table in excel.tables.keys) {
      for (List<Data?> row in excel.tables[table]!.rows) {
        LocationData? location = LocationData();
        for (Data? rowData in row) {
          if (rowData?.value.toString() == "Country" ||
              rowData?.value.toString() == "country") {
            countryIndex = rowData?.columnIndex;
          }
          if (rowData?.value.toString() == "State" ||
              rowData?.value.toString() == "state") {
            stateIndex = rowData?.columnIndex;
          }
          if (rowData?.value.toString() == "City" ||
              rowData?.value.toString() == "city") {
            cityIndex = rowData?.columnIndex;
          }
          if (rowData?.columnIndex == countryIndex) {
            location.countryName = rowData?.value.toString() != "Country" &&
                    rowData?.value.toString() != "country"
                ? rowData?.value.toString()
                : null;
          }
          if (rowData?.columnIndex == cityIndex) {
            location.cityName = rowData?.value.toString() != "City" &&
                    rowData?.value.toString() != "city"
                ? rowData?.value.toString()
                : null;
          }
          if (rowData?.columnIndex == stateIndex) {
            location.stateName = rowData?.value.toString() != "State" &&
                    rowData?.value.toString() != "state"
                ? rowData?.value.toString()
                : null;
          }
        }
        if (location.countryName != null ||
            location.stateName != null ||
            location.cityName != null) {
          locationData.add(location);
        }
      }
    }
    return locationData;
  }
}

class WeatherService {
  Future<List<WeatherReport>?> fetchWeatherReport(
      List<LocationData> data) async {
    try {
      List<WeatherReport> weatherReports = [];
      for (LocationData element in data) {
        Response response = await Dio().get(
            "https://api.openweathermap.org/data/2.5/weather?q=${element.countryName},${element.stateName},${element.cityName}&appid=ee2463156ad81a4fe06772f80f7500dd");
        if (response.statusCode == 200) {
          WeatherReport weatherReport = WeatherReport(
            location:
                "${element.countryName},${element.stateName},${element.cityName}",
            weather: response.data["weather"][0]["main"],
            description: response.data["weather"][0]["description"],
            icon: response.data["weather"][0]["icon"],
          );
          weatherReports.add(weatherReport);
        }
      }
      return weatherReports;
    } catch (e) {
      rethrow;
    }
  }
}
