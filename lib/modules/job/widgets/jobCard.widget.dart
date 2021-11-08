import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class JobCardWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return JobCard();
  }

}

class JobCard extends State<JobCardWidget> {
  static const String fillerText = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
      'Fusce rhoncus urna ut ex rutrum convallis. Suspendisse potenti. Vivamus nisl ipsum, '
      'ornare non sodales nec, tincidunt eu eros. Nam sollicitudin ante ligula. ';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const ListTile(
              title: Text('Job Title'),
            ),
            const ListTile(
              title: Text(
                fillerText,
                textAlign: TextAlign.left,
              )
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Expanded(child:
                  InkWell(
                    splashColor: Colors.blue.withAlpha(30),
                    onTap: () {
                      print('Card tapped.');
                    },
                    child: Card(
                      child: ListTile(
                        leading: Icon(Icons.album),
                        title: Text("test"),
                        subtitle: Text("subtext"),
                      ),
                    ),
                  )
                ),
                Expanded(
                  child: InkWell(
                    onTap: (){
                      print('Another card tapped.');
                    },
                    child: Card(
                      child: ListTile(
                        leading: Icon(Icons.album),
                        title: Text("test"),
                        subtitle: Text("another text"),
                      ),
                    ),
                  ),

                )

                ],
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Posted by"
                ),
                SizedBox(width: 12,),
                Card(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.album),
                      TextButton(
                          onPressed: (){
                            print("Poster name clicked");
                          },
                          child: Text(
                            "Username"
                          )
                      )
                    ],
                  ),
                ),
                SizedBox(width: 12,),
                Text(
                  "on 99/99/3000"
                ),
                SizedBox(width: 12,),
              ],
            )
            ]
          )
        )
    );
  }

}