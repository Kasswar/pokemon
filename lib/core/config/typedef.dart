import 'package:dartz/dartz.dart';
import 'package:pokemon/core/errors/failure.dart';

typedef QueryParam = Map<String, String>;
typedef DataResponse<Type> = Future<Either<Failure, Type>>;
