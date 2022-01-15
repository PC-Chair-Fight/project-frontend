import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project/config/theme.config.dart';
import 'package:project/core/utils.dart';
import 'package:project/generated/l10n.dart';
import 'package:project/modules/job/models/bid.model.dart';
import 'package:project/modules/job/models/job.model.dart';
import 'package:project/modules/job/screens/job_details.screen.dart';
import 'package:project/modules/job/widgets/bidder_card.widget.dart';
import 'package:project/modules/user/models/user.model.dart';
import 'package:project/modules/worker/models/worker.model.dart';

class JobCard extends StatelessWidget {
  static const String fillerText =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
      'Fusce rhoncus urna ut ex rutrum convallis. Suspendisse potenti. Vivamus nisl ipsum, '
      'ornare non sodales nec, tincidunt eu eros. Nam sollicitudin ante ligula. ';

  final bool roundEdges;
  final Job job;

  const JobCard({Key? key, required this.roundEdges, required Job this.job})
      : super(key: key);

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
              job.name ?? 'Job Title',
              style: ThemeConfig.of(context).headline6,
              textAlign: TextAlign.start,
            ),
            Container(
              child: Text(
                job.description ?? fillerText,
                style: ThemeConfig.of(context).body1,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
            SizedBox(height: ThemeConfig.of(context).smallSpacing),
            Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  ...job.bids.take(2).map(
                        (bid) => Expanded(
                          child: BidderCardWidget(
                            position: 1,
                            bid: Bid(
                              id: bid.id,
                              sum: bid.sum,
                              worker: Worker(
                                user: User(
                                  firstName: bid.worker?.user?.firstName,
                                  lastName: bid.worker?.user?.lastName,
                                  profilePicture:
                                      bid.worker?.user?.profilePicture,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                ]
                    .intersperse(SizedBox(
                      width: 20,
                    ))
                    .toList()),
            SizedBox(height: ThemeConfig.of(context).smallSpacing),
            TextButton(
              onPressed: () => Navigator.pushNamed(
                context,
                JobDetailsScreen.route,
                arguments: job.id, // TODO current job id
              ),
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
                  "${job.user?.firstName ?? ''} ${job.user?.lastName ?? ''}",
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
                  DateFormat.yMMMMd().format(job.postDate!),
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
