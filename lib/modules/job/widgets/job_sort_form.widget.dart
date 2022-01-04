import 'package:flutter/material.dart';
import 'package:project/config/theme.config.dart';
import 'package:project/modules/job/providers/job_sort.provider.dart';
import 'package:provider/provider.dart';

class JobSortForm extends StatefulWidget {
  const JobSortForm({Key? key}) : super(key: key);

  @override
  _JobSortFormState createState() => _JobSortFormState();
}

class _JobSortFormState extends State<JobSortForm> {
  @override
  Widget build(BuildContext context) {
    final jobSortProvider = Provider.of<JobSortProvider>(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.all(ThemeConfig.of(context).appMargin),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  'Sort Jobs*',
                  style: ThemeConfig.of(context).headline5,
                ),
              ),
              Text('Ascending*'),
              Switch(
                value: jobSortProvider.ascending,
                onChanged: (value) => jobSortProvider.setAscending(value),
              ),
            ],
          ),
        ),
        RadioListTile(
          value: SortCriteria.PostDate,
          groupValue: jobSortProvider.sortCriteria,
          onChanged: (_) =>
              jobSortProvider.setSortCriteria(SortCriteria.PostDate),
          title: Text('Post date*'),
        ),
        RadioListTile(
          value: SortCriteria.Other,
          groupValue: jobSortProvider.sortCriteria,
          onChanged: (_) => jobSortProvider.setSortCriteria(SortCriteria.Other),
          title: Text('Other*'),
        ),
        SizedBox(
          height: ThemeConfig.of(context).appMargin,
        ),
      ],
    );
  }
}
