import 'package:flutter/material.dart';
import 'package:project/config/theme.config.dart';
import 'package:project/generated/l10n.dart';

class JobDescription extends StatefulWidget {
  final String? name;
  final String? description;

  const JobDescription({Key? key, this.name, this.description})
      : super(key: key);

  @override
  _JobDescriptionState createState() => _JobDescriptionState();
}

class _JobDescriptionState extends State<JobDescription> {
  bool _showingDescription = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: ThemeConfig.of(context).elevation,
      child: Padding(
        padding: EdgeInsets.all(ThemeConfig.of(context).appMargin),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              S.of(context).JobDetailsScreen_name,
              style: ThemeConfig.of(context).subtitle2,
            ),
            SizedBox(height: ThemeConfig.of(context).smallSpacing),
            Text(
              widget.name ?? S.of(context).JobDetailsScreen_no_name,
              style: ThemeConfig.of(context).body1,
            ),
            SizedBox(height: ThemeConfig.of(context).mediumSpacing),
            Text(
              S.of(context).JobDetailsScreen_description,
              style: ThemeConfig.of(context).subtitle2,
            ),
            SizedBox(height: ThemeConfig.of(context).mediumSpacing),
            LayoutBuilder(
              builder: (context, size) {
                final text = widget.description ??
                    S.of(context).JobDetailsScreen_no_description;
                final style = ThemeConfig.of(context).body1;
                final painter = TextPainter(
                  maxLines: 2,
                  textAlign: TextAlign.left,
                  textDirection: TextDirection.ltr,
                  text: TextSpan(
                    text: text,
                    style: style,
                  ),
                );
                painter.layout(maxWidth: size.maxWidth);

                return Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      text,
                      style: style,
                      maxLines: _showingDescription ? null : 2,
                      overflow: _showingDescription
                          ? TextOverflow.visible
                          : TextOverflow.ellipsis,
                    )
                  ]..addAll(
                      painter.didExceedMaxLines
                          ? [
                              SizedBox(
                                  height:
                                      ThemeConfig.of(context).mediumSpacing),
                              Align(
                                alignment: Alignment.centerRight,
                                child: TextButton(
                                  onPressed: () => setState(
                                    () => _showingDescription =
                                        !_showingDescription,
                                  ),
                                  child: Text(
                                    _showingDescription
                                        ? S
                                            .of(context)
                                            .JobDetailsScreen_show_less
                                        : S
                                            .of(context)
                                            .JobDetailsScreen_show_more,
                                  ),
                                ),
                              )
                            ]
                          : [],
                    ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
