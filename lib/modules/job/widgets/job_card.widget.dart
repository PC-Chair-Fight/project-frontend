import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/config/theme.config.dart';
import 'package:project/generated/l10n.dart';
import 'package:project/modules/job/models/job.model.dart';
import 'package:project/modules/job/models/job_image.model.dart';
import 'package:project/modules/job/screens/job_details.screen.dart';
import 'package:project/modules/job/widgets/bidder_card.widget.dart';

class JobCard extends StatelessWidget {
  static const String fillerText =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
      'Fusce rhoncus urna ut ex rutrum convallis. Suspendisse potenti. Vivamus nisl ipsum, '
      'ornare non sodales nec, tincidunt eu eros. Nam sollicitudin ante ligula. ';

  final bool roundEdges;

  const JobCard({Key? key, required this.roundEdges}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: !roundEdges ? Border() : null,
      child: Padding(
        padding: EdgeInsets.all(ThemeConfig.of(context).mediumSpacing),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Job Title',
              style: ThemeConfig.of(context).headline6,
              textAlign: TextAlign.start,
            ),
            Container(
              child: Text(
                fillerText,
                style: ThemeConfig.of(context).body1,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
            SizedBox(height: ThemeConfig.of(context).smallSpacing),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(child: BidderCardWidget()),
                SizedBox(width: 20),
                Expanded(child: BidderCardWidget())
              ],
            ),
            SizedBox(height: ThemeConfig.of(context).smallSpacing),
            TextButton(
              onPressed: () => Navigator.pushNamed(
                  context, JobDetailsScreen.route,
                  arguments: Job(
                      // TODO remove this mock job + request to job details endpoint
                      name: 'Name',
                      description:
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, '
                          'sed do eiusmod tempor incididunt ut labore et dolore magna'
                          ' aliqua. Ut enim ad minim veniam, quis nostrud exercitation'
                          ' ullamco laboris nisi ut aliquip ex ea commodo consequat. '
                          'Duis aute irure dolor in reprehenderit in voluptate velit '
                          'esse cillum dolore eu fugiat nulla pariatur. Excepteur '
                          'sint occaecat cupidatat non proident, sunt in culpa qui '
                          'officia deserunt mollit anim id est laborum',
                      images: [
                        'https://picsum.photos/seed/1/600/400',
                        'https://picsum.photos/seed/2/600/400',
                        'https://picsum.photos/seed/3/600/400',
                        'https://picsum.photos/seed/4/600/400',
                      ].map((url) => JobImage(url: url)).toList())),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(S.of(context).JobsCard_seeJobDetails),
                  SizedBox(width: ThemeConfig.of(context).smallSpacing),
                  Icon(Icons.arrow_forward),
                ],
              ),
            ),
            SizedBox(height: ThemeConfig.of(context).smallSpacing),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  S.of(context).JobCard_postedBy,
                  style: ThemeConfig.of(context).caption,
                ),
                SizedBox(width: ThemeConfig.of(context).smallestSpacing),
                Icon(Icons.album),
                SizedBox(width: ThemeConfig.of(context).smallestSpacing),
                Text(
                  'Username',
                  style: ThemeConfig.of(context)
                      .caption
                      .copyWith(color: ThemeConfig.of(context).primaryColor),
                ),
                SizedBox(width: ThemeConfig.of(context).smallestSpacing),
                Text(
                  S.of(context).JobCard_onString,
                  style: ThemeConfig.of(context).caption,
                ),
                SizedBox(width: ThemeConfig.of(context).smallestSpacing),
                Text(
                  '99/88/2000',
                  style: ThemeConfig.of(context).caption,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
