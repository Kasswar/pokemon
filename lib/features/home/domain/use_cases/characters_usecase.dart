import 'package:pokemon/core/config/typedef.dart';
import 'package:pokemon/core/config/use_case.dart';
import 'package:pokemon/features/home/data/models/character_model.dart';
import 'package:pokemon/features/home/data/models/details_model.dart';
import 'package:pokemon/features/home/domain/repositrois/characters_repository.dart';

class CharactersUseCase
    implements UseCase<List<CharacterModel>, CharactersParams> {
  final CharactersRepository charactersRepository;

  CharactersUseCase({required this.charactersRepository});

  @override
  DataResponse<List<CharacterModel>> call(CharactersParams params) async {
    return charactersRepository.getCharacters(params.getParam());
  }
}

class CharacterDetailsUseCase
    implements UseCase<DetailsModel, CharacterDetailsParams> {
  final CharactersRepository charactersRepository;

  CharacterDetailsUseCase({required this.charactersRepository});

  @override
  DataResponse<DetailsModel> call(CharacterDetailsParams params) async {
    return charactersRepository.getCharacterDetails(params.getParam());
  }
}

class CharactersParams with Param {
  final int? startIndex;
  final int? perPage;
  CharactersParams(this.startIndex, this.perPage);

  QueryParam getParam() => {
        if (startIndex != null) 'startIndex': startIndex.toString(),
        if (perPage != null) 'perPage': perPage.toString(),
      };
}

class CharacterDetailsParams with Param {
  final String? url;

  CharacterDetailsParams({required this.url});

  QueryParam getParam() => {
        if (url != null) 'detailsUrl': url.toString(),
      };
}
