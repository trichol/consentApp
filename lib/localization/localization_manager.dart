// lib/localization/localization_manager.dart

import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class LocalizationManager {
  // Cache pour les fichiers de langue
  final Map<String, Map<String, String>> _localizedStringsCache = {};

  // Langue par défaut
  String _currentLanguage = 'en';

  // Singleton pour un accès global
  static final LocalizationManager _instance = LocalizationManager._internal();

  factory LocalizationManager() {
    return _instance;
  }

  LocalizationManager._internal();

  // Méthode pour charger les fichiers JSON de langue
  Future<void> loadLanguage(String languageCode) async {
    if (_localizedStringsCache.containsKey(languageCode)) {
      _currentLanguage = languageCode;
      return; // Langue déjà en cache, pas besoin de recharger
    }
    String jsonString = await rootBundle.loadString('assets/langage/$languageCode.json');
    Map<String, dynamic> jsonMap = jsonDecode(jsonString);
    _localizedStringsCache[languageCode] = jsonMap.map((key, value) => MapEntry(key, value.toString()));
    _currentLanguage = languageCode;
  }

  // Accéder aux chaînes localisées
  String getString(String key) {
    return _localizedStringsCache[_currentLanguage]?[key] ?? '[$key]';
  }

  // Obtenir la langue actuelle
  String get currentLanguage => _currentLanguage;
}
