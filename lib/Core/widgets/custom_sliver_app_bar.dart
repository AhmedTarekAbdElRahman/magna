import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:magna/Core/utils/styles.dart';
import 'package:magna/constant.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({Key? key,required this.image, required this.text, required this.id})
      : super(key: key);
  final String image;
  final String text;
  final String id;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: MediaQuery.of(context).size.height / 3,
      pinned: true,
      stretch: true,
      backgroundColor: kPrimaryColor,

      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          text,
          style: Styles.style24B,
          textAlign: TextAlign.start,
        ),
        titlePadding: text=='Profile'? const EdgeInsets.all(15):null,
        background: Hero(
          tag: id,
          child: CachedNetworkImage(
            imageUrl: image,
            placeholder: (context, url) => Container(
              color: Colors.grey[300],
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
        ),
      ),
    );
  }
}
