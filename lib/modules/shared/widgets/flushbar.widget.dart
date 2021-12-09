import 'dart:developer';

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/config/theme.config.dart';

enum MessageType { Confirmation, Information, Warning, Error }

extension ParseToString on MessageType {
  String toShortString() {
    return this.toString().split('.').last;
  }
}

void showFlushBar(BuildContext context,
    {String message = '',
    MessageType messageType = MessageType.Information,
    VoidCallback? yesCallback,
    VoidCallback? noCallback}) {
  final iconsMap = {
    MessageType.Confirmation: Icon(
      Icons.quiz,
      size: ThemeConfig.of(context).buttonHeight,
      color: ThemeConfig.of(context).primaryColor,
    ),
    MessageType.Information:
        Icon(Icons.info, size: ThemeConfig.of(context).buttonHeight, color: ThemeConfig.of(context).primaryColor),
    MessageType.Warning:
        Icon(Icons.warning, size: ThemeConfig.of(context).buttonHeight, color: ThemeConfig.of(context).warningColor),
    MessageType.Error:
        Icon(Icons.error, size: ThemeConfig.of(context).buttonHeight, color: ThemeConfig.of(context).errorColor)
  };

  final buttonTextStyle = ThemeConfig.of(context)
      .subtitle2
      .copyWith(color: ThemeConfig.of(context).primaryColor, letterSpacing: 1.25, fontWeight: FontWeight.w600);

  var flushBar = null;

  final confirmationLayout = Row(children: [
    TextButton(
        onPressed: () => {yesCallback!(), flushBar!.dismiss(true)},
        child: Text('Yes', style: buttonTextStyle),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(ThemeConfig.of(context).backgroundColor),
            padding:
                MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.all(ThemeConfig.of(context).smallSpacing)))),
    TextButton(
        onPressed: () => {noCallback!(), flushBar!.dismiss(true)},
        child: Text('No', style: buttonTextStyle),
        style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(ThemeConfig.of(context).backgroundColor)))
  ]);

  final basicLayout = TextButton(
      onPressed: () => {flushBar!.dismiss(true)},
      child: Text('Ok', style: buttonTextStyle),
      style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(ThemeConfig.of(context).backgroundColor)));

  flushBar = Flushbar(
      messageText: Row(
        children: [
          Flexible(
              child: Container(
            child: Text(
              message,
              style: ThemeConfig.of(context).subtitle1.copyWith(letterSpacing: 0.14, height: 1),
              textAlign: TextAlign.center,
              overflow: TextOverflow.clip,
            ),
          )),
          messageType == MessageType.Confirmation ? confirmationLayout : basicLayout
        ],
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
      ),
      borderRadius: BorderRadius.circular(ThemeConfig.of(context).borderRadius),
      backgroundColor: ThemeConfig.of(context).backgroundColor,
      margin: EdgeInsets.all(ThemeConfig.of(context).appMargin),
      padding: EdgeInsets.all(13),
      boxShadows: [
        BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.251), spreadRadius: 2, blurRadius: 2, offset: Offset(0, 3)),
      ],
      icon: iconsMap[messageType],
      isDismissible: messageType != MessageType.Confirmation,
      duration: messageType == MessageType.Confirmation ? null : Duration(seconds: 5));

  flushBar..show(context);
}
