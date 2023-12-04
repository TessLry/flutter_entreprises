import 'dart:convert';

import 'package:flutter_entreprises/models/company.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesRepository {
  Future<void> saveCompanies(List<Company> companies) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String> listJson = [];
    for (final Company company in companies) {
      listJson.add(jsonEncode(company.toJson()));
    }
    prefs.setStringList('companies', listJson);
  }

  Future<List<Company>> loadCompanies() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String> listJson = prefs.getStringList('companies') ?? [];
    final List<Company> companies = [];
    for (final String json in listJson) {
      final Map<String, dynamic> map = jsonDecode(json);
      final Company company = Company.fromJson(map);
      companies.add(company);
    }
    return companies;
  }
}
