import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:project/config/theme.config.dart';
import 'package:project/modules/job/models/bid.model.dart';

class BidderCardWidget extends StatelessWidget {
  final Bid bid;
  final int position;

  const BidderCardWidget({Key? key, required this.bid, required this.position})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(ThemeConfig.of(context).smallSpacing),
          child: Row(
            children: [
              SizedBox(
                height: 24,
                width: 24,
                child: ClipOval(
                  child: Image(
                      image: (bid.worker?.user?.profilePicture == null
                              ? AssetImage('assets/images/placeholder/blank-profile-picture.png')
                              : NetworkImage(bid.worker!.user!.profilePicture!))
                          as ImageProvider),
                ),
              ),
              SizedBox(width: ThemeConfig.of(context).smallSpacing),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      '${bid.worker?.user?.firstName} '
                      '${bid.worker?.user?.lastName}',
                      style: ThemeConfig.of(context).subtitle1,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    Text('${bid.sum}', style: ThemeConfig.of(context).overline)
                  ],
                ),
              ),
              SizedBox(width: ThemeConfig.of(context).smallSpacing),
              Text(position >= 0 && position <= 3 ? '#${position}' : '')
            ],
          ),
        ),
      ),
    );
  }
}
