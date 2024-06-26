import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AnimatedPositionComponent extends StatefulWidget {
  const AnimatedPositionComponent(
      {super.key, required this.child, required this.beginOffset, required this.endOffset, required this.duration});

  final Widget child;
  final Offset beginOffset;
  final Offset endOffset;
  final Duration duration;

  @override
  State<AnimatedPositionComponent> createState() => _AnimatedPositionComponentState();
}

class _AnimatedPositionComponentState extends State<AnimatedPositionComponent> with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  Animation<Offset>? animation;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: widget.duration,
    )..repeat(reverse: true);
    animation = Tween(
      begin: widget.beginOffset,
      end: widget.endOffset,
    ).animate(animationController!);
    super.initState();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: animation!,
      child: widget.child,
    );
  }
}
