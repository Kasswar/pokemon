part of 'characters_bloc.dart';

enum CharactersStatus { loading, initial, failure, success }

class GetCharactersState {
  final bool isEndPage;
  final List<GetCharacterDetailsState> characters;
  final String msgError;
  final CharactersStatus charactersStatus;

  GetCharactersState({
    this.isEndPage = false,
    this.characters = const [],
    this.msgError = "",
    this.charactersStatus = CharactersStatus.initial,
  });

  GetCharactersState copyWith({
    bool? isEndPage,
    List<GetCharacterDetailsState>? characters,
    String? msgError,
    CharactersStatus? charactersStatus,
  }) {
    return GetCharactersState(
      isEndPage: isEndPage ?? this.isEndPage,
      characters: characters ?? this.characters,
      msgError: msgError ?? this.msgError,
      charactersStatus: charactersStatus ?? this.charactersStatus,
    );
  }
}

enum CharactersDetailsStatus { initial, loading, failure, success }

class GetCharacterDetailsState {
  final DetailsModel? details;
  final String errorMsg;
  final String url;
  final CharactersDetailsStatus charactersDetailsStatus;

  GetCharacterDetailsState({
    this.details,
    this.errorMsg = "",
    this.url = "",
    this.charactersDetailsStatus = CharactersDetailsStatus.initial,
  });

  GetCharacterDetailsState copyWith(
      {DetailsModel? details,
      String? errorMsg,
      String? url,
      CharactersDetailsStatus? charactersDetailsStatus}) {
    return GetCharacterDetailsState(
      details: details ?? this.details,
      errorMsg: errorMsg ?? this.errorMsg,
      url: url ?? this.url,
      charactersDetailsStatus:
          charactersDetailsStatus ?? this.charactersDetailsStatus,
    );
  }
}
