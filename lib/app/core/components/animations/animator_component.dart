import 'dart:async';

import 'package:flutter/material.dart';

class AnimatorComponent extends StatefulWidget {
  final Widget child;
  final Duration time;

  const AnimatorComponent({super.key, required this.child, required this.time});

  @override
  _AnimatorComponentState createState() => _AnimatorComponentState();
}

class _AnimatorComponentState extends State<AnimatorComponent> with SingleTickerProviderStateMixin {
  Timer? timer;
  AnimationController? animationController;
  Animation? animation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(duration: const Duration(milliseconds: 290), vsync: this);
    animation = CurvedAnimation(parent: animationController!, curve: Curves.easeInOut);
    timer = Timer(widget.time, animationController!.forward);
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
    timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation!,
      child: widget.child,
      builder: (BuildContext context, Widget? child) {
        return Opacity(
          opacity: animation?.value,
          child: Transform.translate(
            offset: Offset(0.0, (1 - animation?.value) * 20),
            child: child,
          ),
        );
      },
    );
  }
}

Timer? timer;
Duration duration = const Duration();

wait() {
  if (timer == null || timer?.isActive == false) {
    timer = Timer(const Duration(microseconds: 120), () {
      duration = const Duration();
    });
  }
  duration += const Duration(milliseconds: 100);
  return duration;
}

class WidgetAnimator extends StatelessWidget {
  final Widget child;

  const WidgetAnimator(this.child, {super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatorComponent(time: wait(), child: child);
  }
}
