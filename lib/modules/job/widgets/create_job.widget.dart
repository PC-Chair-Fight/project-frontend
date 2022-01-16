import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:project/config/theme.config.dart';
import 'package:project/generated/l10n.dart';
import 'package:project/modules/job/models/job.model.dart';
import 'package:project/modules/job/providers/jobs.provider.dart';
import 'package:project/modules/job/widgets/job_form.widget.dart';
import 'package:project/modules/shared/utils/screen_layout.utils.dart';
import 'package:provider/provider.dart';

class CreateJob extends StatefulWidget {
  const CreateJob({Key? key}) : super(key: key);

  @override
  _CreateJobState createState() => _CreateJobState();
}

class _CreateJobState extends State<CreateJob> {
  final _formKey = GlobalKey<JobFormState>();

  @override
  Widget build(BuildContext context) {
    final jobsProvider = Provider.of<JobsProvider>(context);

    return ScreenLayout.isSmall(context)
        ? Padding(
            padding: EdgeInsets.symmetric(
                horizontal: ThemeConfig.of(context).appMargin),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: ThemeConfig.of(context).appMargin,
                  ),
                ),
                SliverToBoxAdapter(
                  child: JobForm(
                    key: _formKey,
                  ),
                ),
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Spacer(),
                      SizedBox(
                        height: ThemeConfig.of(context).largeSpacing,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          final formResult = _formKey.currentState?.submit();
                          if (formResult != null)
                            _addJob(
                              jobsProvider,
                              formResult.jobModel,
                              formResult.images,
                            );
                        },
                        child: Text(S.of(context).CreateJobScreen_submit),
                      ),
                      SizedBox(height: ThemeConfig.of(context).mediumSpacing),
                      OutlinedButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: Text(S.of(context).CreateJobScreen_back),
                      ),
                      SizedBox(
                        height: ThemeConfig.of(context).appMargin,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        : SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(
                ThemeConfig.of(context).appMargin,
              ),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height,
                ),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ConstrainedBox(
                        constraints: BoxConstraints(
                            maxWidth: ThemeConfig.of(context).appMediumWidth),
                        child: JobForm(
                          key: _formKey,
                        ),
                      ),
                      SizedBox(
                        height: ThemeConfig.of(context).largeSpacing,
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: ThemeConfig.of(context).appSmallWidth,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                final formResult =
                                    _formKey.currentState?.submit();
                                if (formResult != null)
                                  _addJob(
                                    jobsProvider,
                                    formResult.jobModel,
                                    formResult.images,
                                  );
                              },
                              child: Text(S.of(context).CreateJobScreen_submit),
                            ),
                            SizedBox(
                                height: ThemeConfig.of(context).mediumSpacing),
                            ElevatedButton(
                              onPressed: () => Navigator.of(context).pop(),
                              style: ThemeConfig.of(context)
                                  .appElevatedButtonAltStyle(),
                              child: Text(S.of(context).CreateJobScreen_back),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
  }

  void _addJob(JobsProvider provider, Job job, List<Uint8List> images) {
    provider.addJob(job.name!, job.description!, images).then(
      (job) {
        if (provider.addError == null) Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: provider.addError == null
                ? ThemeConfig.of(context).successColor
                : ThemeConfig.of(context).errorColor,
            content: Text(
              provider.addError?.message ??
                  S.of(context).CreateJobScreen_success,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: provider.addError == null
                    ? ThemeConfig.of(context).onSuccessColor
                    : ThemeConfig.of(context).onErrorColor,
              ),
            ),
            duration: Duration(seconds: 4),
          ),
        );
      },
    );
  }
}
