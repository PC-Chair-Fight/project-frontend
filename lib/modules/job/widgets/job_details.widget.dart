import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:project/config/theme.config.dart';
import 'package:project/generated/l10n.dart';
import 'package:project/modules/job/models/bid.model.dart';
import 'package:project/modules/job/models/job.model.dart';
import 'package:project/modules/job/widgets/bidder_card.widget.dart';
import 'package:project/modules/job/widgets/job_description.widget.dart';
import 'package:project/modules/shared/widgets/image_carousel.widget.dart';

class JobDetails extends StatefulWidget {
  final JobModel job;

  const JobDetails({Key? key, required JobModel this.job}) : super(key: key);

  @override
  State<JobDetails> createState() => _JobDetailsState();
}

class _JobDetailsState extends State<JobDetails> {
  List<Bid> fetchedBids = []; // TODO fetch bids with workers for this job

  @override
  Widget build(BuildContext context) {
    final wideLayout = MediaQuery.of(context).size.width > 1100;
    final smallLayout = MediaQuery.of(context).size.width < 800;

    // setup differentiated based on platform (web or not)
    return smallLayout
        ? CustomScrollView(
            slivers: [
              SliverAppBar(
                  automaticallyImplyLeading: false,
                  expandedHeight: 400,
                  flexibleSpace: _carousel(context)),
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
        : wideLayout
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
      images: widget.job.images.map((image) => NetworkImage(image)).toList(),
    );
  }

  Widget _bidGridView(BuildContext context) {
    int bidPosition = 1;
    return LayoutBuilder(
      builder: (context, size) => Wrap(
        direction: Axis.horizontal,
        runSpacing: ThemeConfig.of(context).smallSpacing,
        spacing: ThemeConfig.of(context).smallSpacing,
        alignment: WrapAlignment.center,
        children: widget.job.bids
            .map(
              (b) => ConstrainedBox(
                // make a wrap child be just wide enough to fit two such
                // children on a row, taking into account the spacing
                constraints: BoxConstraints(
                    maxWidth: size.maxWidth / 2 -
                        ThemeConfig.of(context).smallSpacing),
                child: BidderCardWidget(
                  position: bidPosition++,
                  bid: b,
                ),
              ),
            )
            .toList(),
      ),
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
