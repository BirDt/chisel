import 'dart:developer';

import 'package:chisel/Models/Notes/Notebooks/notebook.dart';
import 'package:chisel/Services/settings_service.dart';
import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

import '../../Common/widgets/chisel_app_bar.dart';
import '../../Services/Database Services/notes_service.dart';

class SettingsScreen extends StatefulWidget {
  final Notebook? notebook;
  const SettingsScreen({super.key, this.notebook});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final NotesService notesService = NotesService();
  final SettingsService settingsService = SettingsService();

  final _controller = TextEditingController();

  Notebook? currentNotebook;

  @override
  void initState() {
    super.initState();

    currentNotebook = widget.notebook;

    if(currentNotebook!.password != null){
      _controller.text = currentNotebook!.password!;
    }

    _controller.addListener(() async {
      log("NEW TEXT: ${_controller.text}");
      if (_controller.text.isNotEmpty) {
        log("TEXT NOT EMPTY");
        currentNotebook!.password = _controller.text;
        await notesService.putNotebook(currentNotebook!);
      } else {
        log("TEXT NULL");
        currentNotebook!.password = null;
        await notesService.putNotebook(currentNotebook!);
      }
    });
  }

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
              widget.notebook != null
                  ? SettingsSection(
                      title: const Text("Notebook Settings"),
                      tiles: [
                          CustomSettingsTile(
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.only(
                                    start: 24,
                                    end: 24,
                                    bottom: 19,
                                    top: 19,
                                  ),
                                  child: Text("Notebook Password",
                                      style: TextStyle(
                                        color: const SettingsThemeData()
                                            .settingsTileTextColor,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400,
                                      )),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.only(
                                      start: 0, end: 0),
                                  child: SizedBox(
                                      width: 160,
                                      height: 40,
                                      child: TextField(
                                        controller: _controller,
                                        onChanged: (newValue) => {
                                          setState(() {
                                            if (_controller.text.isNotEmpty) {
                                              currentNotebook!.password =
                                                  newValue;
                                              notesService.putNotebook(
                                                  currentNotebook!);
                                            } else {
                                              currentNotebook!.password = null;
                                              notesService.putNotebook(
                                                  currentNotebook!);
                                            }
                                          })
                                        },
                                      )),
                                ),
                              ],
                            ),
                          )
                        ])
                  : null,
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
                      activeSwitchColor:
                          Theme.of(context).colorScheme.onPrimary,
                      title: const Text("Dice Roller")),
                  SettingsTile.switchTile(
                      initialValue: settingsService.getSidebarWidgetEnabled(
                          "cardDeck", true),
                      onToggle: (bool enabled) {
                        settingsService.setToolbarWidgetEnabled(
                            "cardDeck", enabled);
                        setState(() {});
                      },
                      activeSwitchColor:
                          Theme.of(context).colorScheme.onPrimary,
                      title: const Text("Standard Card Deck")),
                ],
              )
            ].nonNulls.toList()),
      ),
    );
  }
}
