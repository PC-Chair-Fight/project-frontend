import 'package:flutter/material.dart';
import 'package:project/config/theme.config.dart';
import 'package:project/generated/l10n.dart';
import 'package:project/modules/shared/utils/screen_layout.utils.dart';

class JobsDashboardToolbar extends StatelessWidget {
  const JobsDashboardToolbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: S.of(context).JobsDashboardScreen_search,
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
                SizedBox(width: ThemeConfig.of(context).mediumSpacing),
                FloatingActionButton.small(
                  onPressed: () {},
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
