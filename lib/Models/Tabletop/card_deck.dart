import 'dart:core';

import 'package:json_annotation/json_annotation.dart';

part 'card_deck.g.dart';

@JsonSerializable()
class CardDeck {
  List<PlayingCard> deck;
  List<PlayingCard> hand = [];
  List<PlayingCard> discard = [];

  CardDeck({
    required this.deck
  });

  factory CardDeck.fromJson(Map<String, dynamic> json) => _$CardDeckFromJson(json);

  Map<String, dynamic> toJson() => _$CardDeckToJson(this);

  factory CardDeck.standard({bool jokers = true}) {
    List suits = ["♥", "♦", "♠", "♣"];
    List ranks = [for(var i=1; i<11; i+=1) "$i", "J", "Q", "K"];

    List<PlayingCard> deck = [for(var x in suits) for(var y in ranks) PlayingCard(rank: y, suit: x)];
    if (jokers){
      deck.add(PlayingCard(rank: "★", suit: "Joker"));
      deck.add(PlayingCard(rank: "☆", suit: "Joker"));
    }

    deck.shuffle();

    return CardDeck(deck: deck);
  }

  void drawOne() {
    if (deck.isNotEmpty) {
      PlayingCard pulled = deck[0];
      hand.add(pulled);
      deck.remove(pulled);
    }
  }

  void discardHand(){
    discard = discard + hand;
    hand = [];
  }

  void reset(){
    deck = deck + discard + hand;
    discard = [];
    hand = [];
    deck.shuffle();
  }
}

@JsonSerializable()
class PlayingCard {
  String rank;
  String suit;
  bool displaySuit;

  PlayingCard({
   required this.rank,
   required this.suit,
    this.displaySuit = true
  });

  factory PlayingCard.fromJson(Map<String, dynamic> json) => _$PlayingCardFromJson(json);

  Map<String, dynamic> toJson() => _$PlayingCardToJson(this);


  String get displayName {
    return displaySuit ? "$rank of $suit" : rank;
  }

  String get shortName {
    return displaySuit ? "$rank$suit" : rank;
  }
}