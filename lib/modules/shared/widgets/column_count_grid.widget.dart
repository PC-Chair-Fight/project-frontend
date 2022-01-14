import 'package:flutter/material.dart';

class ColumnCountGrid extends StatelessWidget {
  final List<Widget> children;
  final double rowSpacing;
  final double columnSpacing;
  final int count;
  final WrapAlignment alignment;
  final WrapCrossAlignment rowAlignment;
  final WrapAlignment columnAlignment;
  final double minRowHeight;
  final double maxRowHeight;

  ColumnCountGrid({
    Key? key,
    required List<Widget> this.children,
    required int this.count,
    double this.rowSpacing = 0.0,
    double this.columnSpacing = 0.0,
    double this.minRowHeight = 0.0,
    double this.maxRowHeight = double.infinity,
    WrapAlignment this.alignment = WrapAlignment.start,
    WrapCrossAlignment this.rowAlignment = WrapCrossAlignment.start,
    WrapAlignment this.columnAlignment = WrapAlignment.start,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, size) => Wrap(
        direction: Axis.horizontal,
        runSpacing: rowSpacing,
        spacing: columnSpacing,
        alignment: alignment,
        crossAxisAlignment: rowAlignment,
        runAlignment: columnAlignment,
        children: children
            .map(
              (c) => ConstrainedBox(
                // make a wrap child be just wide enough to fit count such
                // children on a row, taking into account the spacing
                constraints: BoxConstraints(
                  maxWidth: (size.maxWidth - columnSpacing * (count - 1)) / count,
                  minHeight: minRowHeight,
                  maxHeight: maxRowHeight,
                ),
                child: c,
              ),
            )
            .toList(),
      ),
    );
  }
}
