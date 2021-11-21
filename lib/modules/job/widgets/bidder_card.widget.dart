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
          padding: EdgeInsets.all(ThemeConfig.of(context).smallSpacing),
          child: Row(
            children: [
              Icon(Icons.album),
              SizedBox(width: ThemeConfig.of(context).smallSpacing),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text('Username', style: ThemeConfig.of(context).subtitle1),
                    Text("<User's Offer>",
                        style: ThemeConfig.of(context).overline)
                  ],
                ),
              ),
              SizedBox(width: ThemeConfig.of(context).smallSpacing),
              Text('#1')
            ],
          ),
        ),
      ),
    );
  }
}
