import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project/generated/l10n.dart';
import 'package:project/modules/main/providers/page.provider.dart';

class AppBottomNavigationBar extends BottomNavigationBar {
  AppBottomNavigationBar({
    Key? key,
    required BuildContext context,
    required AppPage currentPage,
    required Function(AppPage) onSelect,
  }) : super(
          key: key,
          currentIndex: _pageIndex(currentPage),
          onTap: (index) => onSelect(_page(index)),
          items: [
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.solidUserCircle),
              label: S.of(context).Navigation_profile_page_label,
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.solidNewspaper),
              label: S.of(context).Navigation_jobs_page_label,
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.userTie),
              label: S.of(context).Navigation_workers_page_label,
            ),
          ],
        );

  static int _pageIndex(AppPage appPage) {
    switch (appPage) {
      case AppPage.Profile:
        return 0;
      case AppPage.Jobs:
        return 1;
      case AppPage.Workers:
        return 2;
    }
  }

  static AppPage _page(int value) {
    switch (value) {
      case 0:
        return AppPage.Profile;
      case 1:
        return AppPage.Jobs;
      case 2:
        return AppPage.Workers;
      default:
        throw RangeError.index(value, AppPage.values);
    }
  }
}
