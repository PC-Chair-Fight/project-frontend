import 'package:dio/dio.dart';
import 'package:project/config/inject.config.dart';
import 'package:project/modules/job/models/bid.model.dart';
import 'package:project/modules/user/models/user.model.dart';
import 'package:project/modules/worker/models/worker.model.dart';

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

  // TODO replace mock
  Future<List<Bid>> getBids(int jobId) async => [
        Bid(
          id: 1,
          sum: 120,
          worker: Worker(
            user: User(
                firstName: 'Rhiana',
                lastName: 'McDonnell',
                profilePicture: 'https://picsum.photos/id/1/600'),
          ),
        ),
        Bid(
          id: 2,
          sum: 121,
          worker: Worker(
            user: User(
                firstName: 'Elijah',
                lastName: 'O\'Ryan',
                profilePicture: 'https://picsum.photos/id/2/600'),
          ),
        ),
        Bid(
          id: 3,
          sum: 122,
          worker: Worker(
            user: User(
                firstName: 'Ibrahim',
                lastName: 'Mckay',
                profilePicture: 'https://picsum.photos/id/3/600'),
          ),
        ),
        Bid(
          id: 4,
          sum: 123,
          worker: Worker(
            user: User(
                firstName: 'Jolie',
                lastName: 'Moss',
                profilePicture: 'https://picsum.photos/id/4/600'),
          ),
        ),
      ];
}
