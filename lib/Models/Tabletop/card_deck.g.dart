// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_deck.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CardDeck _$CardDeckFromJson(Map<String, dynamic> json) => CardDeck(
      deck: (json['deck'] as List<dynamic>)
          .map((e) => PlayingCard.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..hand = (json['hand'] as List<dynamic>)
          .map((e) => PlayingCard.fromJson(e as Map<String, dynamic>))
          .toList()
      ..discard = (json['discard'] as List<dynamic>)
          .map((e) => PlayingCard.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$CardDeckToJson(CardDeck instance) => <String, dynamic>{
      'deck': instance.deck,
      'hand': instance.hand,
      'discard': instance.discard,
    };

PlayingCard _$PlayingCardFromJson(Map<String, dynamic> json) => PlayingCard(
      rank: json['rank'] as String,
      suit: json['suit'] as String,
      displaySuit: json['displaySuit'] as bool? ?? true,
    );

Map<String, dynamic> _$PlayingCardToJson(PlayingCard instance) =>
    <String, dynamic>{
      'rank': instance.rank,
      'suit': instance.suit,
      'displaySuit': instance.displaySuit,
    };
