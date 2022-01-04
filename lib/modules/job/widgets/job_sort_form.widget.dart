import 'package:flutter/material.dart';
import 'package:project/config/theme.config.dart';

class JobSortForm extends StatefulWidget {
  const JobSortForm({Key? key}) : super(key: key);

  @override
  _JobSortFormState createState() => _JobSortFormState();
}

class _JobSortFormState extends State<JobSortForm> {
  @override
  Widget build(BuildContext context) {
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
                value: false,
                onChanged: (_) {},
              ),
            ],
          ),
        ),
        RadioListTile(
          value: false,
          groupValue: false,
          onChanged: (_) {},
          title: Text('Sort Criteria 1'),
        ),
        RadioListTile(
          value: false,
          groupValue: false,
          onChanged: (_) {},
          title: Text('Sort Criteria 2'),
        ),
        RadioListTile(
          value: false,
          groupValue: false,
          onChanged: (_) {},
          title: Text('Sort Criteria 3'),
        ),
        RadioListTile(
          value: false,
          groupValue: false,
          onChanged: (_) {},
          title: Text('Sort Criteria 4'),
        ),
        SizedBox(
          height: ThemeConfig.of(context).appMargin,
        ),
      ],
    );
  }
}
