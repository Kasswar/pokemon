import 'package:dio/dio.dart';

abstract class Failure {
  final String message;
  Failure({required this.message});
}

class ServerFailure extends Failure {
  ServerFailure({required super.message});
  factory ServerFailure.fromDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(message: "Connection Timeout With Api Server");
      case DioExceptionType.sendTimeout:
        return ServerFailure(message: "Send Timeout With Api Server");
      case DioExceptionType.receiveTimeout:
        return ServerFailure(message: "Receive Timeout With Api Server");
      case DioExceptionType.badCertificate:
        return ServerFailure(message: "badCertificate With Api Server");
      case DioExceptionType.badResponse:
        ServerFailure.fromResponse(e.response!.statusCode!, e.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure(message: "Request to Api Server Was Canceled");
      case DioExceptionType.connectionError:
        return ServerFailure(message: "No Internet Connection");
      case DioExceptionType.unknown:
        return ServerFailure(
            message: "Opps There Was An Error, Plears Try Again");
    }
    return ServerFailure(message: "Opps There Was An Error, Plears Try Again");
  }
  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 404) {
      return ServerFailure(
          message: "Your Request Was Not Found, Please Try Later");
    } else if (600 > statusCode && statusCode > 500) {
      ServerFailure(message: "There Is Aproblem With Server, Please Try Later");
    } else if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(message: response['error']['message']);
    }
    return ServerFailure(message: "There Is An Error, Please Try Again");
  }
}
