import 'package:dio/dio.dart';
import 'package:project/config/inject.config.dart';
import 'package:project/modules/user/models/user.model.dart';

class UserService {
  final _dio = inject.get<Dio>();
  final String userBaseUrl;

  UserService(this.userBaseUrl);

  Dio initializeDio(){
    final dioOptions = _dio.options;
    dioOptions.baseUrl = userBaseUrl;
    _dio.options = dioOptions;
    return _dio;
  }

  //TODO replace mock
  Future<User> getUser(int userId) async =>
      User(
        id: 69,
        firstName: 'Vlad-Rares',
        lastName: 'Raducu',
        dateOfBirth: DateTime.utc(2000, 6, 8),
        email: 'vlad101vlad@gmail.com',
        profilePicture: 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/40/Mangekyou_Sharingan_Kakashi.svg/2048px-Mangekyou_Sharingan_Kakashi.svg.png'
      );
}
