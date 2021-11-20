import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/config/theme.config.dart';
import 'package:project/generated/l10n.dart';
import 'package:project/modules/job/models/bid.model.dart';
import 'package:project/modules/job/models/job.model.dart';
import 'package:project/modules/shared/widgets/image_carousel.widget.dart';

class JobDetails extends StatefulWidget {
  final Job job;

  const JobDetails({Key? key, required Job this.job}) : super(key: key);

  @override
  State<JobDetails> createState() => _JobDetailsState();
}

class _JobDetailsState extends State<JobDetails> {
  bool _showingDescription = false;
  List<Bid> fetchedBids = []; // TODO fetch bids for this job

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          automaticallyImplyLeading: false,
          expandedHeight: 400,
          flexibleSpace: ImageCarouselWidget(
              images: (widget.job.images ?? [])
                  .where((image) => image.url != null)
                  .map((image) => NetworkImage(image.url!))
                  .toList()),
        ),
        SliverToBoxAdapter(
          child: Container(
            child: Column(
              children: [
                Material(
                  elevation: ThemeConfig.of(context)!.elevation,
                  child: Padding(
                    padding: EdgeInsets.all(ThemeConfig.of(context)!.appMargin),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          S.of(context).JobDetailsScreen_name,
                          style: ThemeConfig.of(context)!.subtitle2,
                        ),
                        SizedBox(height: ThemeConfig.of(context)!.smallSpacing),
                        Text(
                          widget.job.name ?? S.of(context).JobDetailsScreen_no_name,
                          style: ThemeConfig.of(context)!.body1,
                        ),
                        SizedBox(
                            height: ThemeConfig.of(context)!.mediumSpacing),
                        Text(
                          S.of(context).JobDetailsScreen_description,
                          style: ThemeConfig.of(context)!.subtitle2,
                        ),
                        SizedBox(
                            height: ThemeConfig.of(context)!.mediumSpacing),
                        Text(
                          widget.job.description ?? S.of(context).JobDetailsScreen_no_description,
                          style: ThemeConfig.of(context)!.body1,
                          maxLines: _showingDescription ? null : 2,
                          overflow: _showingDescription
                              ? TextOverflow.visible
                              : TextOverflow.ellipsis,
                        ),
                        SizedBox(
                            height: ThemeConfig.of(context)!.mediumSpacing),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () => setState(
                                () =>
                                    _showingDescription = !_showingDescription,
                              ),
                              child: Text(
                                _showingDescription
                                    ? S.of(context).JobDetailsScreen_show_less
                                    : S.of(context).JobDetailsScreen_show_more,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                GridView.count(
                  shrinkWrap: true,
                  padding: EdgeInsets.all(
                    ThemeConfig.of(context)!.smallSpacing,
                  ),
                  crossAxisCount: 2,
                  children: [], // TODO fill with bids
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
