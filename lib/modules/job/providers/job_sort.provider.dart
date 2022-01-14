import 'package:flutter/material.dart';
import 'package:project/core/app_provider.dart';
import 'package:project/modules/job/models/job_order_field.enum.dart';

class JobSortProvider extends AppProvider {
  JobOrderField _sortOrderField = JobOrderField.PostDate;
  bool _ascending = true;

  JobOrderField get sortOrderField => _sortOrderField;

  bool get ascending => _ascending;

  JobSortProvider(BuildContext ctx) : super(ctx);

  void setSortOrderField(JobOrderField value) {
    _sortOrderField = value;
    notify('setSortOrderField', notificationType: NotificationType.Success);
  }

  void setAscending(bool value) {
    _ascending = value;
    notify('setAscending', notificationType: NotificationType.Success);
  }
}
