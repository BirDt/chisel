import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:flutter/services.dart';

import '../../../../../Services/settings_service.dart';

class DiceRoller extends StatefulWidget {
  final bool embedded;
  const DiceRoller({super.key, this.embedded = false});

  @override
  State<DiceRoller> createState() => _DiceRollerState();
}

class _DiceRollerState extends State<DiceRoller> {
  final SettingsService settingsService = SettingsService();

  int diceRollers = 1;

  @override
  void initState() {
    super.initState();
    if (!widget.embedded) {
      diceRollers = settingsService.getSidebarWidgetIntPropertyState(
          "diceRoller", "diceRollers", 0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,

          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(Ionicons.dice_outline),
                const Padding(
                  padding: EdgeInsets.only(left: 50.0, right: 30),
                  child: Text("Roll Dice"),
                ),
                IconButton(
                    onPressed: () {
                      setState(() {
                        diceRollers += 1;
                        if (!widget.embedded) {
                          settingsService.setSidebarWidgetIntPropertyState(
                              "diceRoller", "diceRollers", diceRollers);
                        }
                      });
                    },
                    icon: const Icon(Icons.add)),
                IconButton(
                    onPressed: () {
                      setState(() {
                        if (diceRollers > 1) {
                          diceRollers -= 1;
                          if (!widget.embedded) {
                            settingsService.setSidebarWidgetIntPropertyState(
                                "diceRoller", "diceRollers", diceRollers);
                          }
                        }
                      });
                    },
                    icon: const Icon(Icons.remove))
              ],
            ),
            Column(
              children: List.generate(diceRollers, (int index) {
                return DiceRollerListTile(
                    index: index, settingsService: settingsService);
              }),
            )
            //DiceRollerListTile(settingsService: settingsService)
          ],
        ),
      ),
    );
  }
}

class DiceRollerListTile extends StatefulWidget {
  final bool embedded;
  final int index;
  final SettingsService settingsService;
  const DiceRollerListTile(
      {super.key,
      this.embedded = false,
      required this.index,
      required this.settingsService});

  @override
  State<DiceRollerListTile> createState() => _DiceRollerListTileState();
}

class _DiceRollerListTileState extends State<DiceRollerListTile> {
  final _controller = TextEditingController();

  int sides = 6;
  int? lastRoll;

  String widgetName = "diceRoller";

  @override
  void initState() {
    super.initState();

    widgetName = "diceRoller.${widget.index}";

    if (!widget.embedded) {
      sides = widget.settingsService
          .getSidebarWidgetIntPropertyState(widgetName, "sides", 6);
      int tLastRoll = widget.settingsService
          .getSidebarWidgetIntPropertyState(widgetName, "lastRoll", 0);
      lastRoll = tLastRoll > 0 ? tLastRoll : null;
    }
    _controller.text = "$sides";
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: TextField(
            controller: _controller,
            onChanged: (String val) {
              setState(() {
                if (_controller.text.isNotEmpty) {
                  sides = int.parse(_controller.text);
                  if (!widget.embedded) {
                    widget.settingsService.setSidebarWidgetIntPropertyState(
                        widgetName, "sides", sides);
                  }
                }
              });
            },
            decoration: InputDecoration(
                labelText: "Sides",
                errorText: _controller.text.isEmpty ? "No sides!" : null),
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          child: Column(
            children: [
              Text("Last Roll", style: Theme.of(context).textTheme.bodySmall),
              Padding(
                padding: const EdgeInsets.only(top: 6.0, bottom: 6.0),
                child: Text(
                  "${lastRoll ?? ""}",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              )
            ],
          ),
        ),
        FilledButton(
            onPressed: () {
              var result = Random().nextInt(sides) + 1;
              setState(() {
                lastRoll = result;
                if (!widget.embedded) {
                  widget.settingsService.setSidebarWidgetIntPropertyState(
                      widgetName, "lastRoll", lastRoll ?? 0);
                }
              });
            },
            child: const Text('Roll')),
      ],
    );
  }
}
