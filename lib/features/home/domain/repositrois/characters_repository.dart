import 'package:pokemon/core/config/typedef.dart';
import 'package:pokemon/features/home/data/models/character_model.dart';
import 'package:pokemon/features/home/data/models/details_model.dart';

abstract class CharactersRepository {
  DataResponse<List<CharacterModel>> getCharacters(QueryParam params);
  DataResponse<DetailsModel> getCharacterDetails(QueryParam params);
}
