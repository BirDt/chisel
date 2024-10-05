import 'package:chisel/Screens/Editor/widgets/drawer/widgets/card_deck.dart';
import 'package:chisel/Screens/Editor/widgets/drawer/widgets/dice_roller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

import '../../../../Services/settings_service.dart';

class SidebarTools extends StatefulWidget {
  final QuillController controller;
  const SidebarTools({super.key, required this.controller});

  @override
  State<SidebarTools> createState() => _SidebarToolsState();
}

class _SidebarToolsState extends State<SidebarTools> {
  final SettingsService settingsService = SettingsService();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          settingsService.getSidebarWidgetEnabled("diceRoller", true) ? const DiceRoller() : Container(),
          settingsService.getSidebarWidgetEnabled("cardDeck", true) ? const CardDeckWidget() : Container()
        ],
      ),
    );
  }
}
