import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project/config/theme.config.dart';
import 'package:project/generated/l10n.dart';
import 'package:project/modules/main/providers/page.provider.dart';

class AppSideNavigationBar extends StatelessWidget {
  final AppPage currentPage;
  final Function(AppPage) onSelect;

  const AppSideNavigationBar({
    Key? key,
    required this.currentPage,
    required this.onSelect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Material(
        color: ThemeConfig.of(context).surfaceColor,
        elevation: ThemeConfig.of(context).mediumElevation,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.all(ThemeConfig.of(context).mediumSpacing),
              child: SizedBox(
                height: 64,
                child: FittedBox(
                  child: FlutterLogo(),
                ),
              ),
            ),
            const Divider(),
            _buildItem(
              context: context,
              selected: currentPage == AppPage.Jobs,
              icon: Icon(FontAwesomeIcons.solidNewspaper),
              label: Text(S.of(context).Navigation_jobs_page_label),
              onSelected: () => onSelect(AppPage.Jobs),
            ),
            _buildItem(
              context: context,
              selected: currentPage == AppPage.Workers,
              icon: Icon(FontAwesomeIcons.userTie),
              label: Text(S.of(context).Navigation_workers_page_label),
              onSelected: () => onSelect(AppPage.Workers),
            ),
            _buildItem(
              context: context,
              selected: currentPage == AppPage.Profile,
              icon: Icon(FontAwesomeIcons.solidUserCircle),
              label: Text(S.of(context).Navigation_profile_page_label),
              onSelected: () => onSelect(AppPage.Profile),
            ),
            Expanded(
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItem({
    required BuildContext context,
    required bool selected,
    required Widget icon,
    required Widget label,
    required Function() onSelected,
  }) {
    return Container(
      color: selected ? ThemeConfig.of(context).primaryColor : null,
      child: InkWell(
        onTap: onSelected,
        overlayColor: MaterialStateProperty.all(
          selected
              ? ThemeConfig.of(context).onPrimaryColor.withOpacity(.15)
              : ThemeConfig.of(context).onBackgroundColor.withOpacity(.15),
        ),
        child: Padding(
          padding: EdgeInsets.all(ThemeConfig.of(context).mediumSpacing),
          child: Row(
            children: [
              IconTheme(
                child: icon,
                data: IconThemeData(
                  color: selected
                      ? ThemeConfig.of(context).onPrimaryColor
                      : ThemeConfig.of(context).onBackgroundColor,
                ),
              ),
              SizedBox(width: ThemeConfig.of(context).mediumSpacing),
              Expanded(
                child: DefaultTextStyle(
                  child: label,
                  style: ThemeConfig.of(context).subtitle1.copyWith(
                        color: selected
                            ? ThemeConfig.of(context).onPrimaryColor
                            : ThemeConfig.of(context).onBackgroundColor,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
