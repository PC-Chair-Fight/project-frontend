import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:project/generated/l10n.dart';
import 'package:project/modules/job/widgets/create_job.widget.dart';

class CreateJobScreen extends StatelessWidget {
  static const String route = '/create_job';

  const CreateJobScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: kIsWeb
          ? null
          : AppBar(
              title: Text(S.of(context).CreateJobScreen_title),
            ),
      body: CreateJob(),
    );
  }
}
