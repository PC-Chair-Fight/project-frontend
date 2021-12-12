import 'package:flutter/material.dart';
import 'package:project/config/theme.config.dart';
import 'package:project/modules/shared/widgets/card_grid_entry.widget.dart';

class NewJobImage extends StatelessWidget {
  final ImageProvider image;
  final void Function() onRemoved;

  const NewJobImage({
    Key? key,
    required ImageProvider this.image,
    required this.onRemoved,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CardGridEntry(
      aspectRatio: 1.78,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image(
            image: image,
            fit: BoxFit.cover,
          ),
          Align(
            alignment: Alignment.topRight,
            child: SizedBox(
              width: 24,
              height: 24,
              child: RawMaterialButton(
                fillColor: ThemeConfig.of(context).backgroundColor,
                elevation: ThemeConfig.of(context).smallElevation,
                shape: CircleBorder(),
                child: Icon(
                  Icons.close,
                  color: ThemeConfig.of(context).primaryColor,
                ),
                onPressed: onRemoved,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
