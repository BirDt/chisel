import 'package:chisel/Services/settings_service.dart';
import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

import '../../Common/widgets/chisel_app_bar.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final SettingsService settingsService = SettingsService();

  @override
  Widget build(BuildContext context) {
    SettingsThemeData settingsThemeData = SettingsThemeData(
        settingsListBackground: Theme.of(context).colorScheme.surface,
        settingsSectionBackground: Theme.of(context).colorScheme.primary);

    return Scaffold(
      bottomNavigationBar: const ChiselAppBar(children: []),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        shape: const CircleBorder(),
        child: const Icon(Icons.arrow_back_ios_new_outlined),
      ),
      body: SafeArea(
        child: SettingsList(
          contentPadding: const EdgeInsets.all(8.0),
            applicationType: ApplicationType.material,
            lightTheme: settingsThemeData,
            darkTheme: settingsThemeData,
            sections: [
              SettingsSection(
                title: const Text("Editor Sidebar Widgets"),
                tiles: [
                  SettingsTile.switchTile(
                      initialValue: settingsService.getSidebarWidgetEnabled(
                          "diceRoller", true),
                      onToggle: (bool enabled) {
                        settingsService.setToolbarWidgetEnabled(
                            "diceRoller", enabled);
                        setState(() {});
                      },
                      activeSwitchColor: Theme.of(context).colorScheme.onPrimary,
                      title: const Text("Dice Roller")
                  ),
                  SettingsTile.switchTile(
                      initialValue: settingsService.getSidebarWidgetEnabled(
                          "cardDeck", true),
                      onToggle: (bool enabled) {
                        settingsService.setToolbarWidgetEnabled(
                            "cardDeck", enabled);
                        setState(() {});
                      },
                      activeSwitchColor: Theme.of(context).colorScheme.onPrimary,
                      title: const Text("Standard Card Deck")
                  ),
                ],
              )
            ]),
      ),
    );
  }
}
