import 'package:dio/dio.dart';

abstract class Failures {
  final String errorMessage;

  const Failures({required this.errorMessage});
}

class ServerFailure extends Failures {
  ServerFailure({required super.errorMessage});
  factory ServerFailure.fromDioException(DioException error) {
    String errorMessage = 'there was an error';
    switch (error.type) {
      case DioExceptionType.badCertificate:
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            int.parse(error.response!.statusMessage!), error.response!.data);
      case DioExceptionType.receiveTimeout:
        errorMessage = 'server error';
        break;
      case DioExceptionType.cancel:
      case DioExceptionType.connectionError:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.connectionTimeout:
        errorMessage = 'Please check the internet and send again';
        break;
      case DioExceptionType.unknown:
        errorMessage = 'unKnown error';
        break;
      default:
        return ServerFailure(errorMessage: 'There was an error , Please try again');
    }
    return ServerFailure(errorMessage: errorMessage);
  }

  factory ServerFailure.fromResponse(int statescCode, dynamic json) {
    if (statescCode >= 400 && statescCode <= 403) {
      return ServerFailure(errorMessage: json['error']['message']);
    } else if (statescCode == 404) {
      return ServerFailure(errorMessage: 'Not found , Try again');
    } else if (statescCode == 500) {
      return ServerFailure(errorMessage: 'Server error');
    } else {
      return ServerFailure(errorMessage: 'There was an error , Please try again');
    }
  }
}
