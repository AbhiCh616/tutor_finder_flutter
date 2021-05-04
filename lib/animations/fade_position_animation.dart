import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';

enum AniProps { opacity, translateX, translateY }

class FadePositionAnimation extends StatelessWidget {
  final double delay;
  final double startOpacity;
  final double finalOpacity;
  final double startX;
  final double startY;
  final Widget child;

  FadePositionAnimation(
      {this.delay = 0.0,
      this.startOpacity = 0.0,
      this.finalOpacity = 1.0,
      this.startX = 0.0,
      this.startY = 0.0,
      required this.child});

  @override
  Widget build(BuildContext context) {
    final _tween = MultiTween<AniProps>()
      ..add(AniProps.opacity, startOpacity.tweenTo(finalOpacity),
          500.milliseconds)
      ..add(AniProps.translateX, startX.tweenTo(0.0), 500.milliseconds,
          Curves.easeOut)
      ..add(AniProps.translateY, startY.tweenTo(0.0), 500.milliseconds,
          Curves.easeOut);

    return PlayAnimation<MultiTweenValues<AniProps>>(
      delay: Duration(milliseconds: (500 * delay).round()),
      duration: _tween.duration,
      tween: _tween,
      child: child,
      builder: (context, child, value) => Opacity(
        opacity: value.get(AniProps.opacity),
        child: Transform.translate(
          offset: Offset(
            value.get(AniProps.translateX),
            value.get(AniProps.translateY),
          ),
        ),
      ),
    );
  }
}
