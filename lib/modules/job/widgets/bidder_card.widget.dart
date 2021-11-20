import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:project/config/theme.config.dart';

class BidderCardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Icon(Icons.album),
              Container(
                width: 180,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Username',
                          style: ThemeConfig.of(context).subtitle1),
                      Text("<User's Offer>",
                          style: ThemeConfig.of(context).overline)
                    ],
                  ),
                ),
              ),
              Text('#1')
            ],
          ),
        ),
      ),
    );
  }
}
