import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  const Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(String errMessage) : super(errMessage);

  factory ServerFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with Apiserver');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with Apiserver');

      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout with Apiserver');

      case DioExceptionType.badCertificate:
        return ServerFailure('There was an error');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioError.response!.statusCode!, dioError.response!.data);

      case DioExceptionType.cancel:
        return ServerFailure('Request to Apiserver with canceled');
      case DioExceptionType.connectionError:
        return ServerFailure('There was an error');

      case DioExceptionType.unknown:
        if (dioError.message!.contains('SocketException')) {
          return ServerFailure('No internet connection');
        }
        return ServerFailure('Unexpected error ,please  again');
      default:
        return ServerFailure(' Opps There was an error ,Please try again');
    }
  }
  factory ServerFailure.fromResponse(int statuesCode, dynamic response) {
    if (statuesCode == 400 || statuesCode == 401 || statuesCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statuesCode == 404) {
      return ServerFailure('Your Request not found,Please try later !');
    } else if (statuesCode == 500) {
      return ServerFailure('Internal server error,Please try later !');
    } else {
      return ServerFailure(' Opps There was an error ,Please try again');
    }
  }
}
