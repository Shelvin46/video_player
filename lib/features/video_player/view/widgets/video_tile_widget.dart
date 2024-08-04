import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class VideoTile extends StatelessWidget {
  const VideoTile({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: context.height * 0.150,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: context.height * 0.150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: const DecorationImage(
                image: CachedNetworkImageProvider(
                  "https://www.crowdcontent.com/blog/wp-content/uploads/sites/16/video-take-486x354.png",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ).flexible(),
          10.0.widthBox,
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: context.textTheme.displaySmall,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              )
            ],
          ).expanded(flex: 2),
        ],
      ),
    );
  }
}
