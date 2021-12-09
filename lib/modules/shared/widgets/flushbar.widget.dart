import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/config/theme.config.dart';
import 'package:project/generated/l10n.dart';

enum MessageType { Confirmation, Information, Warning, Error }

extension ParseToString on MessageType {
  String toShortString() {
    return this.toString().split('.').last;
  }
}

void showFlushBar(
  BuildContext context, {
  String message = '',
  MessageType messageType = MessageType.Information,
  VoidCallback? yesCallback,
  VoidCallback? noCallback,
}) {
  final iconsMap = {
    MessageType.Confirmation: Icon(
      Icons.quiz,
      size: ThemeConfig.of(context).buttonHeight,
      color: ThemeConfig.of(context).primaryColor,
    ),
    MessageType.Information: Icon(Icons.info,
        size: ThemeConfig.of(context).buttonHeight,
        color: ThemeConfig.of(context).primaryColor),
    MessageType.Warning: Icon(Icons.warning,
        size: ThemeConfig.of(context).buttonHeight,
        color: ThemeConfig.of(context).warningColor),
    MessageType.Error: Icon(Icons.error,
        size: ThemeConfig.of(context).buttonHeight,
        color: ThemeConfig.of(context).errorColor)
  };

  final buttonTextStyle = ThemeConfig.of(context).subtitle2.copyWith(
      color: ThemeConfig.of(context).primaryColor,
      letterSpacing: 1.25,
      fontWeight: FontWeight.w600);

  var flushBar = null;

  final confirmationLayout = Row(children: [
    TextButton(
        onPressed: () {
          yesCallback!();
          flushBar!.dismiss(true);
        },
        child: Text(
          S.of(context).Affirmative_button,
          style: buttonTextStyle,
        ),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                ThemeConfig.of(context).backgroundColor),
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                EdgeInsets.all(ThemeConfig.of(context).smallSpacing)))),
    TextButton(
        onPressed: () {
          noCallback!();
          flushBar!.dismiss(true);
        },
        child: Text(
          S.of(context).Negative_button,
          style: buttonTextStyle,
        ),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                ThemeConfig.of(context).backgroundColor)))
  ]);

  final basicLayout = TextButton(
      onPressed: () => flushBar!.dismiss(true),
      child: Text(
        S.of(context).Confirmation_button,
        style: buttonTextStyle,
      ),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
              ThemeConfig.of(context).backgroundColor)));

  flushBar = Flushbar(
    messageText: Row(
      children: [
        Flexible(
          child: Container(
            child: Text(
              message,
              style: ThemeConfig.of(context).subtitle1,
              textAlign: TextAlign.center,
              overflow: TextOverflow.clip,
            ),
          ),
        ),
        messageType == MessageType.Confirmation
            ? confirmationLayout
            : basicLayout
      ],
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
    ),
    borderRadius: BorderRadius.circular(ThemeConfig.of(context).borderRadius),
    backgroundColor: ThemeConfig.of(context).backgroundColor,
    margin: EdgeInsets.all(ThemeConfig.of(context).appMargin),
    padding: EdgeInsets.all(ThemeConfig.of(context).mediumSpacing),
    boxShadows: [
      BoxShadow(
        color: ThemeConfig.of(context).boxShadowColor,
        spreadRadius: ThemeConfig.of(context).smallestSpacing,
        blurRadius: ThemeConfig.of(context).smallestSpacing,
        offset: Offset(0, ThemeConfig.of(context).smallestSpacing),
      ),
    ],
    icon: iconsMap[messageType],
    isDismissible: messageType != MessageType.Confirmation,
    duration: messageType == MessageType.Confirmation
        ? null
        : ThemeConfig.of(context).longDuration,
  );

  flushBar..show(context);
}
