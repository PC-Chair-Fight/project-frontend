import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:project/config/app.config.dart';

class AppProvider extends ChangeNotifier {
  final BuildContext context;

  AppProvider(this.context);

  void notify(String message, {NotificationType? notificationType}) {
    if (AppConfig.of(context)?.logProviders ?? false) {
      var logMessage = message;
      switch (notificationType) {
        case NotificationType.Cancel:
          logMessage += ' - Cancel';
          break;
        case NotificationType.Start:
          logMessage += ' - Start';
          break;
        case NotificationType.Success:
          logMessage += ' - Success';
          break;
        case NotificationType.Failure:
          logMessage += ' - Failure';
          break;
        default:
          break;
      }
      log(
        logMessage,
        name: runtimeType.toString(),
        time: DateTime.now(),
      );
    }
    notifyListeners();
  }
}

enum NotificationType {
  Cancel,
  Start,
  Success,
  Failure,
}
