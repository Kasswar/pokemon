import 'package:pokemon/features/home/data/models/character_model.dart';

List<CharacterModel> getCharactersList(Map<String, dynamic> data) {
  List<CharacterModel> characters = [];
  for (var character in data['results']) {
    characters.add(CharacterModel.fromJson(character));
  }
  return characters;
}
