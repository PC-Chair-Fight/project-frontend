import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:date_range_form_field/date_range_form_field.dart';

class SortAndFilterWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SortAndFilterCard();
  }
}

class SortAndFilterCard extends State<SortAndFilterWidget> {
  bool isToggled = false;
  bool checkbox = true;
  DateTimeRange? myDateTimeRange;
  String categoryDropwDownValue = "One";

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 510,
      width: 400,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Sort Jobs"),
                  SizedBox(
                    width: 50,
                  ),
                  Text("Ascending"),
                  Switch(
                    value: this.isToggled,
                    onChanged: (newValue) {
                      this.isToggled = !this.isToggled;
                    },
                  )
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Checkbox(
                      value: checkbox,
                      onChanged: (onChanged) {
                        this.checkbox = !this.checkbox;
                      }),
                  Text("Sort criteria"),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Checkbox(
                      value: checkbox,
                      onChanged: (onChanged) {
                        this.checkbox = !this.checkbox;
                      }),
                  Text("Sort criteria"),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Checkbox(
                      value: checkbox,
                      onChanged: (onChanged) {
                        this.checkbox = !this.checkbox;
                      }),
                  Text("Sort criteria"),
                ],
              ),
              Text("Filter Jobs"),
              DateRangeField(
                enabled: true,
                firstDate: DateTime.utc(2000, DateTime.january, 1),
                initialValue: DateTimeRange(
                    start: DateTime.now().subtract(Duration(days: 5)),
                    end: DateTime.now().add(Duration(days: 10))),
                decoration: InputDecoration(labelText: "Post date range"),
                validator: (value) {
                  if (value!.start.isBefore(DateTime.now())) {
                    return 'why';
                  }
                },
                onSaved: (value) {
                  setState(() {
                    myDateTimeRange = value!;
                  });
                },
              ),
              DateRangeField(
                enabled: true,
                firstDate: DateTime.utc(2000, DateTime.january, 1),
                initialValue: DateTimeRange(
                    start: DateTime.now().subtract(Duration(days: 5)),
                    end: DateTime.now().add(Duration(days: 10))),
                decoration: InputDecoration(labelText: "Deadline date range"),
                validator: (value) {
                  if (value!.start.isBefore(DateTime.now())) {
                    return 'why';
                  }
                },
                onSaved: (value) {
                  setState(() {
                    myDateTimeRange = value!;
                  });
                },
              ),
              DropdownButton<String>(
                icon: const Icon(Icons.arrow_downward),
                iconSize: 24,
                elevation: 16,
                value: this.categoryDropwDownValue,
                items: <String>['One', 'Two', 'Free', 'Four']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    this.categoryDropwDownValue = newValue!;
                  });
                },
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    child: ElevatedButton(
                      onPressed: () => {
                      },
                      child: Text("Apply"),
                    ),
                  ),
                  SizedBox(
                    child: ElevatedButton(
                      onPressed: () => {

                      },
                      child: Text("Clear"),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
