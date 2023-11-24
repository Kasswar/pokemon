import 'package:dio/dio.dart';
import 'package:pokemon/core/config/typedef.dart';
import 'package:pokemon/core/constants/app_api.dart';
import 'package:pokemon/core/functions/get_characters_function.dart';
import 'package:pokemon/core/utils/api_service.dart';
import 'package:pokemon/features/home/data/models/character_model.dart';
import 'package:pokemon/features/home/data/models/details_model.dart';

abstract class CharactersRemoteDataSource {
  Future<List<CharacterModel>> getCharacters(QueryParam params);
  Future<DetailsModel> getCharactersDetails(QueryParam params);
}

class CharactersRemoteDataSourceImplement
    implements CharactersRemoteDataSource {
  final apiService = ApiService(Dio());
  @override
  Future<List<CharacterModel>> getCharacters(QueryParam params) async {
    Map<String, dynamic> data = await apiService.get(
        "${AppApi.baseUrl}?offset=${params['startIndex']}&limit=${params['perPage']}");
    return getCharactersList(data);
  }

  @override
  Future<DetailsModel> getCharactersDetails(QueryParam params) async {
    Map<String, dynamic> data = await apiService.get("${params['detailsUrl']}");
    return DetailsModel.fromJson(data);
  }
}
