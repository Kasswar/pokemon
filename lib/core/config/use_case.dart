import 'package:pokemon/core/config/typedef.dart';

abstract class UseCase<Type, P extends Param> {
  DataResponse<Type> call(P params);
}

mixin Param {
  QueryParam getParams() => {};
}

class NoParam with Param {}
