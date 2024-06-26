import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScrollableBodyComponent extends StatelessWidget {
  const ScrollableBodyComponent({Key? key, this.padding, required this.children}) : super(key: key);

  final EdgeInsets? padding;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraint.maxHeight, minWidth: 1.sw),
            child: Padding(
              padding: padding ?? EdgeInsets.zero,
              child: IntrinsicHeight(
                child: Column(
                  children: children,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
