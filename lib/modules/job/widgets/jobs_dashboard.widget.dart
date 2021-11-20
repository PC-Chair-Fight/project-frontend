import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project/modules/job/widgets/job_card.widget.dart';
import 'package:project/modules/job/widgets/jobs_sort_filter_card.widget.dart';

class JobsDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
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
              ),
            ),
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            JobsSortFilterCard(),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                JobCard(),
                JobCard(),
              ],
            ),
            Container(
              width: 400,
              height: 70,
              child: Card(
                child: SizedBox(
                  child: ElevatedButton(
                    onPressed: () => {},
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
