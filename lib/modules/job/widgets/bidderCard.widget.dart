import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:project/config/theme.config.dart';

class BidderCardWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BidderCard();
  }
}

class BidderCard extends State<BidderCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: Card(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Icon(Icons.album),
            Container(
              width: 180,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Username",
                      style: TextStyle(
                        fontSize: 14
                      ),
                    ),
                    Text(
                      "<User's Offer>",
                      style: TextStyle(
                        fontSize: 14
                      ),
                    )
                  ],
                ),
              ),
            ),
            Text("#1")
          ],
        ),
      ),
    );
  }
}
