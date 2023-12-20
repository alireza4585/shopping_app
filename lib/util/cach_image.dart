import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedImage extends StatelessWidget {
  String? imageUrl;
  double radius;
  bool banner;
  CachedImage({super.key, this.imageUrl, this.radius = 0, this.banner = false});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(radius)),
      child: CachedNetworkImage(
          fit: banner ? BoxFit.fill : BoxFit.cover,
          imageUrl: imageUrl ??
              'http://startflutter.ir/api/files/f5pm8kntkfuwbn1/78q8w901e6iipuk/rectangle_63_7kADbEzuEo.png',
          errorWidget: (context, url, error) => Container(
                color: Colors.red[100],
              ),
          placeholder: (context, url) => Container(
                color: Colors.grey,
              )),
    );
  }
}
