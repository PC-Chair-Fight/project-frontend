import 'package:flutter/material.dart';
import 'package:project/modules/auth/providers/auth.provider.dart';
import 'package:project/modules/job/providers/job_details.provider.dart';
import 'package:project/modules/job/providers/job_filter.provider.dart';
import 'package:project/modules/job/providers/job_search.provider.dart';
import 'package:project/modules/job/providers/job_sort.provider.dart';
import 'package:project/modules/job/providers/jobs.provider.dart';
import 'package:project/modules/main/providers/page.provider.dart';
import 'package:provider/provider.dart';

class ProviderConfig extends StatelessWidget {
  final Widget child;

  const ProviderConfig({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<PageProvider>(
          create: (context) => PageProvider(context),
        ),
        ChangeNotifierProvider<AuthProvider>(
          create: (context) => AuthProvider(context),
        ),
        ChangeNotifierProvider<JobSortProvider>(
          create: (context) => JobSortProvider(context),
        ),
        ChangeNotifierProvider<JobFilterProvider>(
          create: (context) => JobFilterProvider(context),
        ),
        ChangeNotifierProvider<JobSearchProvider>(
          create: (context) => JobSearchProvider(context),
        ),
        ChangeNotifierProxyProvider3<JobSortProvider, JobFilterProvider,
            JobSearchProvider, JobsProvider>(
          create: (context) => JobsProvider(context),
          update: (context, jobSortProvider, jobFilterProvider,
                  jobSearchProvider, oldJobsProvider) =>
              (oldJobsProvider
                ?..update(
                    jobSortProvider, jobFilterProvider, jobSearchProvider)) ??
              JobsProvider(context),
        ),
        ChangeNotifierProxyProvider<JobsProvider, JobDetailsProvider>(
          create: (context) => JobDetailsProvider(context),
          update: (context, jobsProvider, oldJobDetailsProvider) =>
              (oldJobDetailsProvider?..update(jobsProvider)) ??
              JobDetailsProvider(context),
        ),
      ],
      child: child,
    );
  }
}
