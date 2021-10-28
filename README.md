# project-frontend

This is the web, android and ios project for the `unnamed` application.

## Docs & Tutorials

- [Flutter Documentation](https://flutter.dev/docs)
- [Pub Dev: Official Flutter & Dart package repository](https://pub.dev)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)
- [CodeLab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)

# Project Information

### Test user

These credentials would ideally be *hardcoded* into the database, so that they are always valid.

- email: "**admin@chairfight.com**"
- password: "**password**"

# Project Structure

### Running instructions

- ensure the latest flutter sdk is installed ([Flutter Install](https://flutter.dev/docs/get-started/install)).
- run `pub get` for loading the packages (can be ran directly from the UI of some IDEs such as Android Studio) (do **
  not** also run `pub upgrade` as that will change all the plugin versions).
- run `flutter run`.

### IDE setup

- Make sure the dart max line length to **120** from the IDE settings
- Auto-reformat (`Ctrl+Alt+L`) should be used as often as possible when writing Flutter code

### File Structure

Suggested file structure:

- **android/** - Native android project directory
- **ios/** - Native ios project directory
- **web/** - Native web project directory
- **assets/** - Asset root directory
- **lib/** - Flutter root directory
    - **main.dart** - Initializes the MaterialApp widget
    - **app.dart** - Contains the MaterialApp widget
    - **core/'core_file_name'.dart**
    - **config/'config_file_name'.config.dart**
    - **l10n/'l10n_en'.arb** -
    - **generated/**
    - **modules/'moduleName'**
        - **exceptions/'exception_name.exception.dart'**
        - **models/'model_name.provider.dart'**
        - **providers/'provider_name'.provider.dart**
        - **services/'service_name'.service.dart**
        - **screens/'screen_name'.screen.dart**
        - **widgets/'widget_name'.widget.dart**
        - **utils/'util_name'.util.dart**
    - **test/'test_name'.test.dart**
    - **pubspec.yaml** - package config file
    - **pubspec.lock** - package version lock file (not modified directly)

# Version Control

### Branches

- **release/'release-version'**
- **main**
- **development**
- **feature/'issue-code'/'issue-name-or-short-description'**

### Pull Requests, Reviews & Merging

- Active pull requests require at least **2** reviews approvals with at least **1** from a coordinator, although reviews
  from all people is highly advised.
- Reviews are made through comments on the pull request.
- When a certain comment is resolved, the developer should leave a **thumbs-up** reaction to the initial comment.
- Only the reviewer is allowed to mark a conversation as `Resolved`.
- Feature branches are merged into develop using the `Squash and merge` option.
