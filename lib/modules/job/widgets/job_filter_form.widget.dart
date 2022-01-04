import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:project/config/theme.config.dart';
import 'package:project/modules/job/providers/job_filter.provider.dart';
import 'package:provider/provider.dart';

class JobFilterForm extends StatefulWidget {
  final Function()? onChanged;

  const JobFilterForm({Key? key, this.onChanged}) : super(key: key);

  @override
  _JobFilterFormState createState() => _JobFilterFormState();
}

class _JobFilterFormState extends State<JobFilterForm> {
  late JobFilterProvider _jobFilterProvider;

  GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController _postDateRangeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _jobFilterProvider = Provider.of<JobFilterProvider>(context);

    _postDateRangeController.text = _jobFilterProvider.postDateRange != null
        ? DateFormat.yMMMd().format(_jobFilterProvider.postDateRange!.start) +
            ' - ' +
            DateFormat.yMMMd().format(_jobFilterProvider.postDateRange!.end)
        : '';
    final canClearFilters = _jobFilterProvider.postDateRange != null;

    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.all(ThemeConfig.of(context).appMargin),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Filter Jobs*',
                    style: ThemeConfig.of(context).headline5,
                  ),
                ),
                if (canClearFilters)
                  TextButton(
                    onPressed: () {
                      widget.onChanged?.call();
                      _jobFilterProvider.clear();
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Clear*'),
                        SizedBox(width: ThemeConfig.of(context).smallSpacing),
                        Icon(FontAwesomeIcons.eraser, size: 16),
                      ],
                    ),
                  ),
              ],
            ),
            SizedBox(height: ThemeConfig.of(context).appMargin),
            TextFormField(
              controller: _postDateRangeController,
              readOnly: true,
              onTap: _onPostDateRangeFieldTap,
              decoration: InputDecoration(
                label: Text('Post date range*'),
                suffixIcon: Icon(
                  FontAwesomeIcons.calendar,
                  color: ThemeConfig.of(context).primaryColor,
                ),
              ),
            ),
            SizedBox(height: ThemeConfig.of(context).mediumSpacing),
          ],
        ),
      ),
    );
  }

  void _onPostDateRangeFieldTap() {
    showDateRangePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 10),
      lastDate: DateTime.now(),
    ).then((value) {
      if (value != null) {
        widget.onChanged?.call();
        _jobFilterProvider.setPostDateRange(value);
      }
    });
  }
}
