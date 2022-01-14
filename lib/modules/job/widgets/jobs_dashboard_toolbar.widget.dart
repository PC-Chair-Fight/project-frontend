import 'package:flutter/material.dart';
import 'package:project/config/theme.config.dart';
import 'package:project/generated/l10n.dart';
import 'package:project/modules/job/screens/create_job.screen.dart';
import 'package:project/modules/job/providers/job_search.provider.dart';
import 'package:project/modules/shared/utils/screen_layout.utils.dart';
import 'package:provider/provider.dart';

class JobsDashboardToolbar extends StatelessWidget {
  final Function()? onChanged;

  const JobsDashboardToolbar({Key? key, this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final jobSearchProvider = Provider.of<JobSearchProvider>(context);

    return Material(
      elevation: ScreenLayout.isWide(context)
          ? 0
          : ThemeConfig.of(context).mediumElevation,
      color: ScreenLayout.isWide(context)
          ? Colors.transparent
          : ThemeConfig.of(context).surfaceColor,
      child: Padding(
        padding: EdgeInsets.all(ThemeConfig.of(context).mediumSpacing),
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: ThemeConfig.of(context).appLargeWidth,
            ),
            child: Row(
              children: [
                if (ScreenLayout.isWide(context))
                  ConstrainedBox(
                    constraints: BoxConstraints.tightFor(
                      width: ThemeConfig.of(context).buttonHeight +
                          ThemeConfig.of(context).mediumSpacing,
                    ),
                  ),
                Expanded(
                  child: Theme(
                    data: ThemeData(
                      inputDecorationTheme: ThemeConfig.of(context)
                          .appSearchInputDecorationTheme(),
                    ),
                    child: TextField(
                      onChanged: (value) {
                        jobSearchProvider.setSearchText(value);
                        onChanged?.call();
                      },
                      decoration: InputDecoration(
                        hintText: S.of(context).JobsDashboardScreen_search,
                        prefixIcon: Icon(Icons.search),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: ThemeConfig.of(context).mediumSpacing),
                FloatingActionButton.small(
                  onPressed: () =>
                      Navigator.pushNamed(context, CreateJobScreen.route),
                  child: Icon(Icons.note_add),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
