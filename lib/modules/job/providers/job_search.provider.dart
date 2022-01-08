import 'package:flutter/material.dart';
import 'package:project/core/app_provider.dart';

class JobSearchProvider extends AppProvider {
  String _searchText = '';

  JobSearchProvider(BuildContext ctx) : super(ctx);

  void setSearchText(String value) {
    _searchText = value;
    notify('setSearchText', notificationType: NotificationType.Success);
  }
}
