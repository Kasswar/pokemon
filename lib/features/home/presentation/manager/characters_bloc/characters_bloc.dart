import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:pokemon/features/home/data/models/details_model.dart';
import 'package:pokemon/features/home/data/repository_implement/characters_repository_implement.dart';
import 'package:pokemon/features/home/domain/use_cases/characters_usecase.dart';
part 'characters_event.dart';
part 'characters_state.dart';

class CharactersBloc extends Bloc<CharactersEvent, GetCharactersState> {
  final _perPage = 10;
  final _charactersUseCase =
      CharactersUseCase(charactersRepository: CharactersRepositoryImplement());
  final _characterDetailsUseCase = CharacterDetailsUseCase(
      charactersRepository: CharactersRepositoryImplement());
  CharactersBloc() : super(GetCharactersState()) {
    on<GetCharactersEvent>(
      _mapGetCharactersState,
      transformer: droppable(),
    );
    on<GetCharacterDetailsEvent>(
      _mapGetCharacterDetailsState,
      transformer: sequential(),
    );
  }
  Future<void> _mapGetCharactersState(
      GetCharactersEvent event, Emitter<GetCharactersState> emit) async {
    if (state.charactersStatus == CharactersStatus.initial || event.isReload) {
      emit(state.copyWith(charactersStatus: CharactersStatus.loading));
      final result = await _charactersUseCase(CharactersParams(0, _perPage));
      result.fold((failure) {
        emit(state.copyWith(
            charactersStatus: CharactersStatus.failure,
            msgError: failure.message));
      }, (characters) {
        List<GetCharacterDetailsState> characterDetailsList = [];
        for (var item in characters) {
          characterDetailsList.add(GetCharacterDetailsState(
            url: item.url!,
            charactersDetailsStatus: CharactersDetailsStatus.initial,
          ));
        }
        emit(state.copyWith(
          isEndPage: characters.length < _perPage,
          characters: characterDetailsList,
          charactersStatus: CharactersStatus.success,
        ));
        for (var item in characters) {
          add(GetCharacterDetailsEvent(url: item.url!));
        }
      });
    } else if (!state.isEndPage) {
      
      emit(state.copyWith(charactersStatus: CharactersStatus.loading));
      final result = await _charactersUseCase(
          CharactersParams(state.characters.length, _perPage));
      result.fold(
          (failure) => emit(
                state.copyWith(
                    charactersStatus: CharactersStatus.failure,
                    msgError: failure.message),
              ), (characters) {
        List<GetCharacterDetailsState> characterDetailsList = [];
        for (var item in characters) {
          characterDetailsList.add(GetCharacterDetailsState(
            url: item.url!,
            charactersDetailsStatus: CharactersDetailsStatus.initial,
          ));
        }
        emit(
          state.copyWith(
            isEndPage: characters.length < _perPage,
            characters: List.of(state.characters)..addAll(characterDetailsList),
            charactersStatus: CharactersStatus.success,
          ),
        );
        for (var item in characters) {
          add(GetCharacterDetailsEvent(url: item.url!));
        }
      });
    }
  }

  Future<void> _mapGetCharacterDetailsState(
      GetCharacterDetailsEvent event, Emitter<GetCharactersState> emit) async {
    for (int i = 0; i < state.characters.length; i++) {
      if (event.url == state.characters[i].url) {
        var localList = List.of(state.characters);

        localList[i] = localList[i]
            .copyWith(charactersDetailsStatus: CharactersDetailsStatus.loading);
        print("${localList[i].charactersDetailsStatus} $i");

        emit(state.copyWith(characters: localList));
        var result = await _characterDetailsUseCase(
            CharacterDetailsParams(url: event.url));
        result.fold((failure) {
          var localList = List.of(state.characters);
          localList[i] = localList[i].copyWith(
            charactersDetailsStatus: CharactersDetailsStatus.failure,
            errorMsg: failure.message,
          );
          emit(state.copyWith(characters: localList));
        }, (details) {
          print('+++++++++++++++++++++++++++++++');
          print("${details.name!} 1");
          var localList = List.of(state.characters);
          //print("${localList[i].charactersDetailsStatus} $i");
          localList[i] = localList[i].copyWith(
            details: details,
            charactersDetailsStatus: CharactersDetailsStatus.success,
          );
          print('=====================================');
          //print(localList[i].details!.name);
          emit(state.copyWith(characters: localList));
        });
      }
    }
  }
}
