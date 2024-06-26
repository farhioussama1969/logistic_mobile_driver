import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:loogisti/app/core/constants/icons_assets_constants.dart';
import 'package:loogisti/app/core/constants/strings_assets_constants.dart';
import 'package:loogisti/app/core/styles/main_colors.dart';
import 'package:loogisti/app/core/styles/text_styles.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'header_component.dart';

class WebViewComponent extends StatefulWidget {
  const WebViewComponent({Key? key, required this.url, this.onExitWebView, this.title}) : super(key: key);

  final String url;
  final Function? onExitWebView;
  final String? title;

  @override
  State<WebViewComponent> createState() => _WebViewComponentState();
}

class _WebViewComponentState extends State<WebViewComponent> {
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    WebViewController? webViewController;
    return WillPopScope(
      onWillPop: () async {
        if (widget.onExitWebView != null) {
          widget.onExitWebView!();
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: HeaderComponent(
          title: widget.title,
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            color: MainColors.backgroundColor(context),
          ),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  child: Stack(
                    children: [
                      WebView(
                        initialUrl: widget.url,
                        javascriptMode: JavascriptMode.unrestricted,
                        zoomEnabled: true,
                        onWebViewCreated: (controller) {
                          webViewController = controller;
                        },
                        onPageFinished: (url) {
                          setState(() {
                            isLoading = false;
                          });
                        },
                        onPageStarted: (url) {},
                      ),
                      if (isLoading)
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            LoadingAnimationWidget.beat(
                              color: MainColors.primaryColor,
                              size: 70.h,
                            ),
                            SizedBox(height: 20.h),
                            Center(
                              child: Text(
                                '${StringsAssetsConstants.pleaseWait}...',
                                style: TextStyles.mediumBodyTextStyle(context),
                              ),
                            ),
                          ],
                        )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
