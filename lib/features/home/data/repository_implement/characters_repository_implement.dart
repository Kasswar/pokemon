import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:pokemon/core/config/typedef.dart';
import 'package:pokemon/core/errors/failure.dart';
import 'package:pokemon/features/home/data/data_sources/characters_remote_data_source.dart';
import 'package:pokemon/features/home/data/models/character_model.dart';
import 'package:pokemon/features/home/data/models/details_model.dart';
import 'package:pokemon/features/home/domain/repositrois/characters_repository.dart';

class CharactersRepositoryImplement implements CharactersRepository {
  final charactersRemoteDataSourceImplement =
      CharactersRemoteDataSourceImplement();
  @override
  DataResponse<List<CharacterModel>> getCharacters(QueryParam params) async {
    try {
      List<CharacterModel> characters =
          await charactersRemoteDataSourceImplement.getCharacters(params);
      return right(characters);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(message: e.toString()));
    }
  }

  @override
  DataResponse<DetailsModel> getCharacterDetails(QueryParam params) async {
    try {
      DetailsModel characterDetails = await charactersRemoteDataSourceImplement
          .getCharactersDetails(params);
      return right(characterDetails);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(message: e.toString()));
    }
  }
}
