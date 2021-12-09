import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:project/config/theme.config.dart';
import 'package:project/modules/job/widgets/job_form.widget.dart';
import 'package:project/modules/shared/utils/screen_layout.utils.dart';
import 'package:project/generated/l10n.dart';

class CreateJob extends StatefulWidget {
  const CreateJob({Key? key}) : super(key: key);

  @override
  _CreateJobState createState() => _CreateJobState();
}

class _CreateJobState extends State<CreateJob> {
  final _formKey = GlobalKey<JobFormState>();

  @override
  Widget build(BuildContext context) {
    return ScreenLayout.isSmall(context)
        ? CustomScrollView(
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
                      onPressed: () {},
                      child: Text(S.of(context).CreateJobScreen_submit),
                    ),
                    SizedBox(height: ThemeConfig.of(context).mediumSpacing),
                    OutlinedButton(
                      onPressed: () {},
                      child: Text(S.of(context).CreateJobScreen_back),
                    ),
                    SizedBox(
                      height: ThemeConfig.of(context).appMargin,
                    ),
                  ],
                ),
              ),
            ],
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
                              onPressed: () {},
                              child: Text(S.of(context).CreateJobScreen_submit),
                            ),
                            SizedBox(
                                height: ThemeConfig.of(context).mediumSpacing),
                            OutlinedButton(
                              onPressed: () {},
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
}
