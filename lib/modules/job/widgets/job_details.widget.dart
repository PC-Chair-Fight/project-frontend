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
  final Job job;

  const JobDetails({Key? key, required Job this.job}) : super(key: key);

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
                        horizontal: ThemeConfig.of(context).appMargin,
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
      images: (widget.job.images ?? [])
          .where((image) => image.url != null)
          .map((image) => NetworkImage(image.url!))
          .toList(),
    );
  }

  Widget _bidGridView(BuildContext context) {
    return GridView.count(
      crossAxisSpacing: ThemeConfig.of(context).smallSpacing,
      mainAxisSpacing: ThemeConfig.of(context).smallSpacing,
      childAspectRatio: 3,
      // TODO somehow compute this
      shrinkWrap: true,
      primary: false,
      padding: EdgeInsets.all(
        ThemeConfig.of(context).smallSpacing,
      ),
      crossAxisCount: 2,
      children: [
        BidderCardWidget(),
        BidderCardWidget(),
        BidderCardWidget(),
        BidderCardWidget(),
      ]
          .map(
            (bidderCardWidget) => Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [bidderCardWidget],
              ),
            ),
          )
          .toList(), // TODO fill with fetched bids
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
