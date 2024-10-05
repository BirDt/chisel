import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../../../Services/settings_service.dart';
import '../../../../../Models/Tabletop/card_deck.dart';

class CardDeckWidget extends StatefulWidget {
  final bool embedded;
  const CardDeckWidget({super.key, this.embedded = false});

  @override
  State<CardDeckWidget> createState() => _CardDeckWidgetState();
}

class _CardDeckWidgetState extends State<CardDeckWidget> {
  final SettingsService settingsService = SettingsService();
  CardDeck? deck;

  @override
  void initState() {
    super.initState();
    var savedDeck = jsonDecode(settingsService.getSidebarWidgetStringPropertyState(
        "cardDeck", "deck", "[]"));

    if(savedDeck.length == 0 || widget.embedded) {
      deck = CardDeck.standard(
          jokers: settingsService.getSidebarWidgetBoolPropertyState(
              "cardDeck", "jokers", true));
    }
    else {
      deck = CardDeck.fromJson(savedDeck);
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
            const Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.copy_all_outlined),
                Padding(
                  padding: EdgeInsets.only(left: 44.0, right: 30),
                  child: Text("Card Deck"),
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    Column(
                      children: [
                        Text("Cards in Deck",
                            style: Theme.of(context).textTheme.bodySmall),
                        Padding(
                          padding: const EdgeInsets.only(top: 6.0, bottom: 6.0),
                          child: Text(
                            "${deck!.deck.length ?? ""}",
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        )
                      ],
                    ),
                    const Spacer(),
                    Column(
                      children: [
                        Text("Cards Discarded",
                            style: Theme.of(context).textTheme.bodySmall),
                        Padding(
                          padding: const EdgeInsets.only(top: 6.0, bottom: 6.0),
                          child: Text(
                            "${deck!.discard.length ?? ""}",
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox.fromSize(
                  size: const Size.fromHeight(75),
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: deck!.hand.length,
                      itemBuilder: (BuildContext context, int index) {
                        final item = deck!.hand[index];

                        return SizedBox.fromSize(
                          size: const Size(50, 75),
                          child: Card(
                            color: Theme.of(context).colorScheme.secondary,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 6.0),
                                  child: Text(item.rank,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge),
                                ),
                                item.displaySuit
                                    ? Padding(
                                        padding:
                                            const EdgeInsets.only(top: 6.0),
                                        child: Text(
                                          item.suit,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall,
                                        ),
                                      )
                                    : Container()
                              ],
                            ),
                          ),
                        );
                      }),
                ),
                Row(
                  children: [
                    FilledButton(
                        onPressed: () {
                          setState(() {
                            deck!.drawOne();
                            if (!widget.embedded) {
                              settingsService.setSidebarWidgetStringPropertyState(
                                  "cardDeck", "deck", jsonEncode(deck));
                            }
                          });
                        },
                        child: const Text("Draw")),
                    const Spacer(),
                    FilledButton(
                        onPressed: () {
                          setState(() {
                            deck!.discardHand();
                            if (!widget.embedded) {
                              settingsService.setSidebarWidgetStringPropertyState(
                                  "cardDeck", "deck", jsonEncode(deck));
                            }
                          });
                        },
                        child: const Text("Discard")),
                    const Spacer(),
                    FilledButton(
                        onPressed: () {
                          setState(() {
                            deck!.reset();
                            if (!widget.embedded) {
                              settingsService.setSidebarWidgetStringPropertyState(
                                  "cardDeck", "deck", jsonEncode(deck));
                            }
                          });
                        },
                        child: const Text("Reset"))
                  ],
                )
              ],
            )
            //DiceRollerListTile(settingsService: settingsService)
          ],
        ),
      ),
    );
  }
}
