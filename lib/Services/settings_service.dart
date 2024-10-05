import 'package:shared_preferences/shared_preferences.dart';

class SettingsService {
  SharedPreferences? preferences;

  static final SettingsService _singleton = SettingsService._internal();

  /// Default constructor.
  factory SettingsService() {
    return _singleton;
  }

  SettingsService._internal();

  Future<void> ensureInitialized() async {
    preferences = await SharedPreferences.getInstance();
  }

  int getSidebarWidgetIntPropertyState(String widgetId, String propertyName, int fallback) {
    return preferences!.getInt("sidebar.widget.$widgetId.$propertyName") ?? fallback;
  }

  Future setSidebarWidgetIntPropertyState(String widgetId, String propertyName, int state) {
    return preferences!.setInt("sidebar.widget.$widgetId.$propertyName", state);
  }

  bool getSidebarWidgetBoolPropertyState(String widgetId, String propertyName, bool fallback) {
    return preferences!.getBool("sidebar.widget.$widgetId.$propertyName") ?? fallback;
  }

  Future setSidebarWidgetBoolPropertyState(String widgetId, String propertyName, bool state) {
    return preferences!.setBool("sidebar.widget.$widgetId.$propertyName", state);
  }

  String getSidebarWidgetStringPropertyState(String widgetId, String propertyName, String fallback) {
    return preferences!.getString("sidebar.widget.$widgetId.$propertyName") ?? fallback;
  }

  Future setSidebarWidgetStringPropertyState(String widgetId, String propertyName, String state) {
    return preferences!.setString("sidebar.widget.$widgetId.$propertyName", state);
  }

  bool getSidebarWidgetEnabled(String widgetId, bool fallback) {
    return preferences!.getBool("sidebar.widget.$widgetId") ?? fallback;
  }

  Future setToolbarWidgetEnabled(String widgetId, bool enabled) {
    return preferences!.setBool("sidebar.widget.$widgetId", enabled);
  }
}