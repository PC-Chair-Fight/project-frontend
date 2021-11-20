import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/config/theme.config.dart';
import 'package:project/modules/job/widgets/bidder_card.widget.dart';
import 'package:project/generated/l10n.dart';

class JobCard extends StatelessWidget {
  static const String fillerText =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
      'Fusce rhoncus urna ut ex rutrum convallis. Suspendisse potenti. Vivamus nisl ipsum, '
      'ornare non sodales nec, tincidunt eu eros. Nam sollicitudin ante ligula. ';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 600,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Job Title',
                style: ThemeConfig.of(context)!.headline5,
                textAlign: TextAlign.start,
              ),
              Container(
                child: Text(
                  fillerText + fillerText,
                  style: ThemeConfig.of(context)!.body2,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
              SizedBox(height: ThemeConfig.of(context)!.smallSpacing),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(child: BidderCardWidget()),
                  SizedBox(width: 20),
                  Expanded(child: BidderCardWidget())
                ],
              ),
              SizedBox(height: ThemeConfig.of(context)!.smallSpacing),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    S.of(context).JobCard_seeJobDetails,
                    style: ThemeConfig.of(context)!.subtitle1,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(Icons.arrow_right_alt),
                ],
              ),
              SizedBox(height: ThemeConfig.of(context)!.smallSpacing),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    S.of(context).JobCard_postedBy,
                    style: ThemeConfig.of(context)!.caption,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Icon(Icons.album),
                  SizedBox(
                    width: 4,
                  ),
                  Text('Username', style: ThemeConfig.of(context)!.subtitle2),
                  SizedBox(
                    width: 8,
                  ),
                  Text(S.of(context).JobCard_onString, style: ThemeConfig.of(context)!.caption),
                  SizedBox(
                    width: 2,
                  ),
                  Text('99/88/2000', style: ThemeConfig.of(context)!.caption)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
