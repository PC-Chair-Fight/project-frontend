import 'package:flutter/material.dart';
import 'package:project/config/theme.config.dart';
import 'package:project/generated/l10n.dart';
import 'package:project/modules/job/models/job_order_field.enum.dart';
import 'package:project/modules/job/providers/job_sort.provider.dart';
import 'package:provider/provider.dart';

class JobSortForm extends StatelessWidget {
  final Function()? onChanged;

  const JobSortForm({Key? key, this.onChanged}) : super(key: key);

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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  S.of(context).JobSortForm_sortJobs,
                  style: ThemeConfig.of(context).headline5,
                ),
              ),
              Text(S.of(context).JobSortForm_ascending),
              Switch(
                value: jobSortProvider.ascending,
                onChanged: (value) {
                  onChanged?.call();
                  jobSortProvider.setAscending(value);
                },
              ),
            ],
          ),
        ),
        Divider(),
        SizedBox(height: ThemeConfig.of(context).appMargin),
        RadioListTile(
          value: JobOrderField.PostDate,
          groupValue: jobSortProvider.sortOrderField,
          onChanged: (_) {
            onChanged?.call();
            jobSortProvider.setSortOrderField(JobOrderField.PostDate);
          },
          title: Text(S.of(context).JobSortForm_postDateCriteria),
        ),
        SizedBox(height: ThemeConfig.of(context).appMargin),
      ],
    );
  }
}
