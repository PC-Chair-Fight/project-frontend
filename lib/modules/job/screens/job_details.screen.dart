import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:project/generated/l10n.dart';
import 'package:project/modules/job/providers/job_details.provider.dart';
import 'package:project/modules/job/widgets/job_details.widget.dart';
import 'package:project/modules/shared/widgets/loading_indicator.widget.dart';
import 'package:provider/provider.dart';

class JobDetailsScreen extends StatefulWidget {
  static const String route = '/job';

  const JobDetailsScreen({Key? key}) : super(key: key);

  @override
  State<JobDetailsScreen> createState() => _JobDetailsScreenState();
}

class _JobDetailsScreenState extends State<JobDetailsScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance!.addPostFrameCallback(
      (_) {
        final jobId = ModalRoute.of(context)?.settings.arguments as int?;
        if (jobId == null) Navigator.pop(context);
        Provider.of<JobDetailsProvider>(context, listen: false).getJobDetails(
          jobId!,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<JobDetailsProvider>(context);
    if (provider.error != null) {
      Navigator.pop(context); // TODO error screen
    }
    return Scaffold(
      appBar: kIsWeb
          ? null
          : AppBar(
              title: Text(S.of(context).JobDetailsScreen_title),
            ),
      body: provider.loading || provider.jobDetails == null
          ? Center(
              child: LoadingIndicator(
                type: LoadingIndicatorType.Page,
              ),
            )
          : JobDetails(
              job: provider.jobDetails!,
            ),
    );
  }
}
