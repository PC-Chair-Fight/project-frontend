import 'package:flutter/material.dart';
import 'package:project/core/app_provider.dart';

class JobFilterProvider extends AppProvider {
  DateTimeRange? _postDateRange;

  DateTimeRange? get postDateRange => _postDateRange;

  JobFilterProvider(BuildContext ctx) : super(ctx);

  void setPostDateRange(DateTimeRange? value) {
    _postDateRange = value;
    notify('setPostDateRange', notificationType: NotificationType.Success);
  }

  void clear() {
    _postDateRange = null;
    notify('clear', notificationType: NotificationType.Success);
  }
}
