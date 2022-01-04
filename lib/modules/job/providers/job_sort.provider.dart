import 'package:flutter/material.dart';
import 'package:project/core/app_provider.dart';

class JobSortProvider extends AppProvider {
  SortCriteria _sortCriteria = SortCriteria.PostDate;
  bool _ascending = true;

  SortCriteria get sortCriteria => _sortCriteria;

  bool get ascending => _ascending;

  JobSortProvider(BuildContext ctx) : super(ctx);

  void setSortCriteria(SortCriteria value) {
    _sortCriteria = value;
    notify('setSortCriteria', notificationType: NotificationType.Success);
  }

  void setAscending(bool value) {
    _ascending = value;
    notify('setAscending', notificationType: NotificationType.Success);
  }
}

enum SortCriteria {
  PostDate,
}
