import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/config/theme.config.dart';
import 'package:project/modules/job/widgets/bidderCard.widget.dart';

class JobCardWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return JobCard();
  }
}

class JobCard extends State<JobCardWidget> {
  static const String fillerText =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
      'Fusce rhoncus urna ut ex rutrum convallis. Suspendisse potenti. Vivamus nisl ipsum, '
      'ornare non sodales nec, tincidunt eu eros. Nam sollicitudin ante ligula. ';

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 270,
      width: 600,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Job Title",
                style: ThemeConfig.of(context)!.headline5,
                textAlign: TextAlign.start,
              ),
              ConstrainedBox(
                constraints: BoxConstraints(maxHeight: 67),
                child: Text(fillerText, style: ThemeConfig.of(context)!.body2),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [BidderCardWidget(), BidderCardWidget()],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [Text("See job details"), Icon(Icons.album)],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("Posted by"),
                  Icon(Icons.album),
                  Text("Username"),
                  Text("on"),
                  Text("99/88/2000")
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
