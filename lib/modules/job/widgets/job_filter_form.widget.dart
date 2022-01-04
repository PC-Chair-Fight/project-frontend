import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:project/config/theme.config.dart';

class JobFilterForm extends StatefulWidget {
  const JobFilterForm({Key? key}) : super(key: key);

  @override
  _JobFilterFormState createState() => _JobFilterFormState();
}

class _JobFilterFormState extends State<JobFilterForm> {
  GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController _postDateRangeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.all(ThemeConfig.of(context).appMargin),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Filter Jobs*',
              style: ThemeConfig.of(context).headline5,
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
            SizedBox(height: ThemeConfig.of(context).largeSpacing),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('Clear*'),
                  ),
                ),
                SizedBox(width: ThemeConfig.of(context).appMargin),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('Apply*'),
                  ),
                ),
              ],
            ),
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
        _postDateRangeController.text = DateFormat.yMMMd().format(value.start) +
            ' - ' +
            DateFormat.yMMMd().format(value.end);
      }
    });
  }
}
