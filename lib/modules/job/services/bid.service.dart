import 'package:dio/dio.dart';
import 'package:project/config/inject.config.dart';
import 'package:project/core/exceptions/connection_timed_out.exception.dart';
import 'package:project/core/exceptions/not_found.exception.dart';
import 'package:project/core/exceptions/server_side_validation.exception.dart';
import 'package:project/core/exceptions/unexpected.exception.dart';
import 'package:project/modules/job/models/bid.model.dart';

class BidService {
  final _dio = inject.get<Dio>();
  final String bidsBaseUrl;

  BidService(this.bidsBaseUrl);

  Dio initializeDio() {
    final dioOptions = _dio.options;
    dioOptions.baseUrl = bidsBaseUrl;
    _dio.options = dioOptions;
    return _dio;
  }

  Future<List<Bid>> getBids(int jobId, int index, int count) async => initializeDio()
      .get('/Job/Bids', queryParameters: {'jobId': jobId, 'index': index, 'count': count})
      .then((response) => (response.data['bids'] as List<dynamic>)
      .map((json) => Bid.fromJson(json))
      .toList())
      .catchError((error) {
    switch (error.runtimeType) {
      case DioError:
        switch (error.response?.statusCode) {
          case null:
            throw ConnectionTimedOutException();
          case 400:
            throw ServerSideValidationException.fromJson(
              error.response.data,
            );
          case 404:
            throw NotFoundException();
          default:
            throw UnexpectedException();
        }
      default:
        throw UnexpectedException();
    }
  });
}
