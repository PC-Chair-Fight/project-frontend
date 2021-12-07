import 'package:flutter/src/widgets/framework.dart';
import 'package:project/config/inject.config.dart';
import 'package:project/core/app_provider.dart';
import 'package:project/core/exceptions/base.exception.dart';
import 'package:project/modules/user/models/user.model.dart';
import 'package:project/modules/user/services/user.service.dart';

class UserProfileProvider extends AppProvider{
  final _userService = inject.get<UserService>();
  User? _activeUser;
  bool _loading = false;

  BaseException? _error;

  UserProfileProvider(BuildContext context) : super(context);

  User? get activeUser => _activeUser;

  BaseException? get error => _error;

  bool get loading => _loading;

  Future<void> getUser(int userId) async{
    _loading = true;
    _error = null;
    notify('getUser', notificationType: NotificationType.Start);
    try{
      _activeUser = await _userService.getUser(userId);
      _loading = false;
      notify('getUser', notificationType: NotificationType.Success);
    } on BaseException catch (e) {
      _error = e;
      _loading = false;
      notify('getUser', notificationType: NotificationType.Failure);
    }
  }
}