import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:project/config/theme.config.dart';
import 'package:project/generated/l10n.dart';
import 'package:project/modules/job/models/bid.model.dart';
import 'package:project/modules/job/models/job.model.dart';
import 'package:project/modules/job/widgets/bidder_card.widget.dart';
import 'package:project/modules/job/widgets/job_description.widget.dart';
import 'package:project/modules/shared/utils/authenticated_network_image.utils.dart';
import 'package:project/modules/shared/utils/screen_layout.utils.dart';
import 'package:project/modules/shared/widgets/column_count_grid.widget.dart';
import 'package:project/modules/shared/widgets/image_carousel.widget.dart';

class JobDetails extends StatefulWidget {
  final Job job;

  const JobDetails({Key? key, required Job this.job}) : super(key: key);

  @override
  State<JobDetails> createState() => _JobDetailsState();
}

class _JobDetailsState extends State<JobDetails> {
  List<Bid> fetchedBids = []; // TODO fetch bids with workers for this job

  @override
  Widget build(BuildContext context) {
    // setup differentiated based on platform (web or not)
    return ScreenLayout.isSmall(context)
        ? CustomScrollView(
            slivers: [
              if (widget.job.images.isNotEmpty)
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  expandedHeight: 400,
                  flexibleSpace: _carousel(context),
                ),
              SliverToBoxAdapter(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      JobDescription(
                        name: widget.job.name,
                        description: widget.job.description,
                      ),
                      Padding(
                        padding:
                            EdgeInsets.all(ThemeConfig.of(context).appMargin),
                        child: _bidGridView(context),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: ThemeConfig.of(context).appMargin),
                        child: _bidButton(context),
                      ),
                      SizedBox(
                        height: ThemeConfig.of(context).appMargin,
                      )
                    ],
                  ),
                ),
              )
            ],
          )
        : ScreenLayout.isWide(context)
            ? SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: MediaQuery.of(context).size.height,
                  ),
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: ThemeConfig.of(context).appMargin,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            child: ConstrainedBox(
                              constraints: BoxConstraints(
                                maxWidth:
                                    ThemeConfig.of(context).appMediumWidth,
                              ),
                              child: Card(
                                clipBehavior: Clip.antiAlias,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    if (widget.job.images.isNotEmpty)
                                      _carousel(context),
                                    JobDescription(
                                      name: widget.job.name,
                                      description: widget.job.description,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: ThemeConfig.of(context).mediumSpacing,
                          ),
                          Flexible(
                            child: ConstrainedBox(
                              constraints: BoxConstraints(
                                maxWidth: ThemeConfig.of(context).appSmallWidth,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  _bidGridView(context),
                                  SizedBox(
                                    height:
                                        ThemeConfig.of(context).mediumSpacing,
                                  ),
                                  _bidButton(context),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            : SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: MediaQuery.of(context).size.height,
                  ),
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: ThemeConfig.of(context).appMargin,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            child: ConstrainedBox(
                              constraints: BoxConstraints(
                                maxWidth:
                                    ThemeConfig.of(context).appMediumWidth,
                              ),
                              child: Card(
                                clipBehavior: Clip.antiAlias,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    if (widget.job.images.isNotEmpty)
                                      _carousel(context),
                                    JobDescription(
                                      name: widget.job.name,
                                      description: widget.job.description,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: ThemeConfig.of(context).mediumSpacing,
                          ),
                          Flexible(
                            child: ConstrainedBox(
                              constraints: BoxConstraints(
                                maxWidth:
                                    ThemeConfig.of(context).appMediumWidth,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  _bidGridView(context),
                                  SizedBox(
                                    height:
                                        ThemeConfig.of(context).mediumSpacing,
                                  ),
                                  _bidButton(context),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
  }

  Widget _carousel(BuildContext context) {
    return ImageCarouselWidget(
      height: 400,
      images: widget.job.images
          .map((image) => authNetworkImage(context, image))
          .toList(),
    );
  }

  Widget _bidGridView(BuildContext context) {
    int bidPosition = 1;

    return ColumnCountGrid(
      count: 2,
      rowSpacing: ThemeConfig.of(context).smallSpacing,
      columnSpacing: ThemeConfig.of(context).smallSpacing,
      columnAlignment: WrapAlignment.start,
      children: widget.job.bids
          .map(
            (b) => BidderCardWidget(
              position: bidPosition++,
              bid: b,
            ),
          )
          .toList(),
    );
  }

  Widget _bidButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      // TODO show modal asking for bid value when modals are ready
      child: Text(S.of(context).JobDetailsScreen_bid_button),
    );
  }
}
