import 'package:project/modules/job/models/job_filter_field.enum.dart';
import 'package:project/modules/job/models/job_order_field.enum.dart';

class JobQuery {
  int index;
  int count;

  DateTime? newerThan;
  DateTime? olderThan;

  bool? byCurrentUserOnly;

  List<JobOrderField> orderBy;
  List<bool> ascending;

  List<JobFilterField> filterFields;
  List<String> filterValues;
  List<bool> exactFilters;

  JobQuery({
    required this.index,
    required this.count,
    this.newerThan,
    this.olderThan,
    this.byCurrentUserOnly,
    this.orderBy = const [],
    this.ascending = const [],
    this.filterFields = const [],
    this.filterValues = const [],
    this.exactFilters = const [],
  });

  Map<String, dynamic> toJson() => {
        'index': index,
        'count': count,
        'newerThan': newerThan?.toUtc().toIso8601String(),
        'olderThan': olderThan?.toUtc().toIso8601String(),
        'byCurrentUserOnly': byCurrentUserOnly,
        if (orderBy.isNotEmpty)
          'orderBy': orderBy.map((orderField) => orderField.toJson()).toList(),
        if (ascending.isNotEmpty) 'ascending': ascending,
        if (filterFields.isNotEmpty)
          'filterFields':
              filterFields.map((filterField) => filterField.toJson()).toList(),
        if (filterValues.isNotEmpty) 'filterValues': filterValues,
        if (exactFilters.isNotEmpty) 'exactFilters': exactFilters,
      };
}
