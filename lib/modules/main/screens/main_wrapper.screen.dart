import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:project/generated/l10n.dart';
import 'package:project/modules/job/screens/jobs_dashboard.screen.dart';
import 'package:project/modules/main/providers/page.provider.dart';
import 'package:project/modules/main/widgets/app_bottom_navigation_bar.dart';
import 'package:project/modules/main/widgets/app_side_navigation_bar.dart';
import 'package:project/modules/shared/utils/screen_layout.utils.dart';
import 'package:provider/provider.dart';

class MainWrapperScreen extends StatelessWidget {
  static const String route = '/main';

  const MainWrapperScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pageProvider = Provider.of<PageProvider>(context);

    return Scaffold(
      appBar: !kIsWeb
          ? AppBar(
              automaticallyImplyLeading: false,
              title: Text(
                pageProvider.currentPage == AppPage.Profile
                    ? S.of(context).Navigation_profile_page_label
                    : pageProvider.currentPage == AppPage.Jobs
                        ? S.of(context).Navigation_jobs_page_label
                        : S.of(context).Navigation_workers_page_label,
              ),
            )
          : null,
      bottomNavigationBar: !ScreenLayout.isWide(context)
          ? AppBottomNavigationBar(
              context: context,
              currentPage: pageProvider.currentPage,
              onSelect: pageProvider.setPage,
            )
          : null,
      body: Row(
        children: [
          if (ScreenLayout.isWide(context))
            AppSideNavigationBar(
              currentPage: pageProvider.currentPage,
              onSelect: pageProvider.setPage,
            ),
          Expanded(
            child: _buildCurrentPage(pageProvider),
          ),
        ],
      ),
    );
  }

  Widget _buildCurrentPage(PageProvider pageProvider) {
    switch (pageProvider.currentPage) {
      case AppPage.Profile:
        return Container();
      case AppPage.Jobs:
        return JobsDashboardScreen();
      case AppPage.Workers:
        return Container();
    }
  }
}
