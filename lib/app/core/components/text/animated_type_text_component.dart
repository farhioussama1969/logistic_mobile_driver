import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:loogisti/app/core/styles/text_styles.dart';

class AnimatedTypeTextComponent extends StatelessWidget {
  const AnimatedTypeTextComponent({super.key, required this.text, this.textStyle, this.textAlign});

  final String text;
  final TextStyle? textStyle;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      totalRepeatCount: 1,
      animatedTexts: [
        TyperAnimatedText(
          text,
          textStyle: textStyle ?? TextStyles.largeBodyTextStyle(context),
          textAlign: textAlign ?? TextAlign.center,
        ),
      ],
    );
  }
}
