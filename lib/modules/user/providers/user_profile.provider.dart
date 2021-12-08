import 'package:flutter/src/widgets/framework.dart';
import 'package:project/config/inject.config.dart';
import 'package:project/core/app_provider.dart';
import 'package:project/core/exceptions/base.exception.dart';
import 'package:project/modules/user/models/user.model.dart';
import 'package:project/modules/user/services/user.service.dart';

class UserProfileProvider extends AppProvider {
  final _userService = inject.get<UserService>();
  User? _user;
  bool _fetchLoading = false;
  dynamic _fetchError;

  UserProfileProvider(BuildContext context) : super(context);

  User? get activeUser => _user;

  BaseException? get error => _fetchError;

  bool get loading => _fetchLoading;

  Future<void> getUser(int userId) async {
    _fetchLoading = true;
    _fetchError = null;
    notify('getUser', notificationType: NotificationType.Start);
    try {
      _user = await _userService.getUser(userId);
      _fetchLoading = false;
      notify('getUser', notificationType: NotificationType.Success);
    } on BaseException catch (e) {
      _fetchError = e;
      _fetchLoading = false;
      notify('getUser', notificationType: NotificationType.Failure);
    }
  }
}
