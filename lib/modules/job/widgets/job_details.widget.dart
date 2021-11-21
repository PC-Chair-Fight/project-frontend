import 'dart:io';

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

    // common widgets
    final carousel = ImageCarouselWidget(
        height: 400,
        images: (widget.job.images ?? [])
            .where((image) => image.url != null)
            .map((image) => NetworkImage(image.url!))
            .toList());
    final bidGridView = GridView.count(
      crossAxisSpacing: ThemeConfig.of(context).smallSpacing,
      mainAxisSpacing: ThemeConfig.of(context).smallSpacing,
      childAspectRatio: 3, // TODO somehow compute this
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
      ].map((w) => Center(child: w)).toList(), // TODO fill with fetched bids
    );
    final bidButton = ElevatedButton(
      onPressed: () {},
      child: Text('Bid'),
    );

    // setup differentiated based on platform (web or not)
    return //smallLayout ?
        CustomScrollView(
      slivers: [
        SliverAppBar(
            automaticallyImplyLeading: false,
            expandedHeight: 400,
            flexibleSpace: carousel),
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
                  padding: EdgeInsets.all(ThemeConfig.of(context).appMargin),
                  child: bidGridView,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: ThemeConfig.of(context).appMargin),
                  child: bidButton,
                ),
                SizedBox(
                  height: ThemeConfig.of(context).appMargin,
                )
              ],
            ),
          ),
        )
      ],
    );
    // : wideLayout
    //     ? Row(
    //         crossAxisAlignment: CrossAxisAlignment.stretch,
    //         mainAxisSize: MainAxisSize.min,
    //         children: [
    //           Card(
    //             clipBehavior: Clip.antiAliasWithSaveLayer,
    //             child: Column(
    //               mainAxisSize: MainAxisSize.min,
    //               children: [
    //                 // carousel,
    //                 JobDescription(
    //                   name: widget.job.name,
    //                   description: widget.job.description,
    //                 )
    //               ],
    //             ),
    //           ),
    //         ],
    //       )
    //     : Container();
  }
}
