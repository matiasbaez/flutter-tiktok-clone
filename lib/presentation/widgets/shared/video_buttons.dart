

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import 'package:tiktok_clone/config/helpers/human_formats.dart';

import 'package:tiktok_clone/domain/domain.dart';

class VideoButtons extends StatelessWidget {

  final VideoPost video;

  const VideoButtons({
    Key? key,
    required this.video
  }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Column(
      children: [
        _CustomIconButton(
          value: video.likes,
          color: Colors.red,
          iconData: Icons.favorite,
          onPressed: () {},
        ),

        _CustomIconButton(
          value: video.views,
          iconData: Icons.remove_red_eye_sharp,
          onPressed: () {},
        ),

        SpinPerfect(
          infinite: true,
          duration: const Duration(seconds: 5),
          child: _CustomIconButton(
            value: 0,
            iconData: Icons.play_circle_outline,
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}

class _CustomIconButton extends StatelessWidget {

  final int value;
  final IconData iconData;
  final Color? color;
  final onPressed;

  const _CustomIconButton({
    super.key,
    required this.value,
    required this.iconData,
    this.onPressed,
    color
  }) : color = color ?? Colors.white;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          icon: Icon( iconData, color: color, size: 30 ),
          onPressed: onPressed,
        ),

        if (value > 0)
        Text(HumanFormats.humanReadbleNumber(value.toDouble())),
      ]
    );
  }
}
