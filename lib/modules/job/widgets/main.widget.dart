import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project/modules/job/widgets/jobCard.widget.dart';
import 'package:project/modules/job/widgets/sortAndFilterCard.widget.dart';

class JobMainWidget extends StatefulWidget {
  @override
  JobMainState createState() {
    return JobMainState();
  }

}

class JobMainState extends State<JobMainWidget> {
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        AppBar(
          title: Container(
            width: double.infinity,
            height: 40,
            color: Colors.white,
            child: TextField(
              decoration: InputDecoration(
                  hintText: 'Search for something',
                  prefixIcon: Icon(Icons.search),
            )
            ),
          ),
        ),
        Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              SortAndFilterWidget(),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  JobCardWidget(),
                  JobCardWidget(),
                ],
              ),
              Container(
                width: 400,
                height: 70,
                child: Card(
                  child: SizedBox(
                    child: ElevatedButton(
                      onPressed: () => {

                      },
                      child: Text('Post a Job'),
                    ),
                  ),
                ),
              )
            ],
        ),
      ],
    );
  }

}
