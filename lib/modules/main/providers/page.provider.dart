import 'package:flutter/src/widgets/framework.dart';
import 'package:project/core/app_provider.dart';

class PageProvider extends AppProvider {
  PageProvider(BuildContext context) : super(context);

  AppPage currentPage = AppPage.Jobs;

  void setDefaultPage() {
    currentPage = AppPage.Jobs;
    notify('setDefaultPage', notificationType: NotificationType.Success);
  }

  void setPage(AppPage page) {
    currentPage = page;
    notify('setPage', notificationType: NotificationType.Success);
  }
}

enum AppPage {
  Profile,
  Jobs,
  Workers,
}
