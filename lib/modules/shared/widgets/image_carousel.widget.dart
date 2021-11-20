import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:project/config/theme.config.dart';

class ImageCarouselWidget extends StatefulWidget {
  final List<ImageProvider> images;
  final double? height;
  final double? width;

  const ImageCarouselWidget(
      {Key? key, required this.images, this.width, this.height})
      : super(key: key);

  @override
  _ImageCarouselWidgetState createState() => _ImageCarouselWidgetState();
}

class _ImageCarouselWidgetState extends State<ImageCarouselWidget> {
  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(initialPage: 0);

    return Container(
      height: widget.height,
      width: widget.width,
      child: Stack(
        children: [
          PageView(
            controller: controller,
            children: [
              ...widget.images.map((image) => Image(
                    image: image,
                    fit: BoxFit.cover,
                  ))
            ],
          ),
          Positioned.fill(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ...[
                  {
                    'icon': Icons.chevron_left,
                    'callback': () {
                      controller.previousPage(
                        duration: ThemeConfig.of(context)!.mediumDuration,
                        curve: Curves.easeOut,
                      );
                    }
                  },
                  {
                    'icon': Icons.chevron_right,
                    'callback': () {
                      return controller.nextPage(
                        duration: ThemeConfig.of(context)!.mediumDuration,
                        curve: Curves.easeOut,
                      );
                    },
                  },
                ].map(
                  (params) => GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: params['callback'] as void Function(),
                    child: SizedBox(
                      width: 48,
                      child: ClipRect(
                        child: BackdropFilter(
                          filter: ImageFilter.compose(
                            outer: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                            inner: ImageFilter.compose(
                              outer: ImageFilter.matrix(
                                Matrix4.translationValues(0, -10, 0).storage,
                              ),
                              inner: ImageFilter.matrix(
                                Matrix4.diagonal3Values(1.05, 1.05, 1.05)
                                    .storage,
                              ),
                            ),
                          ),
                          child: Container(
                            color: Colors.black12,
                            child: Icon(
                              params['icon'] as IconData,
                              color: Colors.white,
                              size: 32,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
