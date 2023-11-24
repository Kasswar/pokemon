part of 'characters_bloc.dart';

@immutable
sealed class CharactersEvent {}

class GetCharactersEvent extends CharactersEvent {
  final bool isReload;

  GetCharactersEvent({this.isReload = false});
}

class GetCharacterDetailsEvent extends CharactersEvent {
  final String url;

  GetCharacterDetailsEvent({this.url = ""});
}
